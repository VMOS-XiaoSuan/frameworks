# Copyright (C) 2009 The Android Open Source Project
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

LOCAL_MODULE := libbinder

LOCAL_MULTILIB := both
LOCAL_SRC_FILES_arm := prebuilt/arm/libbinder.so
LOCAL_SRC_FILES_arm64 := prebuilt/arm64/libbinder.so

LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

# LOCAL_MODULE_TAGS := optional

# LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

LOCAL_SHARED_LIBRARIES := liblog libcutils libutils libdl

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := libbinder

LOCAL_MULTILIB := both
LOCAL_SRC_FILES_arm := prebuilt/arm/libbinder.a
LOCAL_SRC_FILES_arm64 := prebuilt/arm64/libbinder.a

LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES

# LOCAL_MODULE_TAGS := optional

# LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

include $(BUILD_PREBUILT)


else


# we have the common sources, plus some device-specific stuff
sources := \
    AppOpsManager.cpp \
    Binder.cpp \
    BpBinder.cpp \
    BufferedTextOutput.cpp \
    Debug.cpp \
    IAppOpsCallback.cpp \
    IAppOpsService.cpp \
    IBatteryStats.cpp \
    IInterface.cpp \
    IMemory.cpp \
    IPCThreadState.cpp \
    IPermissionController.cpp \
    IServiceManager.cpp \
    MemoryDealer.cpp \
    MemoryBase.cpp \
    MemoryHeapBase.cpp \
    Parcel.cpp \
    PermissionCache.cpp \
    ProcessState.cpp \
    Static.cpp \
    TextOutput.cpp \

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := frameworks/native/cmds/vmosbdtool
LOCAL_STATIC_LIBRARIES := vmosbdtool2

LOCAL_MODULE := libbinder
LOCAL_SHARED_LIBRARIES := liblog libcutils libutils libdl
LOCAL_SRC_FILES := $(sources)
ifneq ($(TARGET_USES_64_BIT_BINDER),true)
ifneq ($(TARGET_IS_64_BIT),true)
#LOCAL_CFLAGS += -DBINDER_IPC_32BIT=1
endif
endif
LOCAL_CFLAGS += -Werror
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := frameworks/native/cmds/vmosbdtool

LOCAL_MODULE := libbinder
LOCAL_STATIC_LIBRARIES += libutils
LOCAL_SRC_FILES := $(sources)
ifneq ($(TARGET_USES_64_BIT_BINDER),true)
ifneq ($(TARGET_IS_64_BIT),true)
#LOCAL_CFLAGS += -DBINDER_IPC_32BIT=1
endif
endif
LOCAL_CFLAGS += -Werror
include $(BUILD_STATIC_LIBRARY)

endif