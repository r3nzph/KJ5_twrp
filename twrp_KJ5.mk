#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

#Inherit emulated_storage properties
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit userspace reboot properties
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from KJ5 device
$(call inherit-product, device/tecno/KJ5/device.mk)

PRODUCT_DEVICE := KJ5
PRODUCT_NAME := twrp_KJ5
PRODUCT_BRAND := tecno
PRODUCT_MODEL := Tecno Spark 20
PRODUCT_MANUFACTURER := TECNO

PRODUCT_GMS_CLIENTID_BASE := android-transsion
