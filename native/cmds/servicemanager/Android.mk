LOCAL_PATH:= $(call my-dir)

svc_c_flags =	\
	-Wall -Wextra \

ifneq ($(TARGET_USES_64_BIT_BINDER),true)
ifneq ($(TARGET_IS_64_BIT),true)
#svc_c_flags += -DBINDER_IPC_32BIT=1
endif
endif

include $(CLEAR_VARS)
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_SRC_FILES := bctest.c binder.c
LOCAL_CFLAGS += $(svc_c_flags)
LOCAL_MODULE := bctest
LOCAL_MODULE_TAGS := optional
#include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := frameworks/native/cmds/vmosbdtool

LOCAL_STATIC_LIBRARIES := vmosbdtool2

LOCAL_SHARED_LIBRARIES := libbinder libcutils libutils liblog libselinux
LOCAL_SRC_FILES := service_manager.cpp binder.cpp
LOCAL_CFLAGS += $(svc_c_flags) -Wno-unused-parameter -Wno-unused -fvisibility=hidden
LOCAL_MODULE := servicemanager
LOCAL_INIT_RC := servicemanager.rc

include $(BUILD_EXECUTABLE)
