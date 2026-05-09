#
# Copyright (C) 2025 The Android Open Source Project
#

LOCAL_PATH := device/tecno/KJ5

# ============================================
# A/B OTA
# ============================================
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor_boot \
    system \
    system_ext \
    product \
    vendor

# ============================================
# OTA / Update Engine
# ============================================
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# ============================================
# Boot Control HAL
# ============================================
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    bootctrl.mt6768

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.mt6768 \
    libgptutils \
    libz \
    libcutils

# ============================================
# Fastbootd
# ============================================
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock
