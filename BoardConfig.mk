# ============================================================
# BoardConfig.mk — TECNO Spark 20 (KJ5 / MT6768)
#
# This file includes the MT6768 Common Tree and only defines
# device-specific values for the KJ5 (TECNO Spark 20).
# ============================================================

DEVICE_PATH := device/tecno/KJ5

# Include MT6768 Common Tree
include device/transsion/mt6768-common/BoardConfigCommon.mk

# ============================================================
# DEVICE-SPECIFIC CONFIGURATION
# ============================================================

# Device Identity
TARGET_BOOTLOADER_BOARD_NAME := KJ5
TARGET_OTA_ASSERT_DEVICE := KJ5

# Display
TARGET_SCREEN_DENSITY := 320
TW_THEME := portrait_hdpi

# Partition sizes (KJ5-specific)
BOARD_MAIN_SIZE := 9122611200
BOARD_SUPER_PARTITION_SIZE := 9122611200
BOARD_SUPER_PARTITION_SUPER_DEVICE_SIZE := 9122611200
BOARD_SUPER_IMAGE_SIZE := 9122611200

BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_RESERVED_SIZE := 0
BOARD_USES_VENDOR_BOOTIMAGE := true

# Vendor modules for KJ5 display/touch
TW_LOAD_VENDOR_MODULES := "mediatek-drm.ko mtk_panel_ext.ko pwm-mtk-disp.ko leds-mtk-disp.ko tran_drm_panel_i2c.ko"

# Additional FBE flags for KJ5
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_PREPARE_DATA_MEDIA_EARLY := true
TW_REQUIRE_FBE := true

# Device version
TW_DEVICE_VERSION := Spark 20 (KJ5)
