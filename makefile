
GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-exceptions -fno-leading-underscore
ASSPARAMS = --32
objects = loader.o kernel.o
LDPARAMS = -melf_i386

%.o: %.cpp
	g++ $(GPPPARAMS) -c $< -o $@

%.o: %.s
	as $(ASSPARAMS) -o $@ $<

mykernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

install: mykernel.bin
	sudo cp $< /boot/mykernel.bin

.PHONY: install
