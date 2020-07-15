#
# Please note this was only tested on mac and windows, you are welcome to modify it to work on other platforms aswell
#

CONFIG += c++11


# The example uses relative path like such: ../../../src/01_Transformations/foo
# This is made to be built without shadow building
release: DESTDIR = release
debug:   DESTDIR = debug

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.qrc
UI_DIR = $$DESTDIR/.ui

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

# Modify if needed
THE_FORGE_ROOT = $$PWD/../../../..
# Modify if needed
GAINPUT_ROOT = $$THE_FORGE_ROOT/gainput
include($$THE_FORGE_ROOT/The-Cute-Forge.pri)

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

windows {

    #TODO: Make D3D11 config

    DEFINES += DIRECT3D12

    #make sure we give the right path to the forge.lib (this is done in the cute forge .pri)
    #we need to link with winpixeventruntime we also need to move it to the executable's directory afterwards
    LIBS += -L../../../../Common_3/ThirdParty/OpenSource/winpixeventruntime/bin -lWinPixEventRuntime
    LIBS += -lXinput -lgdi32 -lComdlg32

    WINPIX_DLL.commands += $(COPY_FILE) \"..\\..\\..\\..\\Common_3\\ThirdParty\\OpenSource\\winpixeventruntime\\bin\\WinPixEventRuntime.dll\" \"$$DESTDIR\\WinPixEventRuntime.dll\"

    first.depends = $(first) WINPIX_DLL
    export(first.depends)
    export(WINPIX_DLL.commands)
    QMAKE_EXTRA_TARGETS += first WINPIX_DLL
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
    MainMenu.target = MainMenu.nib
    MainMenu.commands = ibtool --compile \"$$PWD/MainMenu.nib\" \"$$PWD/MainMenu.xib\"
    MainMenu.depends = "$$PWD/MainMenu.xib"

    QMAKE_EXTRA_TARGETS += MainMenu

    #Inclued MainMenu.nib in Resources/Base.lproj
    Base_RESOURCES.files += \
        $$PWD/MainMenu.nib \

    Base_RESOURCES.path = Contents/Resources/Base.lproj
    QMAKE_BUNDLE_DATA += Base_RESOURCES

    #Necessary??? the file should probably be remade to use qt variables instead of xcode ones
    #QMAKE_INFO_PLIST = "../macOS Xcode/01_Transformations/01_Transformations/Info.plist"
}
