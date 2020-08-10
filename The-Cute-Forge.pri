system("echo Running qmake for The Forge Library Project...")

CONFIG(debug, debug|release) {
    THEFORGE_BUILD_FOLDER = $$THE_FORGE_ROOT/Build/TheForge/debug
    GAINPUT_BUILD_FOLDER = $$THE_FORGE_ROOT/Build/Gainput/debug
} else {
    THEFORGE_BUILD_FOLDER = $$THE_FORGE_ROOT/Build/TheForge/release
    GAINPUT_BUILD_FOLDER = $$THE_FORGE_ROOT/Build/Gainput/release
}

if (!exists($$THE_FORGE_ROOT/Build)) {
    system("echo \"Creating Build Folder\"")
    system("mkdir \"$$THE_FORGE_ROOT/Build\"")
}
if (!exists($$THE_FORGE_ROOT/Build/TheForge)) {
    system("mkdir \"$$THE_FORGE_ROOT/Build/TheForge\"")
}
if (!exists($$THEFORGE_BUILD_FOLDER)) {
    system("mkdir \"$$THEFORGE_BUILD_FOLDER\"")
}

CONFIG(debug, debug|release) {
    system("cd \"$$THEFORGE_BUILD_FOLDER\" && qmake \"$$THE_FORGE_ROOT/The-Cute-Forge.pro\" CONFIG+=debug")
    THE_FORGE_BUILT = $$THEFORGE_BUILD_FOLDER/debug
    GAINPUT_BUILT = $$GAINPUT_BUILD_FOLDER/debug
} else {
    system("cd \"$$THEFORGE_BUILD_FOLDER\" && qmake \"$$THE_FORGE_ROOT/The-Cute-Forge.pro\" CONFIG+=release")
    THE_FORGE_BUILT = $$THEFORGE_BUILD_FOLDER/release
    GAINPUT_BUILT = $$GAINPUT_BUILD_FOLDER/release
}

TheForgeLib.target = $$THE_FORGE_BUILT/libTheForge.a
TheForgeLib.commands = echo "Building The Forge Library..." && cd \"$$THEFORGE_BUILD_FOLDER\" && make -j8 && echo "Done\n"
TheForgeLib.depends = $$THEFORGE_BUILD_FOLDER/Makefile

QMAKE_EXTRA_TARGETS += TheForgeLib
PRE_TARGETDEPS += $$THE_FORGE_BUILT/libTheForge.a

LIBS += -L$$THE_FORGE_BUILT -lTheForge -L$$GAINPUT_BUILT -lGainput

#Add include paths
INCLUDEPATH += $$THE_FORGE_ROOT/Common_3/ $$THE_FORGE_ROOT/Middleware_3/
