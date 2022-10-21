LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)


# ARCH := $(APP_ABI)

LOCAL_MODULE := vmosbdtool2

LOCAL_MULTILIB := both
LOCAL_SRC_FILES_arm := vmosbdtool.arm.a
LOCAL_SRC_FILES_arm64 := vmosbdtool.arm64.a

# LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES

include $(BUILD_PREBUILT)




# include $(CLEAR_VARS)

# LOCAL_MODULE:= libbinder_kvmrt

# LOCAL_MULTILIB := both
# LOCAL_SRC_FILES_arm := libkvmrt.arm.a
# LOCAL_SRC_FILES_arm64 := libkvmrt.arm64.a

# LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

# LOCAL_MODULE_SUFFIX := .a
# LOCAL_MODULE_CLASS := STATIC_LIBRARIES

# include $(BUILD_PREBUILT)