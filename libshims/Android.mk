# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2018 Alberto97
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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := MediaCodec.cpp AudioSource.cpp MetaData.cpp
LOCAL_SHARED_LIBRARIES := libstagefright libmedia
LOCAL_MODULE := libshims_camera
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# RIL
include $(CLEAR_VARS)
LOCAL_SRC_FILES := ASensorManager.cpp
LOCAL_SHARED_LIBRARIES := android.hardware.sensors@1.0 libandroid
LOCAL_STATIC_LIBRARIES := android.hardware.sensors@1.0-convert
LOCAL_MODULE := libshim_ril
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := atomic.cpp
LOCAL_MODULE := libshim_atomic
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    sensorlistener/ISensorServer.cpp \
    sensorlistener/SensorManager.cpp
LOCAL_MODULE := libshims_sensorlistener
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := \
    libnativeloader \
    libbinder \
    libcutils \
    libEGL \
    libGLESv2 \
    libsync \
    libui \
    libutils \
    liblog \
    libbase \
    libsensor
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_SRC_FILES := libqsap_shim.c
LOCAL_SHARED_LIBRARIES := libqsap_sdk liblog
LOCAL_C_INCLUDES := $(TOP)/system/qcom/softap/sdk
LOCAL_MODULE := libqsap_shim
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := justshoot_shim.cpp
LOCAL_SHARED_LIBRARIES := libutils
LOCAL_MODULE := libjustshoot_shim
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)
