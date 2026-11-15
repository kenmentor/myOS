
GPPPARAMS = -m32 -ffreestanding -fno-use-cxa-atexit -fno-builtin -fno-exceptions -fno-rtti -fno-stack-protector -fno-pic -fno-pie
ASSPARAMS = --32
LDPARAMS = -melf_i386

objects = loader.o gdt.o kernel.o

%.o: %.cpp
	g++ $(GPPPARAMS) -c $< -o $@

%.o: %.s
	as $(ASSPARAMS) -o $@ $<

mykernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T linker.ld -o $@ $(objects)

install: mykernel.bin
	sudo cp $< /boot/mykernel.bin

mykernel.iso: mykernel.bin
	rm -rf iso
	mkdir -p iso/boot/grub
	cp mykernel.bin iso/boot/mykernel.bin
	printf '%s\n' \
		'set timeout=0' \
		'set default=0' \
		'menuentry "My Operating System" {' \
		'    multiboot /boot/mykernel.bin' \
		'    boot' \
		'}' > iso/boot/grub/grub.cfg
	grub-mkrescue -o mykernel.iso iso
	rm -rf iso

clean:
	rm -rf *.o mykernel.bin mykernel.iso iso

run: mykernel.iso
	qemu-system-i386 -cdrom mykernel.iso

.PHONY: run
      
