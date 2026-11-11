void printf(const char *text)
{
    volatile unsigned short *VideoMemory = (unsigned short *)0xb8000;
    for (int i = 0; text[i] != '\0'; ++i)
    {
        VideoMemory[i] = (VideoMemory[i] & 0xFF00) | (0x0F << 8) | (unsigned char)text[i];
    }
}
extern "C" void kernelMain(void *multiboot_strucure, unsigned int magicnumber)
{
    printf("hello world mentor thisis my kernel message ----------");
    while (1)
        ;
}