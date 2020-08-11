CONFIG -= qt

TEMPLATE = lib
CONFIG += staticlib

CONFIG += c++14

# Ignore annoying warnings
mac {
    QMAKE_CXXFLAGS_WARN_ON += -Wno-ignored-qualifiers -Wno-unused-parameter -Wno-c++14-extensions
}

TARGET = TheForge

THE_FORGE_ROOT = $$PWD

release: DESTDIR = release
debug:   DESTDIR = debug

OBJECTS_DIR = $$DESTDIR/obj
MOC_DIR = $$DESTDIR/obj
RCC_DIR = $$DESTDIR/obj
UI_DIR = $$DESTDIR/obj

#
# NOTE: The end goal of this project is to compile only what is necessary for 3d rendering while also keeping everything as is for more user control
#

# We compile gainput on its own because some flags used to compile The forge are not compatible

include(Gainput.pri)

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
    Common_3/OS/Core/ThreadSystem.cpp \
    Common_3/OS/Core/Timer.cpp \
    Common_3/OS/FileSystem/FileSystem.cpp \
#    Common_3/OS/FileSystem/FileSystemInternal.cpp \
#    Common_3/OS/FileSystem/MemoryStream.cpp \
#    Common_3/OS/FileSystem/SystemFileStream.cpp \
    Common_3/OS/FileSystem/SystemRun.cpp \
#    Common_3/OS/FileSystem/ZipFileStream.cpp \
    Common_3/OS/FileSystem/ZipFileSystem.cpp \
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
    Common_3/ThirdParty/OpenSource/TinyEXR/tinyexr.cpp \
#    Common_3/ThirdParty/OpenSource/TinyXML2/tinyxml2.cpp \
    Common_3/ThirdParty/OpenSource/TressFX/TressFXAsset.cpp \
    Common_3/ThirdParty/OpenSource/basis_universal/transcoder/basisu_transcoder.cpp \
    Common_3/ThirdParty/OpenSource/imgui/imgui.cpp \
    Common_3/ThirdParty/OpenSource/imgui/imgui_demo.cpp \
    Common_3/ThirdParty/OpenSource/imgui/imgui_draw.cpp \
    Common_3/ThirdParty/OpenSource/imgui/imgui_widgets.cpp \
    Common_3/ThirdParty/OpenSource/rmem/3rd/lz4-r191/lz4.c \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_get_module_info.cpp \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_hook.cpp \
    Common_3/ThirdParty/OpenSource/rmem/src/rmem_lib.cpp \
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
    Common_3/ThirdParty/OpenSource/TinyEXR/tinyexr.h \
    Common_3/ThirdParty/OpenSource/TinyXML2/tinyxml2.h \
    Common_3/ThirdParty/OpenSource/TressFX/TressFXAsset.h \
    Common_3/ThirdParty/OpenSource/TressFX/TressFXFileFormat.h \
    Common_3/ThirdParty/OpenSource/VulkanMemoryAllocator/VulkanMemoryAllocator.h \
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
    DEFINES += METAL

    # We need to force compile some cpp files as objectivecpp files
    QMAKE_CXXFLAGS += -ObjC++ -fobjc-arc
    QMAKE_CFLAGS += -fobjc-arc

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
#            Common_3/OS/Darwin/macOSFileSystem.mm \

        HEADERS += \
            #Common_3/OS/Darwin/macOSAppDelegate.h \

    }

    ios {
        SOURCES += \
#            Common_3/OS/Darwin/iOSAppDelegate.m \
            Common_3/OS/Darwin/iOSBase.mm \
#            Common_3/OS/Darwin/iOSFileSystem.mm \

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
