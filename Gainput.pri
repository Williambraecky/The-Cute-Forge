system("echo Running qmake for Gainput Project...")


GAINPUT_BUILD_FOLDER = $$THE_FORGE_ROOT/Build/Gainput

if (!exists($$THE_FORGE_ROOT/Build)) {
    system("mkdir \"$$THE_FORGE_ROOT/Build\"")
}
if (!exists($$GAINPUT_BUILD_FOLDER)) {
    system("mkdir \"$$GAINPUT_BUILD_FOLDER\"")
}

system("cd \"$$GAINPUT_BUILD_FOLDER\" && qmake \"$$THE_FORGE_ROOT/gainput.pro\" CONFIG+=debug_and_release")
CONFIG(debug, debug|release) {
    GAINPUT_BUILT = $$GAINPUT_BUILD_FOLDER/debug
} else {
    GAINPUT_BUILT = $$GAINPUT_BUILD_FOLDER/release
}

unix:Gainput.target = $$GAINPUT_BUILT/libGainput.a
windows:Gainput.target = $$GAINPUT_BUILT/Gainput.lib
CONFIG(debug, debug|release) {
    unix:Gainput.commands = echo "Building Gainput Library..." && cd \"$$GAINPUT_BUILD_FOLDER\" && make debug -j8 && echo "Done\n"
    windows:Gainput.commands = echo "Building Gainput Library..." && cd \"$$GAINPUT_BUILD_FOLDER\" && jom debug -j8 && echo "Done\n"
} else {
    unix:Gainput.commands = echo "Building Gainput Library..." && cd \"$$GAINPUT_BUILD_FOLDER\" && make release -j8 && echo "Done\n"
    windows:Gainput.commands = echo "Building Gainput Library..." && cd \"$$GAINPUT_BUILD_FOLDER\" && jom release -j8 && echo "Done\n"
}
Gainput.depends = $$GAINPUT_BUILD_FOLDER/Makefile
QMAKE_EXTRA_TARGETS += Gainput
unix:PRE_TARGETDEPS += $$GAINPUT_BUILT/libGainput.a
windows:PRE_TARGETDEPS += $$GAINPUT_BUILT/Gainput.lib
