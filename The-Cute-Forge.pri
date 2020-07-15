TheForgeLib.target = $$THE_FORGE_ROOT/libTheForge.a
TheForgeLib.commands = cd $$THE_FORGE_ROOT && qmake The-Cute-Forge.pro && make -j8
TheForgeLib.depends = $$THE_FORGE_ROOT/Makefile
QMAKE_EXTRA_TARGETS += TheForgeLib

windows {
    CONFIG(debug, debug|release) {
        THE_FORGE_BUILT = $$THE_FORGE_ROOT/debug
        GAINPUT_BUILT = $$GAINPUT_ROOT/debug
    } else {
        THE_FORGE_BUILT = $$THE_FORGE_ROOT/release
        GAINPUT_BUILT = $$GAINPUT_ROOT/release
    }
} else {
    THE_FORGE_BUILT = $$THE_FORGE_ROOT
    GAINPUT_BUILT = $$GAINPUT_ROOT
}

LIBS += -L$$THE_FORGE_BUILT -lTheForge -L$$GAINPUT_BUILT -lGainput
