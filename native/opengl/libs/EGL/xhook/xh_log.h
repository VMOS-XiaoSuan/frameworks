#ifndef COMMON_MYLOG_H
#define COMMON_MYLOG_H


#include <android/log.h>

#define LOGTAG "fktool-native"
#define VMOS_ENABLE_LOG 0

#if VMOS_ENABLE_LOG
#define LOGW(...)  __android_log_print(ANDROID_LOG_ERROR, LOGTAG,"W/" __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOGTAG,"E/" __VA_ARGS__)
#define LOGV(...) __android_log_print(ANDROID_LOG_ERROR, LOGTAG,"V/" __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_ERROR, LOGTAG,"D/" __VA_ARGS__)
#define LOGVV(...)  __android_log_print(ANDROID_LOG_ERROR, LOGTAG,"D/" __VA_ARGS__)

#define XH_LOG_ERROR(...) __android_log_print(ANDROID_LOG_ERROR, LOGTAG,"E/" __VA_ARGS__)
#define XH_LOG_WARN(...) __android_log_print(ANDROID_LOG_ERROR, LOGTAG,"W/" __VA_ARGS__)
#define XH_LOG_INFO(...) __android_log_print(ANDROID_LOG_ERROR, LOGTAG,"I/" __VA_ARGS__)
#else
#define LOGW(...)
#define LOGE(...)
#define LOGV(...)
#define LOGD(...)
#define LOGVV(...)

#define XH_LOG_ERROR(...)
#define XH_LOG_WARN(...)
#define XH_LOG_INFO(...)
#endif

#endif