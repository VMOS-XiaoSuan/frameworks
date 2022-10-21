LOCAL_PATH:= $(call my-dir)

###############################################################################
# Build META EGL library
#

egl.cfg_config_module :=
# OpenGL drivers config file
ifneq ($(BOARD_EGL_CFG),)

include $(CLEAR_VARS)
LOCAL_MODULE := egl.cfg
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/lib/egl
LOCAL_SRC_FILES := ../../../../$(BOARD_EGL_CFG)
include $(BUILD_PREBUILT)
egl.cfg_config_module := $(LOCAL_MODULE)
endif

ifeq ($(PRODUCT_OPENSRC_USE_PREBUILT),yes) # prebuilt compile

include $(CLEAR_VARS)

LOCAL_MODULE := libEGL

LOCAL_MULTILIB := both
LOCAL_SRC_FILES_arm := prebuilt/arm/libEGL.so
LOCAL_SRC_FILES_arm64 := prebuilt/arm64/libEGL.so

LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

LOCAL_SHARED_LIBRARIES += libGLES_trace

LOCAL_UNINSTALLABLE_MODULE := true

$(shell cp -rf $(LOCAL_PATH)/prebuilt/arm/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)_result $(TARGET_OUT)/lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX))
ifeq ($(TARGET_IS_64_BIT),true)
$(shell cp -rf $(LOCAL_PATH)/prebuilt/arm64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)_result $(TARGET_OUT)/lib64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX))
endif

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := libGLESv1_CM

LOCAL_MULTILIB := both
LOCAL_SRC_FILES_arm := prebuilt/arm/libGLESv1_CM.so
LOCAL_SRC_FILES_arm64 := prebuilt/arm64/libGLESv1_CM.so

LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

LOCAL_UNINSTALLABLE_MODULE := true

$(shell cp -rf $(LOCAL_PATH)/prebuilt/arm/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)_result $(TARGET_OUT)/lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX))
ifeq ($(TARGET_IS_64_BIT),true)
$(shell cp -rf $(LOCAL_PATH)/prebuilt/arm64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)_result $(TARGET_OUT)/lib64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX))
endif

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := libGLESv2

LOCAL_MULTILIB := both
LOCAL_SRC_FILES_arm := prebuilt/arm/libGLESv2.so
LOCAL_SRC_FILES_arm64 := prebuilt/arm64/libGLESv2.so

LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

LOCAL_UNINSTALLABLE_MODULE := true

$(shell cp -rf $(LOCAL_PATH)/prebuilt/arm/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)_result $(TARGET_OUT)/lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX))
$(shell ln -sf $(TARGET_OUT)/lib/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX) $(TARGET_OUT)/lib/libGLESv3.so)
ifeq ($(TARGET_IS_64_BIT),true)
$(shell cp -rf $(LOCAL_PATH)/prebuilt/arm64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)_result $(TARGET_OUT)/lib64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX))
$(shell ln -sf $(TARGET_OUT)/lib64/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX) $(TARGET_OUT)/lib64/libGLESv3.so)
endif

include $(BUILD_PREBUILT)

else # src file compile

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= 	       \
	EGL/egl_tls.cpp        \
	EGL/egl_cache.cpp      \
	EGL/egl_display.cpp    \
	EGL/egl_object.cpp     \
	EGL/egl.cpp 	       \
	EGL/eglApi.cpp 	       \
	EGL/trace.cpp              \
	EGL/getProcAddress.cpp.arm \
	EGL/Loader.cpp 	       \
	EGL/xhook/xh_elf.c     \
	EGL/xhook/xh_util.c     \
	EGL/miui_fix.cpp
#

LOCAL_SHARED_LIBRARIES += libcutils libutils liblog libGLES_trace
LOCAL_MODULE:= libEGL
LOCAL_LDFLAGS += -Wl,--exclude-libs=ALL
LOCAL_SHARED_LIBRARIES += libdl
# we need to access the private Bionic header <bionic_tls.h>
LOCAL_C_INCLUDES += bionic/libc/private

LOCAL_CFLAGS += -DLOG_TAG=\"libEGL\"
LOCAL_CFLAGS += -DGL_GLEXT_PROTOTYPES -DEGL_EGLEXT_PROTOTYPES
LOCAL_CFLAGS += -fvisibility=hidden
LOCAL_CFLAGS += -DEGL_TRACE=1

ifeq ($(BOARD_ALLOW_EGL_HIBERNATION),true)
  LOCAL_CFLAGS += -DBOARD_ALLOW_EGL_HIBERNATION
endif
ifeq ($(TARGET_BOARD_PLATFORM), omap4)
  LOCAL_CFLAGS += -DWORKAROUND_BUG_10194508=1
endif
ifneq ($(MAX_EGL_CACHE_ENTRY_SIZE),)
  LOCAL_CFLAGS += -DMAX_EGL_CACHE_ENTRY_SIZE=$(MAX_EGL_CACHE_ENTRY_SIZE)
endif

ifneq ($(MAX_EGL_CACHE_KEY_SIZE),)
  LOCAL_CFLAGS += -DMAX_EGL_CACHE_KEY_SIZE=$(MAX_EGL_CACHE_KEY_SIZE)
endif

ifneq ($(MAX_EGL_CACHE_SIZE),)
  LOCAL_CFLAGS += -DMAX_EGL_CACHE_SIZE=$(MAX_EGL_CACHE_SIZE)
endif

LOCAL_REQUIRED_MODULES := $(egl.cfg_config_module)
egl.cfg_config_module :=

include $(BUILD_SHARED_LIBRARY)

###############################################################################
# Build the wrapper OpenGL ES 1.x library
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= 		\
	GLES_CM/gl.cpp.arm 	\
#

LOCAL_SHARED_LIBRARIES += libcutils liblog libEGL
LOCAL_MODULE:= libGLESv1_CM

LOCAL_SHARED_LIBRARIES += libdl
# we need to access the private Bionic header <bionic_tls.h>
LOCAL_C_INCLUDES += bionic/libc/private

LOCAL_CFLAGS += -DLOG_TAG=\"libGLESv1\"
LOCAL_CFLAGS += -DGL_GLEXT_PROTOTYPES -DEGL_EGLEXT_PROTOTYPES
LOCAL_CFLAGS += -fvisibility=hidden

include $(BUILD_SHARED_LIBRARY)


###############################################################################
# Build the wrapper OpenGL ES 2.x library
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= 		\
	GLES2/gl2.cpp.arm 	\
#

LOCAL_SHARED_LIBRARIES += libcutils libutils liblog libEGL
LOCAL_MODULE:= libGLESv2

LOCAL_SHARED_LIBRARIES += libdl
# we need to access the private Bionic header <bionic_tls.h>
LOCAL_C_INCLUDES += bionic/libc/private

LOCAL_CFLAGS += -DLOG_TAG=\"libGLESv2\"
LOCAL_CFLAGS += -DGL_GLEXT_PROTOTYPES -DEGL_EGLEXT_PROTOTYPES
LOCAL_CFLAGS += -fvisibility=hidden

# Symlink libGLESv3.so -> libGLESv2.so
# Platform modules should link against libGLESv2.so (-lGLESv2), but NDK apps
# will be linked against libGLESv3.so.
# Note we defer the evaluation of the LOCAL_POST_INSTALL_CMD,
# so $(LOCAL_INSTALLED_MODULE) will be expanded to correct value,
# even for both 32-bit and 64-bit installed files in multilib build.
LOCAL_POST_INSTALL_CMD = \
    $(hide) ln -sf $(notdir $(LOCAL_INSTALLED_MODULE)) $(dir $(LOCAL_INSTALLED_MODULE))libGLESv3.so

include $(BUILD_SHARED_LIBRARY)

endif

###############################################################################
# Build the ETC1 host static library
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= 		\
	ETC1/etc1.cpp 	\
#

LOCAL_MODULE:= libETC1

include $(BUILD_HOST_STATIC_LIBRARY)

###############################################################################
# Build the ETC1 device library
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= 		\
	ETC1/etc1.cpp 	\
#

LOCAL_MODULE:= libETC1

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))
