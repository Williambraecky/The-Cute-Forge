system("echo Running qmake for The Forge Library Project...")

THEFORGE_BUILD_FOLDER = $$THE_FORGE_ROOT/Build/TheForge
GAINPUT_BUILD_FOLDER = $$THE_FORGE_ROOT/Build/Gainput

if (!exists($$THE_FORGE_ROOT/Build)) {
    system("echo \"Creating Build Folder\"")
    system("mkdir \"$$THE_FORGE_ROOT/Build\"")
}
if (!exists($$THEFORGE_BUILD_FOLDER)) {
    system("mkdir \"$$THEFORGE_BUILD_FOLDER\"")
}

system("cd \"$$THEFORGE_BUILD_FOLDER\" && qmake \"$$THE_FORGE_ROOT/The-Cute-Forge.pro\" CONFIG+=debug_and_release")
CONFIG(debug, debug|release) {
    THE_FORGE_BUILT = $$THEFORGE_BUILD_FOLDER/debug
    GAINPUT_BUILT = $$GAINPUT_BUILD_FOLDER/debug
} else {
    THE_FORGE_BUILT = $$THEFORGE_BUILD_FOLDER/release
    GAINPUT_BUILT = $$GAINPUT_BUILD_FOLDER/release
}

unix:TheForgeLib.target = $$THE_FORGE_BUILT/libTheForge.a
windows:TheForgeLib.target = $$THE_FORGE_BUILT/TheForge.lib
CONFIG(debug, debug|release) {
    unix:TheForgeLib.commands = echo "Building The Forge Library..." && cd \"$$THEFORGE_BUILD_FOLDER\" && make debug -j8 && echo "Done\n"
    windows:TheForgeLib.commands = echo "Building The Forge Library..." && cd \"$$THEFORGE_BUILD_FOLDER\" && jom debug -j8 && echo "Done\n"
} else {
    unix:TheForgeLib.commands = echo "Building The Forge Library..." && cd \"$$THEFORGE_BUILD_FOLDER\" && make release -j8 && echo "Done\n"
    windows:TheForgeLib.commands = echo "Building The Forge Library..." && cd \"$$THEFORGE_BUILD_FOLDER\" && jom release -j8 && echo "Done\n"
}
TheForgeLib.depends = $$THEFORGE_BUILD_FOLDER/Makefile

QMAKE_EXTRA_TARGETS += TheForgeLib
unix:PRE_TARGETDEPS += $$THE_FORGE_BUILT/libTheForge.a
windows:PRE_TARGETDEPS += $$THE_FORGE_BUILT/TheForge.lib

LIBS += -L$$THE_FORGE_BUILT -lTheForge -L$$GAINPUT_BUILT -lGainput

#Add include paths
INCLUDEPATH += $$THE_FORGE_ROOT/Common_3/ $$THE_FORGE_ROOT/Middleware_3/
