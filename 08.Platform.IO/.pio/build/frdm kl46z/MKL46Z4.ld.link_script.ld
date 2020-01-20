STACK_SIZE = 4096;
MEMORY
{
  VECTORS (rx) : ORIGIN = 0x00000000, LENGTH = 0x00000400
  FLASH_PROTECTION (rx) : ORIGIN = 0x00000400, LENGTH = 0x00000010
  FLASH (rx) : ORIGIN = 0x00000410, LENGTH = 256K - 0x00000410
  RAM (rwx) : ORIGIN = 0x1FFFE0C0, LENGTH = 32K - 0xC0
}
ENTRY(Reset_Handler)
SECTIONS
{
    .isr_vector :
    {
        __vector_table = .;
        KEEP(*(.vector_table))
        *(.text.Reset_Handler)
        *(.text.System_Init)
         . = ALIGN(8);
    } > VECTORS
    .flash_protect :
    {
        KEEP(*(.kinetis_flash_config_field))
         . = ALIGN(8);
    } > FLASH_PROTECTION
    .text :
    {
        *(.text*)
        KEEP(*(.init))
        KEEP(*(.fini))
        *crtbegin.o(.ctors)
        *crtbegin?.o(.ctors)
        *(EXCLUDE_FILE(*crtend?.o *crtend.o) .ctors)
        *(SORT(.ctors.*))
        *(.ctors)
        *crtbegin.o(.dtors)
        *crtbegin?.o(.dtors)
        *(EXCLUDE_FILE(*crtend?.o *crtend.o) .dtors)
        *(SORT(.dtors.*))
        *(.dtors)
        *(.rodata*)
        KEEP(*(.eh_frame*))
    } > FLASH
    .ARM.extab :
    {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > FLASH
    __exidx_start = .;
    .ARM.exidx :
    {
        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
    } > FLASH
    __exidx_end = .;
    __etext = .;
    .data : AT (__etext)
    {
        __data_start__ = .;
        *(vtable)
        *(.data*)
        . = ALIGN(8);
        PROVIDE_HIDDEN (__preinit_array_start = .);
        KEEP(*(.preinit_array))
        PROVIDE_HIDDEN (__preinit_array_end = .);
        . = ALIGN(8);
        PROVIDE_HIDDEN (__init_array_start = .);
        KEEP(*(SORT(.init_array.*)))
        KEEP(*(.init_array))
        PROVIDE_HIDDEN (__init_array_end = .);
        . = ALIGN(8);
        PROVIDE_HIDDEN (__fini_array_start = .);
        KEEP(*(SORT(.fini_array.*)))
        KEEP(*(.fini_array))
        PROVIDE_HIDDEN (__fini_array_end = .);
        . = ALIGN(8);
        __data_end__ = .;
    } > RAM
    .bss :
    {
        __bss_start__ = .;
        *(.bss*)
        *(COMMON)
        __bss_end__ = .;
    } > RAM
    .heap :
    {
        __end__ = .;
        end = __end__;
        *(.heap*)
        . = ORIGIN(RAM) + LENGTH(RAM) - STACK_SIZE;
        __HeapLimit = .;
    } > RAM
    .stack_dummy :
    {
        *(.stack)
    } > RAM
    __StackTop = ORIGIN(RAM) + LENGTH(RAM);
    __StackLimit = __StackTop - STACK_SIZE;
    PROVIDE(__stack = __StackTop);
    ASSERT(__StackLimit >= __HeapLimit, "region RAM overflowed with stack")
}
