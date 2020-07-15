CONFIG -= qt

TEMPLATE = lib
CONFIG += staticlib

CONFIG += c++11

TARGET = TheForge

#
# NOTE: The end goal of this project is to compile only what is necessary for 3d rendering while also keeping everything as is for more user control
#

# We compile gainput on its own because some flags used to compile The forge are not compatible

GAINPUT_ROOT = $$PWD/gainput
include($$GAINPUT_ROOT/gainput.pri)

# We will use directx12 by default (on windows), uncomment to change
CONFIG += directx12
#CONFIG += directx11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include \
    Common_3/ThirdParty/Opensource/soloud20181119/include \
    Common_3/ThirdParty/OpenSource/ozz-animation/include/ \


# Common sources between all OS

#
# TODO: Figure out which files are not required for the forge some libs are most likely mot fully used
# Most of these will not get through linking if they are not used
#

SOURCES += \
    #Common_3/OS
    Common_3/OS/Camera/CameraController.cpp \
    Common_3/OS/Core/FileSystem.cpp \
    Common_3/OS/Core/ThreadSystem.cpp \
    Common_3/OS/Core/Timer.cpp \
    Common_3/OS/FileSystem/FileSystemInternal.cpp \
    Common_3/OS/FileSystem/MemoryStream.cpp \
    Common_3/OS/FileSystem/SystemFileStream.cpp \
    Common_3/OS/FileSystem/SystemRun.cpp \
    Common_3/OS/FileSystem/ZipFileStream.cpp \
    Common_3/OS/FileSystem/ZipFileSystem.cpp \
    Common_3/OS/Image/Image.cpp \
    Common_3/OS/Input/InputSystem.cpp \
    Common_3/OS/Logging/Log.cpp \
    Common_3/OS/MemoryTracking/MemoryTracking.cpp \
    Common_3/OS/Profiler/GpuProfiler.cpp \
    Common_3/OS/Profiler/ProfilerBase.cpp \
    Common_3/OS/Profiler/ProfilerWidgetsUI.cpp \
    #Common_3/Renderer
    Common_3/Renderer/CommonShaderReflection.cpp \
    Common_3/Renderer/ResourceLoader.cpp \
    #Common_3/ThirdParty
    Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EAMemory.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EASprintf.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/allocator_eastl.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/allocator_forge.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/assert.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/eastl.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_pool.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/hashtable.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/intrusive_list.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/numeric_limits.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/red_black_tree.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/string.cpp \
    Common_3/ThirdParty/OpenSource/EASTL/thread_support.cpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cfg.cpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cpp.cpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cross.cpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cross_parsed_ir.cpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cross_util.cpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_glsl.cpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_hlsl.cpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_msl.cpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_parser.cpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_reflect.cpp \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MicroWindows.cpp \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Source/MTDefaultAppInterop.cpp \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Source/MTFiberContext.cpp \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Source/MTScheduler.cpp \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Source/MTThreadContext.cpp \
    Common_3/ThirdParty/OpenSource/TinyEXR/tinyexr.cpp \
    Common_3/ThirdParty/OpenSource/TinyXML2/tinyxml2.cpp \
    Common_3/ThirdParty/OpenSource/TressFX/TressFXAsset.cpp \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/additive_animation_builder.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/animation_builder.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/animation_optimizer.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/fbx/fbx.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/fbx/fbx2ozz.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/fbx/fbx2ozz_anim.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/fbx/fbx2ozz_skel.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/fbx/fbx_animation.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/fbx/fbx_skeleton.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_animation.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_animation_archive.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_animation_utils.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_skeleton.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_skeleton_archive.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/raw_track.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/skeleton_builder.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/tools/dump2ozz.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/tools/import2ozz.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/tools/import2ozz_anim.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/tools/import2ozz_config.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/tools/import2ozz_skel.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/track_builder.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/track_optimizer.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/animation.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/blending_job.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/ik_aim_job.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/ik_two_bone_job.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/local_to_model_job.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/sampling_job.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/skeleton.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/skeleton_utils.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/track.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/track_sampling_job.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/track_triggering_job.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/base/containers/string_archive.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/base/io/archive.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/base/io/stream.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/base/maths/math_archive.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/base/maths/simd_math_archive.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/base/maths/soa_math_archive.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/base/memory/allocator.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/base/platform.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/geometry/runtime/skinning_job.cc \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/options/options.cc \
    Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu_transcoder.cpp \
    Common_3/ThirdParty/OpenSource/imgui/imgui.cpp \
    Common_3/ThirdParty/OpenSource/imgui/imgui_demo.cpp \
    Common_3/ThirdParty/OpenSource/imgui/imgui_draw.cpp \
    Common_3/ThirdParty/OpenSource/imgui/imgui_widgets.cpp \
    Common_3/ThirdParty/OpenSource/rmem/3rd/lz4-r191/lz4.c \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_get_module_info.cpp \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_hook.cpp \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_lib.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/monotone/soloud_monotone.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/openmpt/soloud_openmpt.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/openmpt/soloud_openmpt_dll.c \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/sfxr/soloud_sfxr.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/speech/darray.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/speech/klatt.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/speech/resonator.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/speech/soloud_speech.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/speech/tts.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/tedsid/sid.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/tedsid/soloud_tedsid.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/tedsid/ted.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/vic/soloud_vic.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/vizsn/soloud_vizsn.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/wav/dr_impl.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/wav/soloud_wav.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/wav/soloud_wavstream.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/wav/stb_vorbis.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/backend/alsa/soloud_alsa.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/backend/coreaudio/soloud_coreaudio.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/backend/opensles/soloud_opensles.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/backend/winmm/soloud_winmm.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/backend/xaudio2/soloud_xaudio2.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_audiosource.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_bus.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_core_3d.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_core_basicops.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_core_faderops.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_core_filterops.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_core_getters.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_core_setters.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_core_voicegroup.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_core_voiceops.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_fader.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_fft.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_fft_lut.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_file.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_filter.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_queue.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/core/soloud_thread.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/filter/soloud_bassboostfilter.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/filter/soloud_biquadresonantfilter.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/filter/soloud_dcremovalfilter.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/filter/soloud_echofilter.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/filter/soloud_fftfilter.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/filter/soloud_flangerfilter.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/filter/soloud_lofifilter.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/filter/soloud_robotizefilter.cpp \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/filter/soloud_waveshaperfilter.cpp \
    Common_3/ThirdParty/OpenSource/zip/zip.cpp \
    Common_3/Tools/AssetPipeline/src/AssetPipeline.cpp \
    Common_3/Tools/AssetPipeline/src/AssetPipelineCmd.cpp \
    Common_3/Tools/SpirvTools/SpirvTools.cpp \
    \ #Middleware_3
    Middleware_3/Animation/AnimatedObject.cpp \
    Middleware_3/Animation/Animation.cpp \
    Middleware_3/Animation/Clip.cpp \
    Middleware_3/Animation/ClipController.cpp \
    Middleware_3/Animation/ClipMask.cpp \
    Middleware_3/Animation/Rig.cpp \
    Middleware_3/Animation/SkeletonBatcher.cpp \
    Middleware_3/ECS/BaseComponent.cpp \
    Middleware_3/ECS/ComponentRepresentation.cpp \
    Middleware_3/ECS/EntityManager.cpp \
    Middleware_3/LUA/LuaManager.cpp \
    Middleware_3/LUA/LuaManagerImpl.cpp \
    Middleware_3/PaniniProjection/Panini.cpp \
    Middleware_3/ParallelPrimitives/ParallelPrimitives.cpp \
    Middleware_3/Text/Fontstash.cpp \
    Middleware_3/UI/AppUI.cpp \
    Middleware_3/UI/ImguiGUIDriver.cpp \
    Middleware_3/UI/imgui_user.cpp

HEADERS += \
    #Common_3/OS
    Common_3/OS/Core/Atomics.h \
    Common_3/OS/Core/Compiler.h \
    Common_3/OS/Core/DLL.h \
    Common_3/OS/Core/GPUConfig.h \
    Common_3/OS/Core/RingBuffer.h \
    Common_3/OS/Core/ThreadSystem.h \
    Common_3/OS/FileSystem/FileSystemInternal.h \
    Common_3/OS/FileSystem/MemoryStream.h \
    Common_3/OS/FileSystem/SystemFileStream.h \
    Common_3/OS/FileSystem/ZipFileStream.h \
    Common_3/OS/FileSystem/ZipFileSystem.h \
    Common_3/OS/Image/Image.h \
    Common_3/OS/Image/ImageHelper.h \
    Common_3/OS/Interfaces/IApp.h \
    Common_3/OS/Interfaces/ICameraController.h \
    Common_3/OS/Interfaces/IFileSystem.h \
    Common_3/OS/Interfaces/IInput.h \
    Common_3/OS/Interfaces/ILog.h \
    Common_3/OS/Interfaces/IMemory.h \
    Common_3/OS/Interfaces/IMiddleware.h \
    Common_3/OS/Interfaces/IOperatingSystem.h \
    Common_3/OS/Interfaces/IProfiler.h \
    Common_3/OS/Interfaces/IThread.h \
    Common_3/OS/Interfaces/ITime.h \
    Common_3/OS/Logging/Log.h \
    Common_3/OS/Math/MathTypes.h \
    Common_3/OS/MemoryTracking/NoMemoryDefines.h \
    Common_3/OS/Profiler/GpuProfiler.h \
    Common_3/OS/Profiler/ProfilerBase.h \
    Common_3/OS/Profiler/ProfilerHTML.h \
    #Common_3/Renderer
    Common_3/Renderer/IRay.h \
    Common_3/Renderer/IRenderer.h \
    Common_3/Renderer/IResourceLoader.h \
    Common_3/Renderer/IShaderReflection.h \
    Common_3/Renderer/ResourceLoaderInternalTypes.h \
    #Common_3/ThirdParty
    Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EAAlignment.h \
    Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EADateTime.h \
    Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EAMemory.h \
    Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EAProcess.h \
    Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EASprintf.h \
    Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EAStopwatch.h \
    Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EAString.h \
    Common_3/ThirdParty/OpenSource/EASTL/EAStdC/EATextUtil.h \
    Common_3/ThirdParty/OpenSource/EASTL/algorithm.h \
    Common_3/ThirdParty/OpenSource/EASTL/allocator.h \
    Common_3/ThirdParty/OpenSource/EASTL/allocator_forge.h \
    Common_3/ThirdParty/OpenSource/EASTL/allocator_malloc.h \
    Common_3/ThirdParty/OpenSource/EASTL/any.h \
    Common_3/ThirdParty/OpenSource/EASTL/array.h \
    Common_3/ThirdParty/OpenSource/EASTL/bitset.h \
    Common_3/ThirdParty/OpenSource/EASTL/bitvector.h \
    Common_3/ThirdParty/OpenSource/EASTL/chrono.h \
    Common_3/ThirdParty/OpenSource/EASTL/core_allocator.h \
    Common_3/ThirdParty/OpenSource/EASTL/core_allocator_adapter.h \
    Common_3/ThirdParty/OpenSource/EASTL/deque.h \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_allocator.h \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_function.h \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_hash_map.h \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_hash_set.h \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_list.h \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_map.h \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_set.h \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_slist.h \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_string.h \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_substring.h \
    Common_3/ThirdParty/OpenSource/EASTL/fixed_vector.h \
    Common_3/ThirdParty/OpenSource/EASTL/functional.h \
    Common_3/ThirdParty/OpenSource/EASTL/hash_map.h \
    Common_3/ThirdParty/OpenSource/EASTL/hash_set.h \
    Common_3/ThirdParty/OpenSource/EASTL/heap.h \
    Common_3/ThirdParty/OpenSource/EASTL/initializer_list.h \
    Common_3/ThirdParty/OpenSource/EASTL/intrusive_hash_map.h \
    Common_3/ThirdParty/OpenSource/EASTL/intrusive_hash_set.h \
    Common_3/ThirdParty/OpenSource/EASTL/intrusive_list.h \
    Common_3/ThirdParty/OpenSource/EASTL/intrusive_ptr.h \
    Common_3/ThirdParty/OpenSource/EASTL/iterator.h \
    Common_3/ThirdParty/OpenSource/EASTL/linked_array.h \
    Common_3/ThirdParty/OpenSource/EASTL/linked_ptr.h \
    Common_3/ThirdParty/OpenSource/EASTL/list.h \
    Common_3/ThirdParty/OpenSource/EASTL/map.h \
    Common_3/ThirdParty/OpenSource/EASTL/memory.h \
    Common_3/ThirdParty/OpenSource/EASTL/meta.h \
    Common_3/ThirdParty/OpenSource/EASTL/numeric.h \
    Common_3/ThirdParty/OpenSource/EASTL/numeric_limits.h \
    Common_3/ThirdParty/OpenSource/EASTL/optional.h \
    Common_3/ThirdParty/OpenSource/EASTL/priority_queue.h \
    Common_3/ThirdParty/OpenSource/EASTL/queue.h \
    Common_3/ThirdParty/OpenSource/EASTL/random.h \
    Common_3/ThirdParty/OpenSource/EASTL/ratio.h \
    Common_3/ThirdParty/OpenSource/EASTL/safe_ptr.h \
    Common_3/ThirdParty/OpenSource/EASTL/scoped_array.h \
    Common_3/ThirdParty/OpenSource/EASTL/scoped_ptr.h \
    Common_3/ThirdParty/OpenSource/EASTL/segmented_vector.h \
    Common_3/ThirdParty/OpenSource/EASTL/set.h \
    Common_3/ThirdParty/OpenSource/EASTL/shared_array.h \
    Common_3/ThirdParty/OpenSource/EASTL/shared_ptr.h \
    Common_3/ThirdParty/OpenSource/EASTL/slist.h \
    Common_3/ThirdParty/OpenSource/EASTL/sort.h \
    Common_3/ThirdParty/OpenSource/EASTL/span.h \
    Common_3/ThirdParty/OpenSource/EASTL/stack.h \
    Common_3/ThirdParty/OpenSource/EASTL/string.h \
    Common_3/ThirdParty/OpenSource/EASTL/string_hash_map.h \
    Common_3/ThirdParty/OpenSource/EASTL/string_map.h \
    Common_3/ThirdParty/OpenSource/EASTL/string_view.h \
    Common_3/ThirdParty/OpenSource/EASTL/tuple.h \
    Common_3/ThirdParty/OpenSource/EASTL/type_traits.h \
    Common_3/ThirdParty/OpenSource/EASTL/unique_ptr.h \
    Common_3/ThirdParty/OpenSource/EASTL/unordered_map.h \
    Common_3/ThirdParty/OpenSource/EASTL/unordered_set.h \
    Common_3/ThirdParty/OpenSource/EASTL/utility.h \
    Common_3/ThirdParty/OpenSource/EASTL/variant.h \
    Common_3/ThirdParty/OpenSource/EASTL/vector.h \
    Common_3/ThirdParty/OpenSource/EASTL/vector_map.h \
    Common_3/ThirdParty/OpenSource/EASTL/vector_multimap.h \
    Common_3/ThirdParty/OpenSource/EASTL/vector_multiset.h \
    Common_3/ThirdParty/OpenSource/EASTL/vector_set.h \
    Common_3/ThirdParty/OpenSource/EASTL/version.h \
    Common_3/ThirdParty/OpenSource/EASTL/weak_ptr.h \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/GLSL.std.450.h \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv.h \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cfg.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_common.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cpp.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cross.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cross_containers.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cross_error_handling.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cross_parsed_ir.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_cross_util.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_glsl.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_hlsl.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_msl.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_parser.hpp \
    Common_3/ThirdParty/OpenSource/SPIRV_Cross/spirv_reflect.hpp \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTAppInterop.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTArrayView.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTAtomic.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTColorTable.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTConcurrentRingBuffer.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTConfig.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTDebug.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTFiberContext.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTFiberContext.inl \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTGroupedTask.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTPlatform.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTProfilerEventListener.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTQueueMPMC.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTScheduler.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTScheduler.inl \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTStackRequirements.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTStaticVector.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTTaskBucket.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTTaskDesc.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTTaskGroup.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTTaskPool.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTTaskQueue.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTThreadContext.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTTools.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/MTTypes.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Common/MTAtomic.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Common/MTSpinWait.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Common/MTThread.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Posix/MTAtomic.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Posix/MTCommon.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Posix/MTEvent.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Posix/MTFiber.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Posix/MTMemory.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Posix/MTMutex.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Posix/MTThread.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Posix/MTUtils.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTAtomic.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTCommon.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTEvent.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTEventKernel.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTEventUser.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTFiber.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTFiberDefault.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTFiberOptimized.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTMemory.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTMutex.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTThread.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MTUtils.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Platform/Windows/MicroWindows.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/Scheduler/Include/Scopes/MTScopes.h \
    Common_3/ThirdParty/OpenSource/TaskScheduler/ThirdParty/Boost.Context/fcontext.h \
    Common_3/ThirdParty/OpenSource/TinyEXR/tinyexr.h \
    Common_3/ThirdParty/OpenSource/TinyXML2/tinyxml2.h \
    Common_3/ThirdParty/OpenSource/TressFX/TressFXAsset.h \
    Common_3/ThirdParty/OpenSource/TressFX/TressFXFileFormat.h \
    Common_3/ThirdParty/OpenSource/VulkanMemoryAllocator/VulkanMemoryAllocator.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/additive_animation_builder.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/animation_builder.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/animation_optimizer.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/fbx/fbx.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/fbx/fbx_animation.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/fbx/fbx_skeleton.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/raw_animation.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/raw_animation_utils.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/raw_skeleton.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/raw_track.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/skeleton_builder.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/tools/import2ozz.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/track_builder.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/offline/track_optimizer.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/animation.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/blending_job.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/ik_aim_job.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/ik_two_bone_job.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/local_to_model_job.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/sampling_job.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/skeleton.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/skeleton_utils.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/track.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/track_sampling_job.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/track_triggering_job.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/animation/runtime/track_triggering_job_stl.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/map.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/set.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/string.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/string_archive.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/vector.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/containers/vector_archive.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/endianness.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/gtest_helper.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/io/archive.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/io/archive_traits.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/io/stream.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/gtest_math_helper.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/math_archive.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/math_constant.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/math_ex.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/simd_math_archive.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/maths/soa_math_archive.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/memory/allocator.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/base/platform.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/geometry/runtime/skinning_job.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/include/ozz/options/options.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/fbx/fbx2ozz.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/tools/import2ozz_anim.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/tools/import2ozz_config.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/offline/tools/import2ozz_skel.h \
#    Common_3/ThirdParty/OpenSource/ozz-animation/src/animation/runtime/animation_keyframe.h \
    Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu.h \
    Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu_file_headers.h \
    Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu_global_selector_cb.h \
    Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu_global_selector_palette.h \
    Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu_transcoder.h \
    Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu_transcoder_internal.h \
    Common_3/ThirdParty/OpenSource/imgui/imconfig.h \
    Common_3/ThirdParty/OpenSource/imgui/imgui.h \
    Common_3/ThirdParty/OpenSource/imgui/imgui_internal.h \
    Common_3/ThirdParty/OpenSource/renderdoc/renderdoc_app.h \
    Common_3/ThirdParty/OpenSource/rmem/3rd/lz4-r191/lz4.h \
    Common_3/ThirdParty/OpenSource/rmem/inc/rmem.h \
    Common_3/ThirdParty/OpenSource/rmem/inc/rmem_entry.h \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_config.h \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_enums.h \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_hook.h \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_mutex.h \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_platform.h \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_utils.h \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_wrap_win.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_audiosource.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_bassboostfilter.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_biquadresonantfilter.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_bus.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_dcremovalfilter.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_echofilter.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_error.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_fader.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_fft.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_fftfilter.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_file.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_file_hack_off.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_file_hack_on.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_filter.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_flangerfilter.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_internal.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_lofifilter.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_monotone.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_openmpt.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_queue.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_robotizefilter.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_sfxr.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_speech.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_tedsid.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_thread.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_vic.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_vizsn.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_wav.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_waveshaperfilter.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/include/soloud_wavstream.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/speech/darray.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/speech/klatt.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/speech/resonator.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/speech/tts.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/tedsid/sid.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/tedsid/ted.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/wav/dr_flac.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/wav/dr_mp3.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/wav/dr_wav.h \
#    Common_3/ThirdParty/OpenSource/soloud20181119/src/audiosource/wav/stb_vorbis.h \
    Common_3/ThirdParty/OpenSource/tinydds/tinydds.h \
    Common_3/ThirdParty/OpenSource/tinyimageformat/tinyimageformat_apis.h \
    Common_3/ThirdParty/OpenSource/tinyimageformat/tinyimageformat_base.h \
    Common_3/ThirdParty/OpenSource/tinyimageformat/tinyimageformat_bits.h \
    Common_3/ThirdParty/OpenSource/tinyimageformat/tinyimageformat_decode.h \
    Common_3/ThirdParty/OpenSource/tinyimageformat/tinyimageformat_encode.h \
    Common_3/ThirdParty/OpenSource/tinyimageformat/tinyimageformat_query.h \
    Common_3/ThirdParty/OpenSource/tinyktx/tinyktx.h \
    Common_3/ThirdParty/OpenSource/winpixeventruntime/Include/WinPixEventRuntime/PIXEvents.h \
    Common_3/ThirdParty/OpenSource/winpixeventruntime/Include/WinPixEventRuntime/PIXEventsCommon.h \
    Common_3/ThirdParty/OpenSource/winpixeventruntime/Include/WinPixEventRuntime/PIXEventsGenerated.h \
    Common_3/ThirdParty/OpenSource/winpixeventruntime/Include/WinPixEventRuntime/pix3.h \
    Common_3/ThirdParty/OpenSource/winpixeventruntime/Include/WinPixEventRuntime/pix3_win.h \
    Common_3/ThirdParty/OpenSource/zip/miniz.h \
    Common_3/ThirdParty/OpenSource/zip/zip.h \
    Common_3/Tools/AssetPipeline/src/AssetPipeline.h \
    Common_3/Tools/SpirvTools/SpirvTools.h \
    \#Middleware_3
    Middleware_3/Animation/AnimatedObject.h \
    Middleware_3/Animation/Animation.h \
    Middleware_3/Animation/Clip.h \
    Middleware_3/Animation/ClipController.h \
    Middleware_3/Animation/ClipMask.h \
    Middleware_3/Animation/Rig.h \
    Middleware_3/Animation/SkeletonBatcher.h \
    Middleware_3/ECS/BaseComponent.h \
    Middleware_3/ECS/ComponentRepresentation.h \
    Middleware_3/ECS/EntityManager.h \
    Middleware_3/LUA/LuaManager.h \
    Middleware_3/LUA/LuaManagerCommon.h \
    Middleware_3/LUA/LuaManagerImpl.h \
    Middleware_3/LUA/LunaV.hpp \
    Middleware_3/PaniniProjection/Panini.h \
    Middleware_3/ParallelPrimitives/ParallelPrimitives.h \
    Middleware_3/Text/Fontstash.h \
    Middleware_3/UI/AppUI.h \
    Middleware_3/UI/imgui_user.h

unix {
    SOURCES += \
        Common_3/OS/FileSystem/UnixFileSystem.cpp \

    HEADERS += \
        Common_3/OS/FileSystem/UnixFileSystem.h \

}

#Windows specific rules
windows {

    QMAKE_CXXFLAGS -= -Zc:strictStrings
    DEFINES += _WINDOWS
#    DEFINES -= UNICODE
#    DEFINES -= _UNICODE

    SOURCES += \
        Common_3/OS/Windows/WindowsBase.cpp \
        Common_3/OS/Windows/WindowsFileSystem.cpp \
        Common_3/OS/Windows/WindowsLog.cpp \
        Common_3/OS/Windows/WindowsThread.cpp \
        Common_3/OS/Windows/WindowsTime.cpp

    HEADERS += \
        Common_3/ThirdParty/OpenSource/DirectXShaderCompiler/dxcapi.h \
        Common_3/ThirdParty/OpenSource/DirectXShaderCompiler/dxcapi.use.h \


    CONFIG(directx12, directx11|directx12) {

        DEFINES += DIRECT3D12

        SOURCES += \
            Common_3/Renderer/Direct3D12/Direct3D12.cpp \
            Common_3/Renderer/Direct3D12/Direct3D12Hooks.cpp \
            Common_3/Renderer/Direct3D12/Direct3D12Raytracing.cpp \
            Common_3/Renderer/Direct3D12/Direct3D12ShaderReflection.cpp \

        HEADERS += \
            Common_3/Renderer/Direct3D12/Direct3D12CapBuilder.h \
            Common_3/Renderer/Direct3D12/Direct3D12Hooks.h \

    }

    CONFIG(directx11, directx11|directx12) {

        DEFINES += DIRECT3D11

        SOURCES += \
            Common_3/Renderer/Direct3D11/Direct3D11.cpp \
            Common_3/Renderer/Direct3D11/Direct3D11Raytracing.cpp \
            Common_3/Renderer/Direct3D11/Direct3D11ShaderReflection.cpp \

        HEADERS += \
            Common_3/Renderer/Direct3D11/Direct3D11CapBuilder.h \
            Common_3/Renderer/Direct3D11/Direct3D11Commands.h \

    }
}

#Apple (Mac and IOS) specific rules
darwin {

    # We need to force compile some cpp files as objectivecpp files
    QMAKE_CXXFLAGS += -ObjC++ -fobjc-arc -D METAL -Wno-c++14-extensions -Wno-ignored-qualifiers
    QMAKE_CFLAGS += -fobjc-arc -D METAL

    SOURCES += \
        Common_3/OS/Darwin/CocoaFileSystem.mm \
        Common_3/OS/Darwin/DarwinLog.cpp \
        Common_3/OS/Darwin/DarwinThread.cpp \
        Common_3/Renderer/Metal/MetalRaytracing.mm \
        Common_3/Renderer/Metal/MetalRenderer.mm \
        Common_3/Renderer/Metal/MetalShaderReflection.mm \

    macx {
        SOURCES += \
            #Common_3/OS/Darwin/macOSAppDelegate.m \
            Common_3/OS/Darwin/macOSBase.mm \
            Common_3/OS/Darwin/macOSFileSystem.mm \

        HEADERS += \
            #Common_3/OS/Darwin/macOSAppDelegate.h \

    }

    ios {
        SOURCES += \
            Common_3/OS/Darwin/iOSAppDelegate.m \
            Common_3/OS/Darwin/iOSBase.mm \
            Common_3/OS/Darwin/iOSFileSystem.mm \

        HEADERS += \
            Common_3/OS/Darwin/iOSAppDelegate.h \

    }

    HEADERS += \
        Common_3/OS/Darwin/CocoaFileSystem.h \
        Common_3/Renderer/Metal/MetalCapBuilder.h \
        Common_3/Renderer/Metal/MetalMemoryAllocator.h \
        Common_3/Renderer/Metal/MetalMemoryAllocatorDefines.h \

}

#Linux specific rules
linux {

    SOURCES += \
        Common_3/OS/Linux/LinuxBase.cpp \
        Common_3/OS/Linux/LinuxFileSystem.cpp \
        Common_3/OS/Linux/LinuxLog.cpp \
        Common_3/OS/Linux/LinuxThread.cpp \
        Common_3/OS/Linux/LinuxTime.cpp \
        Common_3/Renderer/Vulkan/Vulkan.cpp \
        Common_3/Renderer/Vulkan/VulkanRaytracing.cpp \
        Common_3/Renderer/Vulkan/VulkanShaderReflection.cpp \
        Common_3/ThirdParty/OpenSource/volk/volk.c \
        Common_3/ThirdParty/OpenSource/volk/volkForgeExt.c \

    HEADERS += \
        Common_3/Renderer/Vulkan/VulkanCapsBuilder.h \
        Common_3/ThirdParty/OpenSource/volk/volk.h \
        Common_3/ThirdParty/OpenSource/volk/volkForgeExt.h \

}

#Android specific rules
android {

    SOURCES += \
        Common_3/OS/Android/AndroidBase.cpp \
        Common_3/OS/Android/AndroidFileSystem.cpp \
        Common_3/OS/Android/AndroidLog.cpp \
        Common_3/OS/Android/AndroidThread.cpp \
        Common_3/OS/Android/AndroidTime.cpp \
        Common_3/Renderer/Vulkan/Vulkan.cpp \
        Common_3/Renderer/Vulkan/VulkanRaytracing.cpp \
        Common_3/Renderer/Vulkan/VulkanShaderReflection.cpp \
        Common_3/ThirdParty/OpenSource/volk/volk.c \
        Common_3/ThirdParty/OpenSource/volk/volkForgeExt.c \

    HEADERS += \
        Common_3/Renderer/Vulkan/VulkanCapsBuilder.h \
        Common_3/ThirdParty/OpenSource/volk/volk.h \
        Common_3/ThirdParty/OpenSource/volk/volkForgeExt.h \

}

# Default rules for deployment.
unix {
    target.path = $$[QT_INSTALL_PLUGINS]/generic
}
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    Middleware_3/PaniniProjection/Shaders/D3D12/panini_projection.frag \
    Middleware_3/PaniniProjection/Shaders/D3D12/panini_projection.vert \
    Middleware_3/PaniniProjection/Shaders/Vulkan/panini_projection.frag \
    Middleware_3/PaniniProjection/Shaders/Vulkan/panini_projection.vert \
    Middleware_3/PaniniProjection/Shaders/Metal/panini_projection.frag.metal \
    Middleware_3/PaniniProjection/Shaders/Metal/panini_projection.vert.metal \
    Middleware_3/ParallelPrimitives/Shaders/Metal/ParallelPrimitives.comp.metal \
    Middleware_3/Text/Shaders/D3D11/fontstash.frag \
    Middleware_3/Text/Shaders/D3D11/fontstash2D.vert \
    Middleware_3/Text/Shaders/D3D11/fontstash3D.vert \
    Middleware_3/Text/Shaders/D3D12/fontstash.frag \
    Middleware_3/Text/Shaders/D3D12/fontstash2D.vert \
    Middleware_3/Text/Shaders/D3D12/fontstash3D.vert \
    Middleware_3/Text/Shaders/Metal/fontstash.frag.metal \
    Middleware_3/Text/Shaders/Metal/fontstash2D.vert.metal \
    Middleware_3/Text/Shaders/Metal/fontstash3D.vert.metal \
    Middleware_3/Text/Shaders/Vulkan/fontstash.frag \
    Middleware_3/Text/Shaders/Vulkan/fontstash2D.vert \
    Middleware_3/Text/Shaders/Vulkan/fontstash3D.vert \
    Middleware_3/UI/Shaders/D3D11/imgui.frag \
    Middleware_3/UI/Shaders/D3D11/imgui.vert \
    Middleware_3/UI/Shaders/D3D11/textured_mesh.frag \
    Middleware_3/UI/Shaders/D3D11/textured_mesh.vert \
    Middleware_3/UI/Shaders/D3D12/imgui.frag \
    Middleware_3/UI/Shaders/D3D12/imgui.vert \
    Middleware_3/UI/Shaders/D3D12/textured_mesh.frag \
    Middleware_3/UI/Shaders/D3D12/textured_mesh.vert \
    Middleware_3/UI/Shaders/Metal/imgui.frag.metal \
    Middleware_3/UI/Shaders/Metal/imgui.vert.metal \
    Middleware_3/UI/Shaders/Metal/textured_mesh.frag.metal \
    Middleware_3/UI/Shaders/Metal/textured_mesh.vert.metal \
    Middleware_3/UI/Shaders/Vulkan/imgui.frag \
    Middleware_3/UI/Shaders/Vulkan/imgui.vert \
    Middleware_3/UI/Shaders/Vulkan/textured_mesh.frag \
    Middleware_3/UI/Shaders/Vulkan/textured_mesh.vert \
    The-Cute-Forge.pri
