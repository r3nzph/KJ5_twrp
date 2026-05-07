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
# Display / UI (FIXED)
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

# IMPORTANT:
# REMOVE BAD SCALING VALUES
# DO NOT USE portrait_xhdpi
# DO NOT USE TW_RESOLUTION
# DO NOT USE TW_FRAMERATE

TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 120

# =========================
# Device
# =========================
TARGET_OTA_ASSERT_DEVICE := KJ5

# =========================
# Kernel (PREBUILT)
# =========================
TARGET_NO_KERNEL := false
TARGET_FORCE_PREBUILT_KERNEL := true

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

BOARD_KERNEL_IMAGE_NAME := kernel

BOARD_RAMDISK_USE_LZ4 := true
BOARD_USES_GENERIC_KERNEL_IMAGE := false

# =========================
# Boot Image
# =========================
BOARD_BOOT_HEADER_VERSION := 4

BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_DTB_OFFSET := 0x0bc08000

BOARD_PAGE_SIZE := 4096

BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
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

BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_LARGE_FILESYSTEM := true
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

TW_INCLUDE_LOGICAL := true

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_RECOVERY_UI_LIB := librecovery_ui_default

# =========================
# AVB
# =========================
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# =========================
# Security patch level
# =========================
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# =========================
# Crypto
# =========================
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

BOARD_USES_METADATA_PARTITION := true
TW_USE_METADATA_PARTITION := true

TW_USE_FSCRYPT_POLICY := 2

TW_PREPARE_DATA_MEDIA_EARLY := true

TW_FORCE_KEYMASTER_VER := true
TW_DEFAULT_KEYMASTER_VERSION := 4.1

# TW_INCLUDE_FSCRYPT := true

TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# =========================
# Debug
# =========================
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TWRP_EVENT_LOGGING := true

# =========================
# Storage / MTP / OTG
# =========================
RECOVERY_SDCARD_ON_DATA := true

TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb

TW_USES_OTG_USB := true

# IMPORTANT FIX
TW_NO_USB_STORAGE := false
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_EXFAT := true

# Screenshot fix
TW_SCREENSHOT_PATH := /data/media/0/Pictures/Screenshots

# =========================
# Tools
# =========================
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_FB2PNG := true

TARGET_USES_MKE2FS := true

TW_USE_TOOLBOX := true

# =========================
# Extra UI
# =========================
TW_ALLOW_FORMAT_DATA := true
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_APEX := true
TW_NO_LEGACY_PROPS := true

# =========================
# Props
# =========================
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# =========================
# Thermal
# =========================
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone4/temp

# =========================
# Device Info
# =========================
TW_DEVICE_VERSION := KJ5
