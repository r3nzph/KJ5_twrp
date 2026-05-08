# =========================
# Device Path
# =========================
DEVICE_PATH := device/tecno/KJ5

# =========================
# Architecture
# =========================
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true
TARGET_USES_64_BIT_BINDER := true

BOARD_USES_MTK_HARDWARE := true

# =========================
# Bootloader
# =========================
TARGET_BOOTLOADER_BOARD_NAME := KJ5
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# =========================
# Build Fixes
# =========================
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
ALLOW_MISSING_DEPENDENCIES := true

# =========================
# Dynamic Partitions
# =========================
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

# =========================
# Display / UI
# =========================
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1612
TARGET_SCREEN_DENSITY := 320

TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

TW_STATUS_ICONS_ALIGN := center
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_BLANK := true
TW_NO_SCREEN_TIMEOUT := true
TW_USE_NEW_MINADBD := true

TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 120

# =========================
# Device
# =========================
TARGET_OTA_ASSERT_DEVICE := KJ5

# =========================
# 🔥 GKI / VENDOR BOOT FIX
# =========================
TARGET_NO_KERNEL := true

BOARD_BOOT_HEADER_VERSION := 4
BOARD_RAMDISK_USE_LZ4 := true

BOARD_KERNEL_PAGESIZE := 4096

BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2

# 🔥 IMPORTANT FIX (THIS WAS MISSING)
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline "$(BOARD_VENDOR_CMDLINE)"
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# =========================
# DTBO
# =========================
BOARD_KERNEL_SEPARATED_DTBO := true

# =========================
# Partitions
# =========================
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864

BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 9122611200
BOARD_SUPER_PARTITIONS_SIZE := 9122611200

BOARD_MAIN_PARTITION_LIST += \
    system \
    system_ext \
    product \
    vendor

# =========================
# Filesystems
# =========================
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# =========================
# Platform
# =========================
TARGET_BOARD_PLATFORM := mt6768
BOARD_VNDK_VERSION := current

# =========================
# Recovery
# =========================
TARGET_NO_RECOVERY := true

BOARD_USES_RECOVERY_AS_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true

BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

TW_INCLUDE_LOGICAL := true

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# =========================
# Crypto
# =========================
# TW_INCLUDE_CRYPTO := true
# TW_INCLUDE_CRYPTO_FBE := true
# TW_USE_FSCRYPT_POLICY := 2

# =========================
# AVB
# =========================
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# =========================
# Debug
# =========================
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# =========================
# Storage
# =========================
RECOVERY_SDCARD_ON_DATA := true
TW_HAS_MTP := true
TW_USES_OTG_USB := true

TW_NO_USB_STORAGE := false
TW_INCLUDE_EXFAT := true
TW_INCLUDE_NTFS_3G := true

# =========================
# Tools
# =========================
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_FB2PNG := true
TARGET_USES_MKE2FS := true
TW_USE_TOOLBOX := true

# =========================
# UI
# =========================
TW_ALLOW_FORMAT_DATA := true
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_APEX := true
TW_NO_LEGACY_PROPS := true
TW_EXCLUDE_TZ_DATA := true

# =========================
# Device Info
# =========================
TW_DEVICE_VERSION := KJ5
