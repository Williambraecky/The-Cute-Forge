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

Gainput.target = $$GAINPUT_BUILT/libGainput.a
CONFIG(debug, debug|release) {
    Gainput.commands = echo "Building Gainput Library..." && cd \"$$GAINPUT_BUILD_FOLDER\" && make debug -j8 && echo "Done\n"
} else {
    Gainput.commands = echo "Building Gainput Library..." && cd \"$$GAINPUT_BUILD_FOLDER\" && make release -j8 && echo "Done\n"
}
Gainput.depends = $$GAINPUT_BUILD_FOLDER/Makefile
QMAKE_EXTRA_TARGETS += Gainput
PRE_TARGETDEPS += $$GAINPUT_BUILT/libGainput.a
