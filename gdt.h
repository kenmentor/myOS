#include "types.h"
#ifndef __GDT_H
#define __GDT_H

class GlobalDescriptionTable
{
public:
    class SegmentDescriptor
    {
    private:
        uint16_t limit_lo;
        uint16_t base_lo;
        uint8_t base_hi;
        uint8_t type;
        uint8_t base_vhi;

    public:
        SegmentDescriptor(uint32_t base, uint32_t limit, uint8_t type) {}

    } __attribute__((packed));
};

#endif
