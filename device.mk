#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/merlin

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/merlin/merlin-vendor.mk)

# IMS
# $(call inherit-product, vendor/mediatek/ims/mtk-ims.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml


# Bluetooth
PRODUCT_PACKAGES += \
    libldacBT_dec

# Apn
PRODUCT_COPY_FILES += \
   $(DEVICE_PATH)/configs/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# CameraGo
PRODUCT_PACKAGES += \
    CameraGo

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/id.xyz_gapps_permissions.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/id.xyz_gapps_permissions.xml \
    $(LOCAL_PATH)/configs/permissions/id.xyz_gapps_permissions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/id.xyz_gapps_permissions.xml \
    $(LOCAL_PATH)/configs/permissions/id.xyz_gapps_permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/id.xyz_gapps_permissions.xml \
    $(LOCAL_PATH)/configs/permissions/id.xyz_android_permissions.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/id.xyz_android_permissions.xml \
    $(LOCAL_PATH)/configs/permissions/id.xyz_android_permissions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/id.xyz_android_permissions.xml \
    $(LOCAL_PATH)/configs/permissions/id.xyz_android_permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/id.xyz_android_permissions.xml

# Dynamic Partitions 
PRODUCT_EXTRA_VNDK_VERSIONS := 29
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Ramdisk
PRODUCT_PACKAGES += \
    init.mt6768.rc \
    fstab.mt6768

# DT2W
PRODUCT_PACKAGES += \
    DT2W-Service-Merlin

# Fstab
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6768:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6768

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(DEVICE_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0_system \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor    

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd
    
# Light
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.merlin

# NFC stack (AOSP)
PRODUCT_PACKAGES += \
    NfcNci

# RcsService
PRODUCT_PACKAGES += \
    RcsService

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# ImsInit hack
PRODUCT_PACKAGES += \
    ImsInit

# WiFi
PRODUCT_PACKAGES += \
    WifiOverlay \
    TetheringConfigOverlay
    
# [DNM] Temp permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/xyz.extras.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/xyz.extras.xml \
    $(LOCAL_PATH)/permissions/xyz.extras.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/xyz.extras.xml \
    $(LOCAL_PATH)/permissions/xyz.extras.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/xyz.extras.xml

# speed up
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep \
    Settings \
    SystemUI
