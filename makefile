GPPPARAMS = -m32
ASSPARAMS = --32
objects = loader.0 kernel.o
LDPARAMS = Mmelf_i386 

%.0: %.cpp
       g++ $(GPPPARAMS) -o $@ -c $<
%.o:%.s
     as $(ASSPARAMS) - O $<

mylinker.bin: limker.ld $(objects)
         ld $(LDPARAMS) - T $< -O $(objects)
install: myke rnel.bin 
         sudo cp $< /boot/mykenel.bin 