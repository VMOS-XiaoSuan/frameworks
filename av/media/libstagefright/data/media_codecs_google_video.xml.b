<?xml version="1.0" encoding="utf-8" ?>
<!-- Copyright (C) 2014 The Android Open Source Project

     Licensed under the Apache License, Version 2.0 (the "License");
     you may not use this file except in compliance with the License.
     You may obtain a copy of the License at

          http://www.apache.org/licenses/LICENSE-2.0

     Unless required by applicable law or agreed to in writing, software
     distributed under the License is distributed on an "AS IS" BASIS,
     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
     See the License for the specific language governing permissions and
     limitations under the License.
-->

<Included>
    <Decoders>
        <MediaCodec name="OMX.ffmpeg.rv.decoder"     type="video/vnd.rn-realvideo">
            <Limit name="size" min="2x2" max="2048x2048" />
            <Limit name="alignment" value="2x2" />
            <Feature name="adaptive-playback" />
        </MediaCodec>
        <MediaCodec name="OMX.ffmpeg.hevc.decoder"   type="video/hevc">
            <Limit name="size" min="2x2" max="2048x2048" />
            <Limit name="alignment" value="2x2" />
            <Feature name="adaptive-playback" />
        </MediaCodec>
        <MediaCodec name="OMX.ffmpeg.divx.decoder"   type="video/divx">
            <Limit name="size" min="2x2" max="2048x2048" />
            <Limit name="alignment" value="2x2" />
            <Feature name="adaptive-playback" />
        </MediaCodec>
        <MediaCodec name="OMX.ffmpeg.flv1.decoder"   type="video/x-flv">
            <Limit name="size" min="2x2" max="2048x2048" />
            <Limit name="alignment" value="2x2" />
            <Feature name="adaptive-playback" />
        </MediaCodec>
        <MediaCodec name="OMX.ffmpeg.h264.decoder" type="video/avc">
            <Limit name="size" min="2x2" max="2048x2048" />
            <Limit name="alignment" value="2x2" />
            <Limit name="block-size" value="16x16" />
            <Limit name="blocks-per-second" range="1-983040" />
            <Limit name="bitrate" range="1-40000000" />
            <Feature name="adaptive-playback" />
        </MediaCodec>
        <MediaCodec name="OMX.google.mpeg4.decoder" type="video/mp4v-es">
            <!-- profiles and levels:  ProfileSimple : Level3 -->
            <Limit name="size" min="2x2" max="352x288" />
            <Limit name="alignment" value="2x2" />
            <Limit name="block-size" value="16x16" />
            <Limit name="blocks-per-second" range="12-11880" />
            <Limit name="bitrate" range="1-384000" />
            <Feature name="adaptive-playback" />
        </MediaCodec>
        <MediaCodec name="OMX.google.h263.decoder" type="video/3gpp">
            <!-- profiles and levels:  ProfileBaseline : Level30, ProfileBaseline : Level45
                    ProfileISWV2 : Level30, ProfileISWV2 : Level45 -->
            <Limit name="size" min="2x2" max="352x288" />
            <Limit name="alignment" value="2x2" />
            <Limit name="bitrate" range="1-384000" />
            <Feature name="adaptive-playback" />
        </MediaCodec>
        <MediaCodec name="OMX.google.h264.decoder" type="video/avc">
            <!-- profiles and levels:  ProfileBaseline : Level51 -->
            <Limit name="size" min="2x2" max="2048x2048" />
            <Limit name="alignment" value="2x2" />
            <Limit name="block-size" value="16x16" />
            <Limit name="blocks-per-second" range="1-983040" />
            <Limit name="bitrate" range="1-40000000" />
            <Feature name="adaptive-playback" />
        </MediaCodec>
        <MediaCodec name="OMX.google.hevc.decoder" type="video/hevc">
            <!-- profiles and levels:  ProfileMain : MainTierLevel51 -->
            <Limit name="size" min="2x2" max="2048x2048" />
            <Limit name="alignment" value="2x2" />
            <Limit name="block-size" value="8x8" />
            <Limit name="block-count" range="1-139264" />
            <Limit name="blocks-per-second" range="1-2000000" />
            <Limit name="bitrate" range="1-10000000" />
            <Feature name="adaptive-playback" />
        </MediaCodec>
        <MediaCodec name="OMX.google.vp8.decoder" type="video/x-vnd.on2.vp8">
            <Limit name="size" min="2x2" max="2048x2048" />
            <Limit name="alignment" value="2x2" />
            <Limit name="block-size" value="16x16" />
            <Limit name="blocks-per-second" range="1-1000000" />
            <Limit name="bitrate" range="1-40000000" />
            <Feature name="adaptive-playback" />
        </MediaCodec>
        <MediaCodec name="OMX.google.vp9.decoder" type="video/x-vnd.on2.vp9">
            <Limit name="size" min="2x2" max="2048x2048" />
            <Limit name="alignment" value="2x2" />
            <Limit name="block-size" value="16x16" />
            <Limit name="blocks-per-second" range="1-500000" />
            <Limit name="bitrate" range="1-40000000" />
            <Feature name="adaptive-playback" />
        </MediaCodec>
    </Decoders>

    <Encoders>
        <MediaCodec name="OMX.google.h263.encoder" type="video/3gpp">
            <!-- profiles and levels:  ProfileBaseline : Level45 -->
            <Limit name="size" min="176x144" max="176x144" />
            <Limit name="alignment" value="16x16" />
            <Limit name="bitrate" range="1-128000" />
        </MediaCodec>
        <MediaCodec name="OMX.google.h264.encoder" type="video/avc">
            <!-- profiles and levels:  ProfileBaseline : Level2 -->
            <Limit name="size" min="16x16" max="896x896" />
            <Limit name="alignment" value="16x16" />
            <Limit name="block-size" value="16x16" />
            <Limit name="blocks-per-second" range="1-11880" />
            <Limit name="bitrate" range="1-2000000" />
        </MediaCodec>
        <MediaCodec name="OMX.google.mpeg4.encoder" type="video/mp4v-es">
            <!-- profiles and levels:  ProfileCore : Level2 -->
            <Limit name="size" min="16x16" max="176x144" />
            <Limit name="alignment" value="16x16" />
            <Limit name="block-size" value="16x16" />
            <Limit name="blocks-per-second" range="12-1485" />
            <Limit name="bitrate" range="1-64000" />
        </MediaCodec>
        <MediaCodec name="OMX.google.vp8.encoder" type="video/x-vnd.on2.vp8">
            <!-- profiles and levels:  ProfileMain : Level_Version0-3 -->
            <Limit name="size" min="2x2" max="2048x2048" />
            <Limit name="alignment" value="2x2" />
            <Limit name="bitrate" range="1-40000000" />
            <Feature name="bitrate-modes" value="VBR,CBR" />
        </MediaCodec>
    </Encoders>
</Included>
