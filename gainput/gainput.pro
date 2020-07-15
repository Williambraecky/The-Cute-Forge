CONFIG -= qt

TEMPLATE = lib
CONFIG += staticlib

CONFIG += c++11

TARGET = Gainput

INCLUDEPATH += ../Common_3/ThirdParty/OpenSource/gainput/lib/source

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
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputAllocator.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputDeltaState.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputDevice.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputManager.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputMap.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputInputState.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputMapFilters.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltIn.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputDev.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputMemoryStream.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetAddress.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetConnection.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetListener.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gainput.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputButtonStickGesture.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputDoubleClickGesture.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputHoldGesture.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputPinchGesture.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputRotateGesture.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputSimultaneouslyDownGesture.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/gestures/GainputTapGesture.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboard.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardMac.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouse.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePad.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadMac.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/recorder/GainputInputPlayer.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/recorder/GainputInputRecorder.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/recorder/GainputInputRecording.cpp \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputInputDeviceTouch.cpp

HEADERS += \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputHelpersEvdev.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputWindows.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltInAndroid.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltInImpl.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltInNull.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputDev.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputDevProtocol.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputMemoryStream.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetAddress.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetConnection.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputNetListener.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/dev/GainputStream.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardAndroid.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardEvdev.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardIOS.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardImpl.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardLinux.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardMac.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardNull.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardWin.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputInputDeviceKeyboardWinRaw.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/keyboard/GainputKeyboardKeyNames.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseEvdev.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseImpl.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseLinux.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseLinuxRaw.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseNull.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseWin.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseWinRaw.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputMouseInfo.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputControllerDb.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadAndroid.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadImpl.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadLinux.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadMac.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadNull.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadWin.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/gainputinputdirectinputpadwin.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputInputDeviceTouchAndroid.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputInputDeviceTouchImpl.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputInputDeviceTouchIos.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputInputDeviceTouchNull.h \
    ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/touch/GainputTouchInfo.h

darwin {
    SOURCES += \
        ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputIos.mm \
        ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/GainputMac.mm \
        ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltInIos.mm \
        ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMac.mm \
        ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMacRaw.mm \
        ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadIos.mm \

    HEADERS += \
        ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/builtin/GainputInputDeviceBuiltInIos.h \
        ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMac.h \
        ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/mouse/GainputInputDeviceMouseMacRaw.h \
        ../Common_3/ThirdParty/OpenSource/gainput/lib/source/gainput/pad/GainputInputDevicePadIos.h \
}

# Default rules for deployment.
unix {
    target.path = $$[QT_INSTALL_PLUGINS]/generic
}
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    gainput.pri
