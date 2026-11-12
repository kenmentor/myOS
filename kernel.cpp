#include "types.h"

void printf(const char *text)
{
    volatile uint16_t *VideoMemory = (uint16_t *)0xb8000;
    for (int i = 0; text[i] != '\0'; ++i)
    {
        VideoMemory[i] = (VideoMemory[i] & 0xFF00) | (0x0F << 8) | (unsigned char)text[i];
    }
}
typedef void (*Constructor)();
extern "C" Constructor *start_ctors;
extern "C" Constructor *end_ctors;

extern "C" void callConstructors()
{
    for (Constructor *i = start_ctors; i != end_ctors; i++)
        (*i)();
}
extern "C" void kernelMain(void *multiboot_strucure, uint32_t magicnumber)
{
    printf("hello world mentor thisis my kernel message ----------");
    while (1)
        ;
}