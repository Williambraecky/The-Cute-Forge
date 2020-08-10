#
# Please note this was only tested on mac and windows, you are welcome to modify it to work on other platforms aswell
#

CONFIG += c++14

# Ignore annoying warnings
mac {
    QMAKE_CXXFLAGS += -Wno-ignored-qualifiers -Wno-unused-parameter
    QMAKE_CXXFLAGS_WARN_ON += -Wno-ignored-qualifiers -Wno-unused-parameter
}

THE_FORGE_ROOT = $$PWD/../../../..
include($$THE_FORGE_ROOT/The-Cute-Forge.pri)

# Force build folder to be in root folder/Build/Gainput/[debug|release]
release: DESTDIR = release
debug:   DESTDIR = debug

OBJECTS_DIR = $$DESTDIR/obj
MOC_DIR = $$DESTDIR/obj
RCC_DIR = $$DESTDIR/obj
UI_DIR = $$DESTDIR/obj

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.

# We will not use any qt feature so no need for this
#DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Add the forge and gainput as library
# NOTE: This setup is made to compile without using shadow build, it will not find the libraries when using shadow build

SOURCES += \
    ../../src/01_Transformations/01_Transformations.cpp \

HEADERS += \

FORMS +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    "../../macOS Xcode/01_Transformations/01_Transformations/Base.lproj/MainMenu.xib" \
    ../../src/01_Transformations/GPUCfg/gpu.cfg \
    ../../src/01_Transformations/Shaders/D3D11/basic.frag \
    ../../src/01_Transformations/Shaders/D3D11/basic.vert \
    ../../src/01_Transformations/Shaders/D3D11/skybox.frag \
    ../../src/01_Transformations/Shaders/D3D11/skybox.vert \
    ../../src/01_Transformations/Shaders/D3D12/basic.frag \
    ../../src/01_Transformations/Shaders/D3D12/basic.vert \
    ../../src/01_Transformations/Shaders/D3D12/skybox.frag \
    ../../src/01_Transformations/Shaders/D3D12/skybox.vert \
    ../../src/01_Transformations/Shaders/Vulkan/basic.frag \
    ../../src/01_Transformations/Shaders/Vulkan/basic.vert \
    ../../src/01_Transformations/Shaders/Vulkan/skybox.frag \
    ../../src/01_Transformations/Shaders/Vulkan/skybox.vert \
    ../../src/01_Transformations/Shaders/Metal/basic.frag.metal \
    ../../src/01_Transformations/Shaders/Metal/basic.vert.metal \
    ../../src/01_Transformations/Shaders/Metal/skybox.frag.metal \
    ../../src/01_Transformations/Shaders/Metal/skybox.vert.metal \


defineTest(copyToDestDir) {
    files = $$1
    dir = $$2
    # replace slashes in destination path for Windows
    win32:dir ~= s,/,\\,g

    !exists($$dir){
        win32:QMAKE_POST_LINK += if not exist $$shell_quote($$dir) $$QMAKE_MKDIR $$shell_quote($$dir) $$escape_expand(\\n\\t)
        !win32:QMAKE_POST_LINK += $$QMAKE_MKDIR $$shell_quote($$dir) $$escape_expand(\\n\\t)
    }

    for(file, files) {
        # replace slashes in source path for Windows
        win32:file ~= s,/,\\,g

        QMAKE_POST_LINK += $$QMAKE_COPY_DIR $$shell_quote($$file) $$shell_quote($$dir) $$escape_expand(\\n\\t)
    }

    export(QMAKE_POST_LINK)
}

windows {

    #TODO: Make D3D11 config

    DEFINES += DIRECT3D12

    #make sure we give the right path to the forge.lib (this is done in the cute forge .pri)
    #we need to link with winpixeventruntime we also need to move it to the executable's directory afterwards
    LIBS += -L../../../../Common_3/ThirdParty/OpenSource/winpixeventruntime/bin -lWinPixEventRuntime
    LIBS += -L../../../../Common_3/ThirdParty/OpenSource/ags/ags_lib/lib/ -lamd_ags_x64
    LIBS += -L../../../../Common_3/ThirdParty/OpenSource/nvapi/amd64 -lnvapi64
    LIBS += -L../../../../Common_3/ThirdParty/OpenSource/DirectXShaderCompiler/lib/x64 -ldxcompiler
    LIBS += -lXinput -lgdi32 -lComdlg32 -lOle32

    copyToDestDir(../../../../Common_3/ThirdParty/OpenSource/winpixeventruntime/bin/WinPixEventRuntime.dll \
                  ../../../../Common_3/ThirdParty/OpenSource/ags/ags_lib/lib/amd_ags_x64.dll \
                  ../../../../Common_3/ThirdParty/OpenSource/DirectXShaderCompiler/bin/x64/dxcompiler.dll \
                  ../../../../Common_3/ThirdParty/OpenSource/DirectXShaderCompiler/bin/x64/dxil.dll, $$DESTDIR)


    Shaders += \
        ../../src/01_Transformations/Shaders/D3D12/basic.frag \
        ../../src/01_Transformations/Shaders/D3D12/basic.vert \
        ../../src/01_Transformations/Shaders/D3D12/skybox.frag \
        ../../src/01_Transformations/Shaders/D3D12/skybox.vert \
        $$THE_FORGE_ROOT/Middleware_3/Text/Shaders/D3D12/fontstash.frag \
        $$THE_FORGE_ROOT/Middleware_3/Text/Shaders/D3D12/fontstash2D.vert \
        $$THE_FORGE_ROOT/Middleware_3/Text/Shaders/D3D12/fontstash3D.vert \
        $$THE_FORGE_ROOT/Middleware_3/UI/Shaders/D3D12/imgui.frag \
        $$THE_FORGE_ROOT/Middleware_3/UI/Shaders/D3D12/imgui.vert \
        $$THE_FORGE_ROOT/Middleware_3/UI/Shaders/D3D12/textured_mesh.frag \
        $$THE_FORGE_ROOT/Middleware_3/UI/Shaders/D3D12/textured_mesh.vert \

    copyToDestDir($$Shaders, $$DESTDIR/Shaders)

    GPUCfg += \
        ../../src/01_Transformations/GPUCfg/gpu.cfg \

    copyToDestDir($$GPUCfg, $$DESTDIR/GPUCfg)

    Fonts += \
        ../../UnitTestResources/Fonts \

    copyToDestDir($$Fonts, $$DESTDIR/Fonts)

    Textures += \
        ../../UnitTestResources/Textures/Skybox_right1.dds \
        ../../UnitTestResources/Textures/Skybox_left2.dds \
        ../../UnitTestResources/Textures/Skybox_top3.dds \
        ../../UnitTestResources/Textures/Skybox_bottom4.dds \
        ../../UnitTestResources/Textures/Skybox_front5.dds \
        ../../UnitTestResources/Textures/Skybox_back6.dds \

    copyToDestDir($$Textures, $$DESTDIR/Textures)

}

macos {

    #Overly complicated apple stuff

    SOURCES += \
        ../../../../Common_3/OS/Darwin/macOSAppDelegate.m \


    HEADERS += \
        ../../../../Common_3/OS/Darwin/macOSAppDelegate.h \

    DISTFILES += \
        ./MainMenu.xib

    #Force some .cpp files to be compiled as .mm files, the forge uses xcode to do this normally
    #Also uses automatic referencing mode, needed for macOSAppDelegate.m
    #And define METAL for forge
    QMAKE_CXXFLAGS += \
        -ObjC++ \
        -fobjc-arc \
        -D METAL \

    QMAKE_CFLAGS += \
        -fobjc-arc \
        -D METAL \

    #Make sure we use the necessary frameworks
    LIBS += \
        -framework Metal \
        -framework MetalKit \
        -framework MetalPerformanceShaders \
        -framework Cocoa \
        -framework CoreFoundation \
        -framework QuartzCore \
        -framework IOKit \

    #Create custom target to compile MainMenu.xib, a file required by the application for macos
    # Directly generate the nib file (on qmake call) so it exists for Base_RESOURCES.files
    system("ibtool --compile \"$$PWD/MainMenu.nib\" \"$$PWD/MainMenu.xib\"")
    # Then rebuild if xib file change (on make call)
    MainMenu.target = $$PWD/MainMenu.nib
    MainMenu.commands = ibtool --compile \"$$PWD/MainMenu.nib\" \"$$PWD/MainMenu.xib\"
    MainMenu.depends = "$$PWD/MainMenu.xib"

    QMAKE_EXTRA_TARGETS += MainMenu

    #Inclued MainMenu.nib in Resources/Base.lproj
    Base_RESOURCES.files += \
        $$PWD/MainMenu.nib \

    Base_RESOURCES.path = Contents/Resources/Base.lproj
    QMAKE_BUNDLE_DATA += Base_RESOURCES

    Shaders.files += \
        ../../src/01_Transformations/Shaders/Metal/basic.frag.metal \
        ../../src/01_Transformations/Shaders/Metal/basic.vert.metal \
        ../../src/01_Transformations/Shaders/Metal/skybox.frag.metal \
        ../../src/01_Transformations/Shaders/Metal/skybox.vert.metal \
        $$THE_FORGE_ROOT/Middleware_3/Text/Shaders/Metal/fontstash.frag.metal \
        $$THE_FORGE_ROOT/Middleware_3/Text/Shaders/Metal/fontstash2D.vert.metal \
        $$THE_FORGE_ROOT/Middleware_3/Text/Shaders/Metal/fontstash3D.vert.metal \
        $$THE_FORGE_ROOT/Middleware_3/UI/Shaders/Metal/imgui.frag.metal \
        $$THE_FORGE_ROOT/Middleware_3/UI/Shaders/Metal/imgui.vert.metal \
        $$THE_FORGE_ROOT/Middleware_3/UI/Shaders/Metal/textured_mesh.frag.metal \
        $$THE_FORGE_ROOT/Middleware_3/UI/Shaders/Metal/textured_mesh.vert.metal \

    Shaders.path = Contents/Resources/Shaders
    QMAKE_BUNDLE_DATA += Shaders

    GPUCfg.files += \
        ../../src/01_Transformations/GPUCfg/gpu.cfg \

    GPUCfg.path = Contents/Resources/GPUCfg
    QMAKE_BUNDLE_DATA += GPUCfg

    Fonts.files += \
        ../../UnitTestResources/Fonts \

    Fonts.path = Contents/Resources/
    QMAKE_BUNDLE_DATA += Fonts

    Textures.files += \
        ../../UnitTestResources/Textures/Skybox_right1.dds \
        ../../UnitTestResources/Textures/Skybox_left2.dds \
        ../../UnitTestResources/Textures/Skybox_top3.dds \
        ../../UnitTestResources/Textures/Skybox_bottom4.dds \
        ../../UnitTestResources/Textures/Skybox_front5.dds \
        ../../UnitTestResources/Textures/Skybox_back6.dds \

    Textures.path = Contents/Resources/Textures
    QMAKE_BUNDLE_DATA += Textures

}
