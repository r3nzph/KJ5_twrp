# Base
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# GSI (KEEP for hybrid OTA support)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Virtual A/B OTA (KEEP — this is what makes it hybrid)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# TWRP core
$(call inherit-product, vendor/twrp/config/common.mk)

# Device
$(call inherit-product, device/tecno/KJ5/device.mk)

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Identity
PRODUCT_DEVICE := KJ5
PRODUCT_NAME := twrp_KJ5
PRODUCT_BRAND := TECNO
PRODUCT_MODEL := TECNO KJ5
PRODUCT_MANUFACTURER := TECNO

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sys_tssi_64_tecno-user 13 TP1A.220624.014 629930 release-keys"

BUILD_FINGERPRINT :=TECNO/KJ5-OP/TECNO-KJ5:12/SP1A.210812.016/250115V1871:user/release-keys
