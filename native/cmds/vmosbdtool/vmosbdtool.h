#ifndef VMOS_BD_TOOL_H
#define VMOS_BD_TOOL_H


#include <binder/Parcel.h>
#include <binder/IServiceManager.h>
#include <binder/TextOutput.h>
#include <binder/BpBinder.h>
#include <binder/Binder.h>


extern "C" uint32_t gaha;

using namespace android;



// 初始化
bool initmytool();

// 在servicemanager中调用, 设置binder
int setBinderMgr();

// 在客户进程中调用, 获取binder
sp<IBinder> getBinderMgr();



#endif