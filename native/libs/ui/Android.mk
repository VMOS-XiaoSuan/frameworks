# Copyright (C) 2010 The Android Open Source Project
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

LOCAL_MODULE := libui

LOCAL_MULTILIB := both
LOCAL_SRC_FILES_arm := prebuilt/arm/libui.so
LOCAL_SRC_FILES_arm64 := prebuilt/arm64/libui.so

LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

LOCAL_UNINSTALLABLE_MODULE := true

$(shell cp -rf $(LOCAL_PATH)/prebuilt/arm/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)_result $(TARGET_OUT)/lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX))
ifeq ($(TARGET_IS_64_BIT),true)
$(shell cp -rf $(LOCAL_PATH)/prebuilt/arm64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)_result $(TARGET_OUT)/lib64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX))
endif

include $(BUILD_PREBUILT)
else

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	Fence.cpp \
	FramebufferNativeWindow.cpp \
	FrameStats.cpp \
	GraphicBuffer_hook.cpp \
	GraphicBufferAllocator.cpp \
	GraphicBufferMapper.cpp \
	PixelFormat.cpp \
	Rect.cpp \
	Region.cpp \
	UiConfig.cpp

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libhardware \
	libsync \
	libutils \
	liblog \
    libdl \
	libstlport

LOCAL_REQUIRED_MODULES := \
	libui71 \
	libui51 \
	libui10

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH) \
	bionic \
    bionic/libstdc++/include \
    external/stlport/stlport \

ifneq ($(BOARD_FRAMEBUFFER_FORCE_FORMAT),)
LOCAL_CFLAGS += -DFRAMEBUFFER_FORCE_FORMAT=$(BOARD_FRAMEBUFFER_FORCE_FORMAT)
endif
LOCAL_CFLAGS += -DHOOK_MAP=1 -DHOOK_BUFFER=1
#LOCAL_CFLAGS += -DHOOK_MAP=0 -DHOOK_BUFFER=0
LOCAL_MODULE:= libui

include $(BUILD_SHARED_LIBRARY)

endif

# Include subdirectory makefiles
# ============================================================

# If we're building with ONE_SHOT_MAKEFILE (mm, mmm), then what the framework
# team really wants is to build the stuff defined by this makefile.
ifeq (,$(ONE_SHOT_MAKEFILE))
include $(call first-makefiles-under,$(LOCAL_PATH))
endif
