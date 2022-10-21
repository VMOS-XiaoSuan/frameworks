# Copyright (C) 2013 The Android Open Source Project
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

LOCAL_PATH:= $(call my-dir)

ifeq ($(PRODUCT_OPENSRC_USE_PREBUILT),yes)

include $(CLEAR_VARS)

LOCAL_MODULE := libinputflinger

LOCAL_MULTILIB := both
LOCAL_SRC_FILES_arm := prebuilt/arm/libinputflinger.so
LOCAL_SRC_FILES_arm64 := prebuilt/arm64/libinputflinger.so

LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

LOCAL_UNINSTALLABLE_MODULE := true

$(shell cp -rf $(LOCAL_PATH)/prebuilt/arm/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)_result $(TARGET_OUT)/lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX))
ifeq ($(TARGET_IS_64_BIT),true)
$(shell cp -rf $(LOCAL_PATH)/prebuilt/arm64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)_result $(TARGET_OUT)/lib64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX))
endif

include $(BUILD_PREBUILT)

else # !PRODUCT_OPENSRC_USE_PREBUILT

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    EventHub.cpp \
    InputApplication.cpp \
    InputDispatcher.cpp \
    InputListener.cpp \
    InputManager.cpp \
    InputReader.cpp \
    InputWindow.cpp

LOCAL_SHARED_LIBRARIES := \
    libbinder \
    libcrypto \
    libcutils \
    libinput \
    liblog \
    libutils \
	libui \
	libhardware_legacy


# TODO: Move inputflinger to its own process and mark it hidden
#LOCAL_CFLAGS += -fvisibility=hidden

LOCAL_C_INCLUDES := \
    external/openssl/include \

LOCAL_CFLAGS += -Wno-unused-parameter

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)

LOCAL_MODULE := libinputflinger

include $(BUILD_SHARED_LIBRARY)

endif # !PRODUCT_OPENSRC_USE_PREBUILT
