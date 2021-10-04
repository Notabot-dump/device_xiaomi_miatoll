#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6250-common
$(call inherit-product, device/xiaomi/sm6250-common/common.mk)

# Inherit proprietary targets
$(call inherit-product-if-exists, vendor/xiaomi/miatoll/miatoll-vendor.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.device.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.device.rc

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_joyeuse/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_joyeuse/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_joyeuse/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_joyeuse/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_joyeuse/com.nxp.mifare.xml

# Platform
TARGET_BOARD_PLATFORM := atoll

# Thermal
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/thermal/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Widevine
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/widevine/32bit_libcpion_curtana.so:$(TARGET_COPY_OUT_VENDOR)/lib/libcpion_curtana.so \
    $(LOCAL_PATH)/widevine/32bit_liboemcrypto_curtana.so:$(TARGET_COPY_OUT_VENDOR)/lib/liboemcrypto_curtana.so \
    $(LOCAL_PATH)/widevine/64bit_libcpion_curtana.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcpion_curtana.so \
    $(LOCAL_PATH)/widevine/64bit_liboemcrypto_curtana.so:$(TARGET_COPY_OUT_VENDOR)/lib64/liboemcrypto_curtana.so
