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
        <MediaCodec name="OMX.ffmpeg.aac.decoder"    type="audio/mp4a-latm">
            <Limit name="channel-count" max="8" />
            <Limit name="sample-rate" ranges="8000-192000" />
        </MediaCodec>
        <MediaCodec name="OMX.ffmpeg.ra.decoder"     type="audio/vnd.rn-realaudio">
            <Limit name="channel-count" max="8" />
            <Limit name="sample-rate" ranges="8000-192000" />
        </MediaCodec>
        <MediaCodec name="OMX.ffmpeg.ac3.decoder"    type="audio/ac3">
            <Limit name="channel-count" max="8" />
            <Limit name="sample-rate" ranges="8000-192000" />
        </MediaCodec>
        <MediaCodec name="OMX.ffmpeg.ape.decoder"    type="audio/x-ape">
            <Limit name="channel-count" max="8" />
            <Limit name="sample-rate" ranges="8000-192000" />
        </MediaCodec>
        <MediaCodec name="OMX.ffmpeg.dts.decoder"    type="audio/vnd.dts">
            <Limit name="channel-count" max="8" />
            <Limit name="sample-rate" ranges="8000-192000" />
        </MediaCodec>
        <MediaCodec name="OMX.google.mp3.decoder" type="audio/mpeg">
            <Limit name="channel-count" max="2" />
            <Limit name="sample-rate" ranges="8000,11025,12000,16000,22050,24000,32000,44100,48000" />
            <Limit name="bitrate" range="8000-320000" />
        </MediaCodec>
        <MediaCodec name="OMX.google.amrnb.decoder" type="audio/3gpp">
            <Limit name="channel-count" max="1" />
            <Limit name="sample-rate" ranges="8000" />
            <Limit name="bitrate" range="4750-12200" />
        </MediaCodec>
        <MediaCodec name="OMX.google.amrwb.decoder" type="audio/amr-wb">
            <Limit name="channel-count" max="1" />
            <Limit name="sample-rate" ranges="16000" />
            <Limit name="bitrate" range="6600-23850" />
        </MediaCodec>
        <MediaCodec name="OMX.google.aac.decoder" type="audio/mp4a-latm">
            <Limit name="channel-count" max="8" />
            <Limit name="sample-rate" ranges="7350,8000,11025,12000,16000,22050,24000,32000,44100,48000" />
            <Limit name="bitrate" range="8000-960000" />
        </MediaCodec>
        <MediaCodec name="OMX.google.g711.alaw.decoder" type="audio/g711-alaw">
            <Limit name="channel-count" max="1" />
            <Limit name="sample-rate" ranges="8000" />
            <Limit name="bitrate" range="64000" />
        </MediaCodec>
        <MediaCodec name="OMX.google.g711.mlaw.decoder" type="audio/g711-mlaw">
            <Limit name="channel-count" max="1" />
            <Limit name="sample-rate" ranges="8000" />
            <Limit name="bitrate" range="64000" />
        </MediaCodec>
        <MediaCodec name="OMX.google.vorbis.decoder" type="audio/vorbis">
            <Limit name="channel-count" max="8" />
            <Limit name="sample-rate" ranges="8000-96000" />
            <Limit name="bitrate" range="32000-500000" />
        </MediaCodec>
        <MediaCodec name="OMX.google.opus.decoder" type="audio/opus">
            <Limit name="channel-count" max="8" />
            <Limit name="sample-rate" ranges="48000" />
            <Limit name="bitrate" range="6000-510000" />
        </MediaCodec>
        <MediaCodec name="OMX.google.raw.decoder" type="audio/raw">
            <Limit name="channel-count" max="8" />
            <Limit name="sample-rate" ranges="8000-96000" />
            <Limit name="bitrate" range="1-10000000" />
        </MediaCodec>
    </Decoders>
    <Encoders>
        <MediaCodec name="OMX.google.aac.encoder" type="audio/mp4a-latm">
            <Limit name="channel-count" max="6" />
            <Limit name="sample-rate" ranges="8000,11025,12000,16000,22050,24000,32000,44100,48000" />
            <!-- also may support 64000, 88200  and 96000 Hz -->
            <Limit name="bitrate" range="8000-960000" />
        </MediaCodec>
        <MediaCodec name="OMX.google.amrnb.encoder" type="audio/3gpp">
            <Limit name="channel-count" max="1" />
            <Limit name="sample-rate" ranges="8000" />
            <Limit name="bitrate" range="4750-12200" />
            <Feature name="bitrate-modes" value="CBR" />
        </MediaCodec>
        <MediaCodec name="OMX.google.amrwb.encoder" type="audio/amr-wb">
            <Limit name="channel-count" max="1" />
            <Limit name="sample-rate" ranges="16000" />
            <Limit name="bitrate" range="6600-23850" />
            <Feature name="bitrate-modes" value="CBR" />
        </MediaCodec>
        <MediaCodec name="OMX.google.flac.encoder" type="audio/flac">
            <Limit name="channel-count" max="2" />
            <Limit name="sample-rate" ranges="1-655350" />
            <Limit name="bitrate" range="1-21000000" />
            <Limit name="complexity" range="0-8"  default="5" />
            <Feature name="bitrate-modes" value="CQ" />
        </MediaCodec>
    </Encoders>
</Included>
