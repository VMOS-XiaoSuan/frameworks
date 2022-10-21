/*
 * Copyright (C) 2007 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ANDROID_UI_BUFFER_MAPPER_H
#define ANDROID_UI_BUFFER_MAPPER_H

#include <stdint.h>
#include <sys/types.h>

#include <utils/Singleton.h>

#include <hardware/gralloc.h>

#define HOOK_MAP 1

struct gralloc_module_t;

namespace android {
// ---------------------------------------------------------------------------

class Rect;

class GraphicBufferMapper : public Singleton<GraphicBufferMapper>
{
public:
#if 1//HOOK_MAP==1
    static GraphicBufferMapper& get();

    void createMapper();
#else
    static inline GraphicBufferMapper& get() { return getInstance(); }
#endif
    status_t registerBuffer(buffer_handle_t handle);

    status_t unregisterBuffer(buffer_handle_t handle);
    
    status_t lock(buffer_handle_t handle,
            int usage, const Rect& bounds, void** vaddr);

    status_t lockYCbCr(buffer_handle_t handle,
            int usage, const Rect& bounds, android_ycbcr *ycbcr);

    status_t unlock(buffer_handle_t handle);

    status_t lockAsync(buffer_handle_t handle,
            int usage, const Rect& bounds, void** vaddr, int fenceFd);

    status_t lockAsyncYCbCr(buffer_handle_t handle,
            int usage, const Rect& bounds, android_ycbcr *ycbcr, int fenceFd);

    status_t unlockAsync(buffer_handle_t handle, int *fenceFd);
    
    // dumps information about the mapping of this handle
    void dump(buffer_handle_t handle);

private:
    friend class Singleton<GraphicBufferMapper>;
    GraphicBufferMapper();
    gralloc_module_t const *mAllocMod;
    int xx[0x10];
};

#if HOOK_MAP==1
struct GraphicBufferMapperFunctionPointer
{
	GraphicBufferMapper& (*get)();

	void (GraphicBufferMapper::*createMapper)();
	status_t (GraphicBufferMapper::*registerBuffer)(buffer_handle_t handle);
	status_t (GraphicBufferMapper::*unregisterBuffer)(buffer_handle_t handle);


	status_t (GraphicBufferMapper::*lock_android10)(buffer_handle_t handle,		uint32_t usage, const Rect& bounds, void** vaddr, int32_t* outBytesPerPixel, int32_t* outBytesPerStride);

    status_t (GraphicBufferMapper::*lock)(buffer_handle_t handle,		uint32_t usage, const Rect& bounds, void** vaddr);
	status_t (GraphicBufferMapper::*lockYCbCr)(buffer_handle_t handle,	uint32_t usage, const Rect& bounds, android_ycbcr *ycbcr);
	status_t (GraphicBufferMapper::*unlock)(buffer_handle_t handle);

	status_t (GraphicBufferMapper::*lockAsync_android10)(buffer_handle_t handle,	uint32_t usage, const Rect& bounds, void** vaddr, int fenceFd, int32_t* outBytesPerPixel, int32_t* outBytesPerStride);

    status_t (GraphicBufferMapper::*lockAsync)(buffer_handle_t handle,	uint32_t usage, const Rect& bounds, void** vaddr, int fenceFd);

	status_t (GraphicBufferMapper::*lockAsyncYCbCr)(buffer_handle_t handle,	uint32_t usage, const Rect& bounds, android_ycbcr *ycbcr,int fenceFd);
	status_t (GraphicBufferMapper::*unlockAsync)(buffer_handle_t handle,	int *fenceFd);
};


void vmhookGraphicBufferMapper(struct GraphicBufferMapperFunctionPointer *kernelMapper);
void hosthookGraphicBufferMapper(struct GraphicBufferMapperFunctionPointer *kernelMapper);
#endif

// ---------------------------------------------------------------------------

}; // namespace android

#endif // ANDROID_UI_BUFFER_MAPPER_H

