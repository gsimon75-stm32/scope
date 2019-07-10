# An oscilloscope based on the STM32F103 'blue pill' module

With AVR the maximal sampling rate I could achieve was around 1 Msps, and that is barely enough to distinguish a sine
wave from a triangle wave at 125 kHz, and for an RFID oscillator tuning I needed to see the sines as sines (to
spot the spikes you get when it's out of tune).

This is how I decided to 'reimplement' it on STM32, and then the rabbit hole turned out to be deeper.
A lot deeper, in fact :D.

The final result is a flashable `.elf` binary that implements a USB peripheral, and an SDL-based PC client that
talks with the peripheral.

It is still just my hobby project, so don't expect it to be polished as an off-the-shelf product should be.


## Capabilities

* 3 sampling speeds: 200 ns, 500 ns and 1 us per sample
* 2 analog channels (pins B1 and B0) with interleaved sampling
* Vmin = 0 V, Vmax = 3.3 V, clamped to Vcc and GND by internal protective diodes
* 8 digital channels (pins A0 to A7)
* Analog trigger source: Channel 0 (pin B0)
* Digital trigger source: Input 0 (pin A0)
* Configurable trigger type (Rising / Falling / Free-running) and level

* A configurable PWM generator on A15



## STM32F103

It's a cheap but extemely powerful little beasty, it's an ARM7 processor with flash and SRAM on the chip, a bunch of
peripherals.

Download [the reference manual](https://www.st.com/content/ccc/resource/technical/document/reference_manual/59/b9/ba/7f/11/af/43/d5/CD00171190.pdf/files/CD00171190.pdf/jcr:content/translations/en.CD00171190.pdf), you'll need it quite frequently anyway.

It has a very nice support, a C/C++ compiler, libraries, RTOS kernel, whatever you might want if you see it as a
*computer platform*.

On the other hand, I wanted to use it as a microcontroller (or rather, as a *macrocontroller*), so I wanted nothing
to tie my hands, and definitely not wanting to programmatically fill initialiser structures in RAM just to pass on
to library routines so they can initialise memory-mapped registers according to them.

I didn't want the hardware 'abstracted away' from my sight. If I'm programming on the bare metal itself, I like to
see it, to know it, to have control over it.

If I'm not interested in the bits and the hardware, I do it in some script language or some garbage-collected
OOP language that doesn't even need the concept of memory...

So it quickly turned out that it'll be assembly (see the Instruction Set in the [ARMv7 Reference Manual](https://web.eecs.umich.edu/~prabal/teaching/eecs373-f10/readings/ARMv7-M_ARM.pdf)), with my usual `m4` layer for macros and support for local symbols and suchlike.

The symbols/constants from the original support libraries and includes had to be converted to m4 defines, but
once it was done, the toolchain was ready. (Oh, you'll probably need a JTAG/SWD adapter for debugging, I
recommend one by Segger.)


### The 'framework'

The first two things you need when doing it from scratch is a boot code that initialises at least the clocks,
and a linker file to define what goes where. You find them in `rte/`.

Btw, the `.asm4` files are basically assembly sources that are to be passed to `m4`, which generates the `.s`
raw sources, with constants and expressions evaluated, local labels name-mangled, etc.

The symbols and macros are defined in `include/`, on three levels:

* Boilerplate: Common macros, nothing about hardware. Deep m4 magic, write-only code, ugly as hell...
* Core CM3: The Cortex-M3 symbols
* STM32F10x: The STM32F10x symbols

Apart from this, it's straightforward, just take a look at the `Makefile`.


## The long march

Doing everything from scratch was sort of ... educational.

Writing the boot code (`rte/boot.asm4`) required learning about the basic architecture of ARMv7 and Cortex-M3.

Writing the USB support (`usb.asm4`) required learning *a lot* about USB, from the lowest layers, and as it
can't really be debugged (there are internal protocol timeouts), it was a long struggle to get it right.

While writing the PC client I learned a lot about `libusb` and `SDL`, and even dusted off my old knowledge about
signals and threads :).

Meanwhile I needed some textual debug output (without being stopped by `gdb`), so I wired an ST7789-based OLED
display to the macrocontroller, and so I learned its interface as well. The file `st7789.asm4` is no longer
needed, but that may change if I decide to use it as a standalone scope display.

Another approach for fast debug output was to implement an in-memory log buffer (a'la `dmesg`), see `log.asm4`,
which is also no longer needed, and I hope it stays this way...

And the oscilloscope code itself, in `main.asm4`, which

* Uses two ADCs in a master-slave interleaved sampling mode
* Transfers the samples via DMA
* Uses the DMA completion IRQ to convert and pass the data to the USB 'subsystem' for sending
* All this parametrised and controlled by commands incoming on USB

Well, it indeed was a long march (just check the commit log...), but it was fun, and I couldn't have learned
all this by just reading the books or others' sources.


## The scope 'firmware'

You can build the 'firmware' by `make` in the main folder, the result will be called `test.elf`.

By default it's built for being written into the flash (`BUILD ?= flash` in `Makefile`), but if you're experimenting,
then you can build it for booting from SRAM as well, and spare some of the lifetime of the flash.

As of uploading it to the device, I use a JTAG/SWD adapter with `openocd` (start it with `make ocd`) and `gdb`
(`make gdb`), and then just type `load test.elf`.

If you just want to flash the device and not bother with the toolchain... I must admit I haven't really investigated
this use case. If you hit this, just open an issue or send me a mail and I'll find a way for it.


## The scope client

The PC client can be built in the `pc/` folder by `make`, and started by `./scope`.

The keys:

* Left/Right: Change sampling frequency
* Up/Down: Adjust the trig level
* T: Cycle the trig type between Rising, Falling, None
* S: Cycle the trig source between Analog and Digital

* PgUp/PgDown: Adjust the PWM active period
* Shift + PgUp/PgDown: Adjust the PWM total period
* L: Lock/Unlock the PWM duty ratio

* 1-4: Special functions, now:
* 1,2: None
* 3: Set the PWM to 7200 Hz 50%
* 4: Set the PWM to 125 kHz 50%

* Esc: Exit


## Conclusion

It's definitely a personal hobby project in the sense that I made it for myself, so it's probably not the best
tool for everyone else, and definitely not an industrial-grade product. It wasn't even intended to be that.

It works for me, and now I'm using it for quite a time without anything to fix or change it, so it would
deserve a 'v1.0', but that's all it is: a tool that's handy for one person.

As of the other aspect, as a learning project, it was highly successful! What I learned *on the way here*,
well, it could easily fill a semester of a course, with no slack time :D. The real question is only that 
does anybody need this knowledge in these days or not...

And finally, I can wholeheartedly testify that this project was definitely a fun to accomplish :D !


