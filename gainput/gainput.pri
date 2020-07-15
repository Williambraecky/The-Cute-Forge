Gainput.target = $$GAINPUT_ROOT/libGainput.a
Gainput.commands = cd $$GAINOUT_ROOT && qmake gainput.pro && make -j8
Gainput.depends = $$GAINPUT_ROOT/Makefile
QMAKE_EXTRA_TARGETS += Gainput
