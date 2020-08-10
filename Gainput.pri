system("echo Running qmake for Gainput Project...")

CONFIG(debug, debug|release) {
    GAINPUT_BUILD_FOLDER = $$THE_FORGE_ROOT/Build/Gainput/debug
} else {
    GAINPUT_BUILD_FOLDER = $$THE_FORGE_ROOT/Build/Gainput/release
}

if (!exists($$THE_FORGE_ROOT/Build)) {
    system("mkdir \"$$THE_FORGE_ROOT/Build\"")
}
if (!exists($$THE_FORGE_ROOT/Build/Gainput)) {
    system("mkdir \"$$THE_FORGE_ROOT/Build/Gainput\"")
}
if (!exists($$GAINPUT_BUILD_FOLDER)) {
    system("mkdir \"$$GAINPUT_BUILD_FOLDER\"")
}

CONFIG(debug, debug|release) {
    system("cd \"$$GAINPUT_BUILD_FOLDER\" && qmake \"$$THE_FORGE_ROOT/gainput.pro\" CONFIG+=debug")
    GAINPUT_BUILT = $$GAINPUT_BUILD_FOLDER/debug
} else {
    system("cd \"$$GAINPUT_BUILD_FOLDER\" && qmake \"$$THE_FORGE_ROOT/gainput.pro\" CONFIG+=release")
    GAINPUT_BUILT = $$GAINPUT_BUILD_FOLDER/release
}

Gainput.target = $$GAINPUT_BUILT/libGainput.a
Gainput.commands = echo "Building Gainput Library..." && cd \"$$GAINPUT_BUILD_FOLDER\" && make -j8 && echo "Done\n"
Gainput.depends = $$GAINPUT_BUILD_FOLDER/Makefile
QMAKE_EXTRA_TARGETS += Gainput
PRE_TARGETDEPS += $$GAINPUT_BUILT/libGainput.a
