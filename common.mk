#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/oneplus/sdm845-common/sdm845-common-vendor.mk)

# Inherit packages from vendor/addons/oneplus/apps
$(call inherit-product, vendor/addons/oneplus/apps/config.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-nad

PRODUCT_PACKAGES += \
    OdmOverlay-OPSystemUI \
    OnePlusIconShapeCircleOverlay \
    OnePlusIconShapeRoundedRectOverlay \
    OnePlusIconShapeSquareOverlay \
    OnePlusIconShapeSquircleOverlay \
    OnePlusIconShapeTeardropOverlay

# Properties
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_EXTRA_VNDK_VERSIONS := 29

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vbmeta

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper \
    OnePlusDiracGef

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/camera/android.hardware.camera.provider@2.4-service.rc:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init/android.hardware.camera.provider@2.4-service.rc

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.sdm845.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera
PRODUCT_PACKAGES += \
    libcvface_api \
    libqti-perfd-client

# Common init scripts
PRODUCT_PACKAGES += \
    init.devicesettings.rc \
    init.qcom.rc \
    init.recovery.qcom.rc \
    init.smartcharging.rc \
    ueventd.qcom.rc

# Device Settings
PRODUCT_PACKAGES += \
    DeviceSettings

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig.qti \
    libqdMetaData \
    libqdMetaData.system \
    libvulkan \
    vendor.display.config@1.0 \
    vendor.display.config@2.0

# Display Calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/qdcm_calib_data_samsung_s6e3fc2x01_cmd_mode_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/qdcm_calib_data_samsung_s6e3fc2x01_cmd_mode_dsi_panel.xml \
    $(LOCAL_PATH)/configs/display/qdcm_calib_data_samsung_sofef00_m_cmd_mode_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/qdcm_calib_data_samsung_sofef00_m_cmd_mode_dsi_panel.xml

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder.vendor \
    libhwbinder

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/gf_input.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/gf_input.idc \
    $(LOCAL_PATH)/configs/keylayout/gf_input.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gf_input.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.oneplus_sdm845

# QTI Bluetooth
PRODUCT_PACKAGES += \
    BluetoothQti

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_vendor.xml

PRODUCT_PACKAGES += \
    libavservices_minijail

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0:64 \
    android.hardware.nfc@1.1:64 \
    android.hardware.nfc@1.2:64 \
    android.hardware.secure_element@1.0:64 \
    com.android.nfc_extras \
    Tag \
    vendor.nxp.nxpese@1.0:64 \
    vendor.nxp.nxpnfc@1.0:64

# OnePlus-Mock
PRODUCT_PACKAGES += oneplus-mock
PRODUCT_BOOT_JARS += oneplus-mock

# OnePlus-fwk
PRODUCT_PACKAGES += \
    oneplus-fwk.oneplus_sdm845

PRODUCT_BOOT_JARS += \
    oneplus-fwk.oneplus_sdm845

# RCS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

# OPCam priv-app Whitelist
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-opcam.xml:system/etc/permissions/privapp-permissions-opcam.xml

# OnePlus Camera
$(call inherit-product-if-exists, packages/apps/OnePlusCamera/config.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/OnePlusCamera/hiddenapi-package-whitelist-oneplus.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hiddenapi-package-whitelist-oneplus.xml \
    $(LOCAL_PATH)/configs/OnePlusCamera/privapp-permissions-com.oneplus.camera.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.oneplus.camera.xml \
    $(LOCAL_PATH)/configs/OnePlusCamera/privapp-permissions-com.oneplus.camera.service.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.oneplus.camera.service.xml \
    $(LOCAL_PATH)/configs/OnePlusCamera/privapp-permissions-com.oneplus.gallery.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.oneplus.gallery.xml

# Power
PRODUCT_PACKAGES += \
    power.qcom:64
    
# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    device/oneplus/common

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Touch
PRODUCT_PACKAGES += \
    lineage.touch@1.0-service.oneplus_sdm845 \
    TouchGestures

# tri-state-key
PRODUCT_PACKAGES += \
    tri-state-key_daemon

# Tethering
PRODUCT_PACKAGES += \
    TetheringConfigOverlay

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ini/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR_OVERLAY)/etc/wifi/WCNSS_qcom_cfg.ini

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v29/arm64/arch-arm-armv8-a/shared/vndk-sp/libcutils.so:$(TARGET_COPY_OUT_SYSTEM)/lib/libcutils-v29.so \
    prebuilts/vndk/v29/arm64/arch-arm64-armv8-a/shared/vndk-sp/libcutils.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/libcutils-v29.so

# WiFi Display
PRODUCT_PACKAGES += \
    libnl \
    WifiOverlay

PRODUCT_BOOT_JARS += \
    WfdCommon

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/privapp-permissions-wfd.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-wfd.xml
