# OTG Kernel Module Patching Guide

A guide for patching OTG (USB On-The-Go) kernel modules that fail due to missing device tree node lookups.

## The Problem

OTG doesn't work on this devices in recovery mode even though the hardware supports it.

### Symptoms
- `tran_otg.ko` module loads without errors
- But USB OTG functionality doesn't work
- No errors in dmesg, or generic "probe failed" messages

### Root Cause

The OTG driver calls Linux device tree functions to look up hardware configuration:
- `of_find_node_opts_by_path()` - Find DT node by path
- `of_find_property()` - Find property in DT node
- `of_get_named_gpio()` - Get GPIO from DT

When these lookups fail (node doesn't exist in the device's DTB), the probe function returns an error and OTG never initializes.

Common failing paths:
- `/chosen@0` - Almost never exists
- `/chosen` - May not exist
- Device-specific paths that weren't added to the DTB

## The Solution

Instead of modifying the device tree (which requires rebuilding the DTB), patch the kernel module to bypass failing DT lookups.

### Target Pattern

The vulnerable code pattern in ARM64:
```asm
BL  of_find_node_opts_by_path   ; Call DT lookup function
CBNZ x0, <error_label>        ; Branch if lookup failed (x0=0)
```

When `of_find_node_opts_by_path()` fails, it returns 0 (NULL). The CBNZ checks this and jumps to an error handler.

**The fix**: Replace CBNZ with NOP so the code continues even when the lookup fails.

### Byte Replacement

| Architecture | Original | Patched | Effect |
|--------------|----------|---------|--------|
| ARM64 | `cbnz x0, #offset` | `nop` | Always continue |
| ARM32 | `cmp r0, #0` / `bne` | NOP sequence | Bypass check |

For ARM64, the NOP instruction bytes are: `1f 20 03 d5`

## How to Patch

### Method 1: Using dd (Quick)

```bash
# Backup original
cp tran_otg.ko tran_otg.ko.bak

# Patch at specific offset (example: 0x1f64)
printf '\x1f\x20\x03\xd5' | dd of=tran_otg.ko bs=1 seek=$((0x1f64)) conv=notrunc
```

### Method 2: Using radare2

```bash
# Open in write mode
r2 -w -a arm -b arm64 tran_otg.ko

# Seek to offset
s 0x1f64

# Write NOP
w 1f2003d5

# Verify
pd 1 @ 0x1f64

# Save and quit
wq
```

### Method 3: Using r2 in batch mode

```bash
r2 -w -a arm -b arm64 -c 's 0x1f64; w 1f2003d5; pd 1;wq' tran_otg.ko
```

## Real Example: tran_otg.ko

### Device
- itel P661N (MediaTek Dimensity 6080)
- Kernel: 5.10.226-android12-9+

### Finding the Target

1. List functions:
   ```bash
   r2 -q -c 'is' tran_otg.ko | grep -E "tran_|otg_"
   ```

2. Find `of_find_node_opts_by_path` calls:
   ```bash
   r2 -q -c 'aaa;pdf @ sym.tran_otg_probe' tran_otg.ko | grep of_find_node
   ```

3. Look at adjacent strings:
   ```bash
   r2 -q -c 'iz' tran_otg.ko | grep -E "chosen|otg|tran"
   ```

### Results

| Offset | String | Action |
|--------|--------|--------|
| `0x1f60` | `/chosen@0` | **PATCH** - doesn't exist |
| `0x1f74` | `/chosen` | Keep check - may exist |

### Patched Bytes

```
File offset 0x1f64:
  Original: 40 01 00 b5  (cbnz x0, #0x38)
  Patched:  1f 20 03 d5  (nop)
```

### Verification

```bash
# Before
$ xxd tran_otg.ko | grep "^00001f6"
00001f60: 0000 0094 4001 00b5 0000 0090 0000 0091

# After
$ xxd tran_otg.ko | grep "^00001f6"
00001f60: 0000 0094 1f20 03d5 0000 0090 0000 0091
```

## Important Notes

### 1. Rebuild May Be Needed

After patching, run `modpost` or rebuild the module to fix relocations:
```bash
make M=path/to/module modules
```

### 2. May Cause Bootloop

Patching the wrong CBNZ can cause bootloops. The rule:
- **NOP** checks for non-essential nodes (`/chosen*`)
- **Keep** checks for essential hardware (`/soc/*`, `/usb*`)

If bootloops:
- Restore original module
- Try patching a different CBNZ instead
- Or patch both CBNZs to NOP (if both paths don't exist)

## References

- Linux Kernel DT Documentation: `Documentation/devicetree/`
- ARM64 Instruction Encoding: AArch64 instruction set reference
- radare2 Book: https://book.rada.re/

---

**Last updated**: 2026-04-08
