CONFIG -= qt

TEMPLATE = lib
CONFIG += staticlib

CONFIG += c++14

# Ignore annoying warnings
mac {
    QMAKE_CXXFLAGS_WARN_ON += -Wno-ignored-qualifiers -Wno-unused-parameter -Wno-c++14-extensions
}

TARGET = Gainput

THE_FORGE_ROOT = $$PWD

release: DESTDIR = release
debug:   DESTDIR = debug

OBJECTS_DIR = $$DESTDIR/obj
MOC_DIR = $$DESTDIR/obj
RCC_DIR = $$DESTDIR/obj
UI_DIR = $$DESTDIR/obj

INCLUDEPATH += $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source

macx:QMAKE_CXXFLAGS += -ObjC++

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

DEFINES -= UNICODE
DEFINES -= _UNICODE

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputAllocator.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputDeltaState.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputDevice.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputManager.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputMap.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputState.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputMapFilters.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltIn.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputDev.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputMemoryStream.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetAddress.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetConnection.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetListener.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gainput.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputButtonStickGesture.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputDoubleClickGesture.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputHoldGesture.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputPinchGesture.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputRotateGesture.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputSimultaneouslyDownGesture.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputTapGesture.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboard.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardMac.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouse.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePad.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadMac.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/recorder/GainputInputPlayer.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/recorder/GainputInputRecorder.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/recorder/GainputInputRecording.cpp \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputInputDeviceTouch.cpp

HEADERS += \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputHelpersEvdev.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputWindows.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltInAndroid.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltInImpl.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltInNull.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputDev.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputDevProtocol.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputMemoryStream.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetAddress.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetConnection.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetListener.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputStream.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardAndroid.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardEvdev.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardIOS.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardImpl.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardLinux.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardMac.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardNull.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardWin.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardWinRaw.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputKeyboardKeyNames.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseEvdev.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseImpl.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseLinux.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseLinuxRaw.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseNull.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseWin.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseWinRaw.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputMouseInfo.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputControllerDb.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadAndroid.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadImpl.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadLinux.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadMac.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadNull.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadWin.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/gainputinputdirectinputpadwin.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputInputDeviceTouchAndroid.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputInputDeviceTouchImpl.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputInputDeviceTouchIos.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputInputDeviceTouchNull.h \
    $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputTouchInfo.h

darwin {
    SOURCES += \
        $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputIos.mm \
        $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputMac.mm \
        $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltInIos.mm \
        $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMac.mm \
        $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMacRaw.mm \
        $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadIos.mm \

    HEADERS += \
        $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltInIos.h \
        $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMac.h \
        $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMacRaw.h \
        $$THE_FORGE_ROOT/Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadIos.h \
}

# Default rules for deployment.
unix {
    target.path = $$[QT_INSTALL_PLUGINS]/generic
}
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    gainput.pri
