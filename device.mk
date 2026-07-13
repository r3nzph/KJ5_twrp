# ============================================================
# device.mk — TECNO Spark 20 (KJ5 / MT6768)
#
# Inherits the MT6768 Common Tree and defines only
# device-specific additions for KJ5.
# ============================================================

# Inherit MT6768 Common Tree
$(call inherit-product, device/transsion/mt6768-common/common.mk)

# ============================================================
# KJ5-SPECIFIC AOSP PACKAGES
# ============================================================

# Vold & Storage
PRODUCT_PACKAGES += \
    vold \
    vdc

# Keystore
PRODUCT_PACKAGES += \
    keystore \
    keystore_auth

# AOSP HIDL HAL interfaces (built from source)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0 \
    android.hardware.boot@1.1 \
    android.hardware.boot@1.2 \
    android.hardware.health@1.0 \
    android.hardware.health@2.0 \
    android.hardware.health@2.1 \
    android.hardware.health.storage@1.0 \
    android.hardware.gatekeeper@1.0 \
    android.hardware.keymaster@3.0 \
    android.hardware.keymaster@4.0 \
    android.hardware.keymaster@4.1

# Core system libraries
PRODUCT_PACKAGES += \
    libhardware \
    libhardware_legacy \
    libhidlbase \
    libhidltransport \
    libhwbinder \
    libutils \
    liblog \
    liblogwrap \
    libbase \
    libcutils \
    libcrypto \
    libssl \
    libz \
    libunwindstack \
    libbacktrace \
    libf2fs \
    libext4 \
    libext4_utils \
    libfscrypt \
    libion \
    libdmctl \
    libgsi \
    libcap \
    libdiskconfig \
    libf2fs_sparseblock \
    libincfs \
    libkeyutils \
    libsysutils \
    libselinux \
    libkeymaster_portable \
    lib_android_keymaster_keymint_utils \
    libcppbor_external \
    libcppcose_rkp \
    libsoft_attestation_cert \
    libkeymint_support \
    libui \
    libgui \
    libsync

# ============================================================
# RELINK LIBRARIES (AOSP-built)
# ============================================================
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper_aidl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeystore2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libfscrypt.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppbor_external.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppcose_rkp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsoft_attestation_cert.so

# ============================================================
# VENDOR PREBUILT RELINK LIBRARIES
# These vendor .so files from the stock ROM are needed in the
# recovery ramdisk for runtime symbol resolution by keymaster,
# gatekeeper, TEE, and other vendor HAL services.
# ============================================================
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_VENDOR)/lib64/libkeymaster41.so \
    $(TARGET_OUT_VENDOR)/lib64/libkeymaster4.so \
    $(TARGET_OUT_VENDOR)/lib64/libkeymaster4support.so \
    $(TARGET_OUT_VENDOR)/lib64/libkeymaster4_1support.so \
    $(TARGET_OUT_VENDOR)/lib64/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_VENDOR)/lib64/libkeymaster_messages.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.mediatek.hardware.keymaster_attestation@1.0.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.mediatek.hardware.keymaster_attestation@1.1.so \
    $(TARGET_OUT_VENDOR)/lib64/libion_mtk.so \
    $(TARGET_OUT_VENDOR)/lib64/libMcClient.so \
    $(TARGET_OUT_VENDOR)/lib64/libTEECommon.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.trustonic.tee@1.0.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.trustonic.tee@1.1.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.trustonic.tee.tui@1.0.so \
    $(TARGET_OUT_VENDOR)/lib64/libtranlog.so \
    $(TARGET_OUT_VENDOR)/lib64/libTran_Log.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.transsion.hardware.tranlog@1.0.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.transsion.hardware.tranlogconfig@1.0.so \
    $(TARGET_OUT_VENDOR)/lib64/libTran_mtkPowerAPI.so \
    $(TARGET_OUT_VENDOR)/lib64/libmtkcutils.so \
    $(TARGET_OUT_VENDOR)/lib64/libmtkhardware_legacy.so \
    $(TARGET_OUT_VENDOR)/lib64/libmtkutils.so \
    $(TARGET_OUT_VENDOR)/lib64/libbwc.so \
    $(TARGET_OUT_VENDOR)/lib64/libgralloc_extra.so \
    $(TARGET_OUT_VENDOR)/lib64/libcomposer_ext.so \
    $(TARGET_OUT_VENDOR)/lib64/libgpu_aux.so \
    $(TARGET_OUT_VENDOR)/lib64/libcapctrl.so \
    $(TARGET_OUT_VENDOR)/lib64/libnvram.so \
    $(TARGET_OUT_VENDOR)/lib64/libcustom_nvram.so \
    $(TARGET_OUT_VENDOR)/lib64/libnvram_sec.so \
    $(TARGET_OUT_VENDOR)/lib64/libcrypto-mdapp.so \
    $(TARGET_OUT_VENDOR)/lib64/libssl-mdapp.so \
    $(TARGET_OUT_VENDOR)/lib64/libtrancrypto.so \
    $(TARGET_OUT_VENDOR)/lib64/libkmsetkey.so \
    $(TARGET_OUT_VENDOR)/lib64/liboemcrypto.so \
    $(TARGET_OUT_VENDOR)/lib64/libtlcWidevineModularDrm.so \
    $(TARGET_OUT_VENDOR)/lib64/libgz_gp_client.so \
    $(TARGET_OUT_VENDOR)/lib64/libgz_uree.so

# ============================================================
# RECOVERY DEVICE MODULES (AOSP)
# ============================================================
TARGET_RECOVERY_DEVICE_MODULES += \
    libgatekeeper \
    libgatekeeper_aidl \
    libkeystore2 \
    libfscrypt
