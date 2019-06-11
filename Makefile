TARGETS         = test.elf
#BUILD           ?= flash
BUILD           ?= sram

AS              = arm-none-eabi-as
AR              = arm-none-eabi-ar
LD              = arm-none-eabi-ld
OC              = arm-none-eabi-objcopy
GDB             = arm-none-eabi-gdb
M4              = gm4

DOCPATH         = ~/Documents/electro/stm32f103

MACHINE_FLAGS   = -mthumb -mcpu=cortex-m3 -mimplicit-it=never
INCLUDES        = -I./include

M4FLAGS         = $(INCLUDES) -DSTM32F10X_BASE=1 -DSTM32F10X_MD=1 -DBUILD=$(BUILD)
ASFLAGS         += $(MACHINE_FLAGS) $(INCLUDES) -k -mapcs-reentrant -mccs

.PHONY:		all clean ocd refman instrset ocd gdb stop

all:		$(TARGETS)

clean:
		rm -rf *.o *.a *.elf rte/*.o $(TARGETS)

refman:
		xpdf $(DOCPATH)/STM32F10x_reference_manual.en.CD00171190.pdf &

instrset:
		xpdf $(DOCPATH)/STM32F10x_programming_manual.en.CD00228163.pdf &

ocd:
		openocd -f interface/jlink.cfg -c 'transport select swd' -f target/stm32f1x.cfg &

gdb:
		$(GDB)

stop:
		killall -9 openocd $(GDB)

%.s:		%.asm4 include/boilerplate.m4 include/core_cm3.m4 include/stm32f10x.m4 Makefile
		$(M4) $(M4FLAGS) $< | grep '[^[:space:]]' >$@

%.o:		%.s
		$(AS) -o $@ $(ASFLAGS) $^

test.elf:	rte/stm32f103.$(BUILD).ld rte/boot.o main.o usb.o # st7789.o
		$(LD) -n -T $(filter %.ld,$^) -o $@ $(filter %.o %.a,$^)

