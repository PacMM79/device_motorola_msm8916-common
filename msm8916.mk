#
# Copyright (C) 2015-2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.print.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Motorola Camera permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/com.motorola.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.camera.xml \
    $(LOCAL_PATH)/configs/com.motorola.cameraone.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.cameraone.xml \
    $(LOCAL_PATH)/configs/com.motorola.motosignature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.motosignature.xml

# Screen density
PRODUCT_AAPT_CONFIG := normal

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.audio.effect@2.0-service \
    audio.a2dp.default \
    android.hardware.bluetooth.a2dp@1.0-impl \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

# Only build audio HAL on non-lux devices
ifeq ($(filter lux,$(TARGET_DEVICE)),)
PRODUCT_PACKAGES += \
    audio.primary.msm8916
endif

PRODUCT_COPY_FILES +=  \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    camera.msm8916 \
    libshim_atomic \
    libc_util \
    libshims_camera \
    libshims_sensorlistener \
    Camera2 \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    android.hardware.camera.provider@2.4-impl \
    vendor.qti.hardware.camera.device@1.0 \
    vendor.qti.hardware.camera.device@1.0_vendor \
    libjustshoot_shim

# Camera properties
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1 \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml \
    $(LOCAL_PATH)/configs/hacks.prop:$(TARGET_COPY_OUT_VENDOR)/hacks.prop

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.renderscript@1.0-impl \
    android.hardware.renderscript@1.0-service \
    gralloc.msm8916 \
    hwcomposer.msm8916 \
    memtrack.msm8916 \
    libboringssl-compat

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_buffer_age=false

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.1-service.clearkey

# Ebtables
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# Firmware Extraction
ifeq ($(filter surnia,$(TARGET_DEVICE)),)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/extract_firmware.sh:install/bin/extract_firmware.sh
endif

# limit dex2oat threads to improve thermals
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.boot-dex2oat-threads=4 \
    dalvik.vm.dex2oat-threads=4 \
    dalvik.vm.image-dex2oat-threads=4

# FM
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# Healthd packages
PRODUCT_PACKAGES += \
     charger_res_images

# Google Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/pixel_2016_exclusive.xml:system/etc/permissions/pixel_2016_exclusive.xml \
    $(LOCAL_PATH)/permissions/pixel_2017_exclusive.xml:system/etc/permissions/pixel_2017_exclusive.xml \
    $(LOCAL_PATH)/permissions/pixel_2017.xml:system/etc/permissions/pixel_2017.xml \
    $(LOCAL_PATH)/permissions/pixel_2018_exclusive.xml:system/etc/permissions/pixel_2018_exclusive.xml \
    $(LOCAL_PATH)/permissions/pixel_experience_2018.xml:system/etc/permissions/pixel_experience_2018.xml \
    $(LOCAL_PATH)/permissions/nexus.xml:system/etc/permissions/nexus.xml \
    $(LOCAL_PATH)/permissions/google_build.xml:system/etc/permissions/google_build.xml \
    $(LOCAL_PATH)/permissions/google-hiddenapi-package-whitelist.xml:system/etc/sysconfig/google-hiddenapi-package-whitelist.xml

# Motorola Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.motorola.actions.perdefs.2017.xml:system/etc/permissions/com.motorola.actions.perdefs.2017.xml \
    $(LOCAL_PATH)/permissions/com.motorola.actions.perdefs.xml:system/etc/permissions/com.motorola.actions.perdefs.xml \
    $(LOCAL_PATH)/permissions/com.motorola.android.settings.shared.xml:system/etc/permissions/com.motorola.android.settings.shared.xml \
    $(LOCAL_PATH)/permissions/com.motorola.android.subsidyutils.xml:system/etc/permissions/com.motorola.android.subsidyutils.xml \
    $(LOCAL_PATH)/permissions/com.motorola.aov.xml:system/etc/permissions/com.motorola.aov.xml \
    $(LOCAL_PATH)/permissions/com.motorola.arselfie.xml:system/etc/permissions/com.motorola.arselfie.xml \
    $(LOCAL_PATH)/permissions/com.motorola.bettertogether.xml:system/etc/permissions/com.motorola.bettertogether.xml \
    $(LOCAL_PATH)/permissions/com.motorola.camera.xml:system/etc/permissions/com.motorola.camera.xml \
    $(LOCAL_PATH)/permissions/com.motorola.camera2.xml:system/etc/permissions/com.motorola.camera2.xml \
    $(LOCAL_PATH)/permissions/com.motorola.cameraone.xml:system/etc/permissions/com.motorola.cameraone.xml \
    $(LOCAL_PATH)/permissions/com.motorola.dtv.xml:system/etc/permissions/com.motorola.dtv.xml \
    $(LOCAL_PATH)/permissions/com.motorola.easyprefix.xml:system/etc/permissions/com.motorola.easyprefix.xml \
    $(LOCAL_PATH)/permissions/com.motorola.faceunlock.xml:system/etc/permissions/com.motorola.faceunlock.xml \
    $(LOCAL_PATH)/permissions/com.motorola.frameworks.core.addon.xml:system/etc/permissions/com.motorola.frameworks.core.addon.xml \
    $(LOCAL_PATH)/permissions/com.motorola.gallery.xml:system/etc/permissions/com.motorola.gallery.xml \
    $(LOCAL_PATH)/permissions/com.motorola.hardware.dtv.xml:system/etc/permissions/com.motorola.hardware.dtv.xml \
    $(LOCAL_PATH)/permissions/com.motorola.imager.evert.xml:system/etc/permissions/com.motorola.imager.evert.xml \
    $(LOCAL_PATH)/permissions/com.motorola.launcher3.gridcustomization.xml:system/etc/permissions/com.motorola.launcher3.gridcustomization.xml \
    $(LOCAL_PATH)/permissions/com.motorola.launcher3.twoline.xml:system/etc/permissions/com.motorola.launcher3.twoline.xml \
    $(LOCAL_PATH)/permissions/com.motorola.launcher3.xml:system/etc/permissions/com.motorola.launcher3.xml \
    $(LOCAL_PATH)/permissions/com.motorola.livestream.xml:system/etc/permissions/com.motorola.livestream.xml \
    $(LOCAL_PATH)/permissions/com.motorola.moto.xml:system/etc/permissions/com.motorola.moto.xml \
    $(LOCAL_PATH)/permissions/com.motorola.motoalexa.xml:system/etc/permissions/com.motorola.motoalexa.xml \
    $(LOCAL_PATH)/permissions/com.motorola.motodisplay.xml:system/etc/permissions/com.motorola.motodisplay.xml \
    $(LOCAL_PATH)/permissions/com.motorola.motokey.xml:system/etc/permissions/com.motorola.motokey.xml \
    $(LOCAL_PATH)/permissions/com.motorola.motosignature.xml:system/etc/permissions/com.motorola.motosignature.xml \
    $(LOCAL_PATH)/permissions/com.motorola.motosound.xml:system/etc/permissions/com.motorola.motosound.xml \
    $(LOCAL_PATH)/permissions/com.motorola.msimsettings.xml:system/etc/permissions/com.motorola.msimsettings.xml \
    $(LOCAL_PATH)/permissions/com.motorola.photoeditor.xml:system/etc/permissions/com.motorola.photoeditor.xml \
    $(LOCAL_PATH)/permissions/com.motorola.software.fmradioservice.xml:system/etc/permissions/com.motorola.software.fmradioservice.xml \
    $(LOCAL_PATH)/permissions/com.motorola.software.guideme.xml:system/etc/permissions/com.motorola.software.guideme.xml \
    $(LOCAL_PATH)/permissions/com.motorola.software.mya.xml:system/etc/permissions/com.motorola.software.mya.xml \
    $(LOCAL_PATH)/permissions/com.motorola.software.storageoptimizer.xml:system/etc/permissions/com.motorola.software.storageoptimizer.xml \
    $(LOCAL_PATH)/permissions/com.motorola.software.x_line.xml:system/etc/permissions/com.motorola.software.x_line.xml \
    $(LOCAL_PATH)/permissions/com.motorola.timeweatherwidget.library.xml:system/etc/permissions/com.motorola.timeweatherwidget.library.xml \
    $(LOCAL_PATH)/permissions/product_feature_evert.xml:system/etc/permissions/product_feature_evert.xml \
    $(LOCAL_PATH)/permissions/product_feature_montana.xml:system/etc/permissions/product_feature_montana.xml \
    $(LOCAL_PATH)/permissions/product_feature_nash.xml:system/etc/permissions/product_feature_nash.xml

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service \
    gps.msm8916

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf \
    $(LOCAL_PATH)/gps/quipc.conf:system/etc/quipc.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Keystore
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \
    keystore.msm8916

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service.harpia

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni

# Disable Vulkan
PRODUCT_PROPERTY_OVERRIDES += \
    persist.graphics.vulkan.disable=true

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true \
    persist.media.treble_omx=false

# WiFi Display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1
    persist.sys.wfd.virtual=0

# Memtrack HAL
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

# OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libOmxVidcCommon \
    libstagefrighthw

# Preopt SystemUI
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI

# Qualcomm
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/privapp-permissions-qti.xml

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.mmi.boot.sh \
    init.mmi.touch.sh \
    init.mmi.usb.rc \
    init.qcom.ril.sh \
    init.qcom.rc \
    ueventd.rc

# RIL
PRODUCT_PACKAGES += \
    libcnefeatureconfig \
    libqsap_shim \
    libril-wrapper \
    librmnetctl \
    libshim_ril \
    libxml2

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Fake QTI jar
PRODUCT_PACKAGES += \
    qti-telephony-common \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service \

# TextClassifier smart selection model
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.1-service-qti

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.harpia

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    wifilogd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    WCNSS_wlan_dictionary.dat

PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    android.hardware.wifi.offload@1.0-service \
    libqsap_sdk \
    libwpa_client \
    wifilogd \
    wcnss_service

# RIL Shim
PRODUCT_PACKAGES += \
    libqsap_shim \
    libqsap_sdk

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Art
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-flags=--no-watch-dog

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_GMS_CLIENTID_BASE := android-motorola

$(call inherit-product, vendor/motorola/msm8916-common/msm8916-common-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
