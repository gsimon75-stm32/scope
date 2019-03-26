## Links

### USB

* [About USB](https://www.beyondlogic.org/usbnutshell/usb1.shtml)
* [MS docs about USB](https://docs.microsoft.com/en-us/windows-hardware/drivers/usbcon/usb-control-transfer#about-the-default-endpoint)
* [Packet formats mostly](http://www.jungo.com/st/support/documentation/windriver/811/wdusb_man_mhtml/node55.html)

### Other (more or less) low-level USB projects

* [Tons of links on Bare Metal programming of STM32](https://buildwall.wordpress.com/2018/02/23/stm32-blue-pill-arm-development-board-first-look-from-arduino-to-bare-metal-programming/)
* [STM32duino-bootloader](https://github.com/rogerclarkmelbourne/STM32duino-bootloader)
* [Lightweight USB device Stack](https://github.com/dmitrystu/libusb_stm32)
* [Bare metal STM32: Writing a USB driver](http://kevincuzner.com/2018/01/29/bare-metal-stm32-writing-a-usb-driver/)


### The most helpful one

* [USB-Tutorial mit STM32](https://www.mikrocontroller.net/articles/USB-Tutorial_mit_STM32#Hello-World_per_USB)

This was one of the most important info:

"Zu Beachten ist hier: Der Endpoint 0 arbeitet 'half-duplex', d.h. es werden nie gleichzeitig Daten gesendet und empfangen (obwohl das für andere Endpoints möglich ist). Daher können wir den Puffer `EP0_BUF` sowohl zum Senden als auch zum Empfangen nutzen und so etwas Speicher sparen."

One more sentence to add: ... and the device must control this half-duplex by carefully timed control of `STAT_TX` and `STAT_RX`.


## RCC Initialisation

### RCC state on reset

```
    RCC_CR        0x00005283 RCC_CR_HSICAL=0x52, RCC_CR_HSITRIM=0x20, RCC_CR_HSIRDY, RCC_CR_HSION
    RCC_CFGR      0x00000000
    RCC_CIR       0x00000000
    RCC_APB2RSTR  0x00000000
    RCC_APB1RSTR  0x00000000
    RCC_AHBENR    0x00000014 RCC_AHBENR_FLITFEN, RCC_AHBENR_SRAMEN
    RCC_APB2ENR   0x00000000
    RCC_APB1ENR   0x00000000
    RCC_BDCR      0x00000000
    RCC_CSR       0x1c000000 RCC_CSR_SFTRSTF, RCC_CSR_PORRSTF, RCC_CSR_PINRSTF
    RCC_AHBRSTR   0x00000000
    RCC_CFGR2     0x00000000
```

### RCC state set by Blinky example

```
    RCC_CR        0x03035283
    RCC_CFGR      0x001d040a
    RCC_CIR       0x00000000
    RCC_APB2RSTR  0x00000000
    RCC_APB1RSTR  0x00000000
    RCC_AHBENR    0x00000014
    RCC_APB2ENR   0x00000010
    RCC_APB1ENR   0x00000000
    RCC_BDCR      0x00000000
    RCC_CSR       0x1c000000
    RCC_AHBRSTR   0x00000000
    RCC_CFGR2     0x00000000
```


### USB Setups of 3 serial dongles

* FTDI = <FTDI FT232R USB UART> at usbus0, cfg=0 md=HOST spd=FULL (12Mbps) pwr=ON (90mA)
* PL1  = <Prolific Technology Inc. USB-Serial Controller> at usbus0, cfg=0 md=HOST spd=FULL (12Mbps) pwr=ON (100mA)
* PL2  = <Prolific Technology Inc. USB 2.0 To COM Device> at usbus1, cfg=0 md=HOST spd=FULL (12Mbps) pwr=ON (100mA)

| Device                        | FTDI                          | PL1                           | PL2                           |
| ----------------------------- | ----------------------------- | ----------------------------- | ----------------------------- |
| bLength =                     | 0x0012                        | 0x0012                        | 0x0012                        |
| bDescriptorType =             | 0x0001                        | 0x0001                        | 0x0001                        |
| bcdUSB =                      | 0x0200                        | 0x0110                        | 0x0110                        |
| bDeviceClass =                | 0x0000 <Probed by if cls>     | 0x0000 <Probed by if cls>     | 0x0000  <Probed by if cls>    |
| bDeviceSubClass =             | 0x0000                        | 0x0000                        | 0x0000                        |
| bDeviceProtocol =             | 0x0000                        | 0x0000                        | 0x0000                        |
| bMaxPacketSize0 =             | 0x0008                        | 0x0040                        | 0x0040                        |
| idVendor =                    | 0x0403                        | 0x067b                        | 0x067b                        |
| idProduct =                   | 0x6001                        | 0x2303                        | 0x2303                        |
| bcdDevice =                   | 0x0600                        | 0x0300                        | 0x0300                        |
| iManufacturer =               | 0x0001 <FTDI>                 | 0x0001 <Prolific Tech.>       | 0x0001  <Prolific Tech.>      |
| iProduct =                    | 0x0002 <FT232R USB UART>      | 0x0002 <USB-Serial Ctrl>      | 0x0002  <USB 2.0 To COM Dev>  |
| iSerialNumber =               | 0x0003 <A6003RBa>             | 0x0000 <no string>            | 0x0000  <no string>           |
| bNumConfigurations =          | 0x0001                        | 0x0001                        | 0x0001                        |

| Configuration index 0         | FTDI                          | PL1                           | PL2                           |
| ----------------------------- | ----------------------------- | ----------------------------- | ----------------------------- |
| bLength =                     | 0x0009                        | 0x0009                        | 0x0009                        |
| bDescriptorType =             | 0x0002                        | 0x0002                        | 0x0002                        |
| wTotalLength =                | 0x0020                        | 0x0027                        | 0x0027                        |
| bNumInterfaces =              | 0x0001                        | 0x0001                        | 0x0001                        |
| bConfigurationValue =         | 0x0001                        | 0x0001                        | 0x0001                        |
| iConfiguration =              | 0x0000 <no string>            | 0x0000 <no string>            | 0x0000 <no string>            |
| bmAttributes =                | 0x00a0                        | 0x0080                        | 0x0080                        |
| bMaxPower =                   | 0x002d                        | 0x0032                        | 0x0032                        |

| Interface 0                   | FTDI                          | PL1                           | PL2                           |
| ----------------------------- | ----------------------------- | ----------------------------- | ----------------------------- |
| bLength =                     | 0x0009                        | 0x0009                        | 0x0009                        |
| bDescriptorType =             | 0x0004                        | 0x0004                        | 0x0004                        |
| bInterfaceNumber =            | 0x0000                        | 0x0000                        | 0x0000                        |
| bAlternateSetting =           | 0x0000                        | 0x0000                        | 0x0000                        |
| bNumEndpoints =               | 0x0002                        | 0x0003                        | 0x0003                        |
| bInterfaceClass =             | 0x00ff <Vendor specific>      | 0x00ff <Vendor specific>      | 0x00ff <Vendor specific>      |
| bInterfaceSubClass =          | 0x00ff                        | 0x0000                        | 0x0000                        |
| bInterfaceProtocol =          | 0x00ff                        | 0x0000                        | 0x0000                        |
| iInterface =                  | 0x0002 <FT232R USB UART>      | 0x0000 <no string>            | 0x0000 <no string>            |

| IN BULK Endpoint              | FTDI                          | PL1                           | PL2                           |
| ----------------------------- | ----------------------------- | ----------------------------- | ----------------------------- |
| Endpoint                      | 0                             | 2                             | 2                             |
| bLength =                     | 0x0007                        | 0x0007                        | 0x0007                        |
| bDescriptorType =             | 0x0005                        | 0x0005                        | 0x0005                        |
| bEndpointAddress =            | 0x0081 <IN>                   | 0x0083 <IN>                   | 0x0083 <IN>                   |
| bmAttributes =                | 0x0002 <BULK>                 | 0x0002 <BULK>                 | 0x0002 <BULK>                 |
| wMaxPacketSize =              | 0x0040                        | 0x0040                        | 0x0040                        |
| bInterval =                   | 0x0000                        | 0x0000                        | 0x0000                        |
| bRefresh =                    | 0x0000                        | 0x0000                        | 0x0000                        |
| bSynchAddress =               | 0x0000                        | 0x0000                        | 0x0000                        |

| OUT BULK Endpoint             | FTDI                          | PL1                           | PL2                           |
| ----------------------------- | ----------------------------- | ----------------------------- | ----------------------------- |
| Endpoint                      | 1                             | 1                             | 1                             |
| bLength =                     | 0x0007                        | 0x0007                        | 0x0007                        |
| bDescriptorType =             | 0x0005                        | 0x0005                        | 0x0005                        |
| bEndpointAddress =            | 0x0002 <OUT>                  | 0x0002 <OUT>                  | 0x0002 <OUT>                  |
| bmAttributes =                | 0x0002 <BULK>                 | 0x0002 <BULK>                 | 0x0002 <BULK>                 |
| wMaxPacketSize =              | 0x0040                        | 0x0040                        | 0x0040                        |
| bInterval =                   | 0x0000                        | 0x0000                        | 0x0000                        |
| bRefresh =                    | 0x0000                        | 0x0000                        | 0x0000                        |
| bSynchAddress =               | 0x0000                        | 0x0000                        | 0x0000                        |

| IN INTERRUPT Endpoint         | FTDI                          | PL1                           | PL2                           |
| ----------------------------- | ----------------------------- | ----------------------------- | ----------------------------- |
| Endpoint                      |                               | 0                             | 0                             |
| bLength =                     |                               | 0x0007                        | 0x0007                        |
| bDescriptorType =             |                               | 0x0005                        | 0x0005                        |
| bEndpointAddress =            |                               | 0x0081 <IN>                   | 0x0081 <IN>                   |
| bmAttributes =                |                               | 0x0003 <INTERRUPT>            | 0x0003 <INTERRUPT>            |
| wMaxPacketSize =              |                               | 0x000a                        | 0x000a                        |
| bInterval =                   |                               | 0x0001                        | 0x0001                        |
| bRefresh =                    |                               | 0x0000                        | 0x0000                        |
| bSynchAddress =               |                               | 0x0000                        | 0x0000                        |

## ADC conversion times

First of all, ADC clk is scaled down from 72 MHz by a prescaler of 2, 4, 6 or 8, generating a freq of 36 MHz, 18 MHz, 12 MHz or 9 MHz.

Officially the maximum is 14 MHz, so 36 MHz is unlikely to work, so effectively we have the last 3 clocks, whose periodicities are
55.5555 ns (for 18 MHz), 83.33333 ns (for 12 MHz) and 111.1111 ns (for 9 MHz).

One conversion requires 12.5 clks plus the sampling time, which can be: 1.5, 7.5, 13.5, 28.5, 41.5, 55.5, 71.5 or 239.5 clks.

Moving the constant 1.5 to the constant overhead, the total conversion may be 14 + {0, 6, 12, 27, 40, 54, 70, 238} clks

Conversion times:

| clk = 18 MHz |        |        |        |        |        |        |        |        |
| ------------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| time [us]    | 0.7777 | 1.1111 | 1.4444 | 2.2777 | 3      | 3.7777 | 4.6666 | 14     |
| freq [kHz]   | 1285.7 | 900    | 692.31 | 439.02 | 333.33 | 264.71 | 214.29 | 71.428 |

| clk = 12 MHz |        |        |        |        |        |        |        |        |
| ------------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| time [us]    | 1.1666 | 1.6666 | 2.1666 | 3.4166 | 4.5    | 5.6666 | 7      | 21     |
| freq [kHz]   | 857.14 | 600    | 461.54 | 292.68 | 222.22 | 176.47 | 142.85 | 47.619 |

| clk = 9 MHz  |        |        |        |        |        |        |        |        |
| ------------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| time [us]    | 1.5555 | 2.2222 | 2.8888 | 4.5555 | 6      | 7.5555 | 9.3333 | 28     |
| freq [kHz]   | 642.86 | 450    | 346.15 | 219.51 | 166.67 | 132.35 | 107.14 | 35.714 |


## Character sets

Fixed width of 4 pixels (25.6 chars wide)
 
```
 .XX. XXX. .XXX XXX. XXXX XXXX .XX. X..X ..X. ...X X..X X... X..X X..X .XX. XXX. .XX. XXX. .XXX XXXX X..X X..X X..X X..X X..X XXXX
 X..X X..X X... X..X X... X... X... X..X ..X. ...X X.X. X... XXXX XX.X X..X X..X X..X X..X X... ..X. X..X X..X X..X X..X X..X ...X
 XXXX XXX. X... X..X XXX. XXX. X.XX XXXX ..X. ...X XX.. X... X..X X.XX X..X XXX. X..X XXX. .XX. ..X. X..X X..X X..X .XX. .XX. .XX.
 X..X X..X X... X..X X... X... X..X X..X ..X. X..X X.X. X... X..X X..X X..X X... X.XX X..X ...X ..X. X..X .XX. XXXX X..X ..X. X...
 X..X XXX. .XXX XXX. XXXX X... .XX. X..X ..X. .XX. X..X XXXX X..X X..X .XX. X... .XXX X..X XXX. ..X. .XX. ..X. X..X X..X ..X. XXXX
                                                                                                                                  
 .XX. .XX. XXX. XXX. .X.. XXXX .XX. XXXX .XX. .XX.
 X.XX X.X. ...X ...X X... X... X... ...X X..X X..X
 XX.X ..X. .XX. ..X. XXXX XXX. XXX. ..X. .XX. .XXX
 X..X ..X. X... ...X ..X. ...X X..X ..X. X..X ...X
 .XX. ..X. XXXX XXX. ..X. XXX. .XX. ..X. .XX. .XX.
```


Variable width (approx. 32 chars wide)

```
 .X. XX. .XX XX. XXX XXX .XX. X.X X ..X X.X X. X..X X..X .X. XX. .X. XX. .XX XXX X.X X.X X..X X.X X.X XXX
 X.X X.X X.. X.X X.. X.. X... X.X X ..X X.X X. XXXX XX.X X.X X.X X.X X.X X.. .X. X.X X.X X..X X.X X.X ..X
 XXX XX. X.. X.X XX. XX. X.XX XXX X ..X XX. X. X..X X.XX X.X XX. X.X XX. .X. .X. X.X X.X X..X .X. .X. .X.
 X.X X.X X.. X.X X.. X.. X..X X.X X X.X X.X X. X..X X..X X.X X.. XXX X.X ..X .X. X.X X.X XXXX X.X .X. X..
 X.X XX. .XX XX. XXX X.. .XX. X.X X .X. X.X XX X..X X..X .X. X.. .XX X.X XX. .X. XXX .X. X..X X.X .X. XXX
                                                                                                                                  
 .X. XX XX. XX. .X. XXX .XX XXX .X. .X.
 X.X .X ..X ..X X.. X.. X.. ..X X.X X.X
 XXX .X .X. .X. XXX XX. XX. .X. .X. .XX
 X.X .X X.. ..X .X. ..X X.X .X. X.X ..X
 .X. .X XXX XX. .X. XX. .X. .X. .X. XX.
```


Fixed width of 3 pixels (32 chars wide)

```
0x20..0x2f:
 ... .X. X.X .X. .XX X.X .X. .X. ..X .X. X.X .X. ... ... ... ..X
 ... .X. X.X XXX XX. ..X X.X .X. .X. ..X .X. .X. ... ... ... ..X
 ... .X. ... .X. .X. .X. .X. ... .X. ..X XXX XXX ... XXX ... .X.
 ... ... ... XXX .XX X.. X.X ... .X. ..X .X. .X. .X. ... ... X..
 ... .X. ... .X. XX. X.X .XX ... ..X .X. X.X .X. .X. ... .X. X..

0x30..0x3f:
 .X. .XX XX. XX. .X. XXX .XX XXX .X. .X. ... ... ..X ... X.. XX. 
 X.X ..X ..X ..X X.. X.. X.. ..X X.X X.X .X. .X. .X. XXX .X. ..X 
 XXX ..X .X. .X. XXX XX. XX. .X. .X. .XX ... ... X.. ... ..X .X. 
 X.X ..X X.. ..X .X. ..X X.X .X. X.X ..X .X. .X. .X. XXX .X. ... 
 .X. ..X XXX XX. .X. XX. .X. .X. .X. XX. ... .X. ..X ... X.. .X. 

0x40..0x4f:
 XXX .X. XX. .XX XX. XXX XXX .XX X.X .X. ..X X.X X.. X.X X.X .X.
 X.X X.X X.X X.. X.X X.. X.. X.. X.X .X. ..X X.X X.. XXX XXX X.X
 XXX XXX XX. X.. X.X XX. XX. X.X XXX .X. ..X XX. X.. X.X XXX X.X
 X.. X.X X.X X.. X.X X.. X.. X.X X.X .X. X.X X.X X.. X.X X.X X.X
 .XX X.X XX. .XX XX. XXX X.. .XX X.X .X. .X. X.X XXX X.X X.X .X.

0x50..0x5f:
 XX. .X. XX. .XX XXX X.X X.X X.X X.X X.X XXX .XX X.. .XX .X. ...  
 X.X X.X X.X X.. .X. X.X X.X X.X X.X X.X ..X .X. X.. ..X X.X ...  
 XX. X.X XX. .X. .X. X.X X.X X.X .X. .X. .X. .X. .X. ..X ... ...  
 X.. XXX X.X ..X .X. X.X X.X XXX X.X .X. X.. .X. ..X ..X ... ...  
 X.. .XX X.X XX. .X. XXX .X. X.X X.X .X. XXX .XX ..X .XX ... XXX  

0x60..0x6f:
 .XX .X. XX. .XX XX. XXX XXX .XX X.X .X. ..X X.X X.. X.X X.X .X.
 ..X X.X X.X X.. X.X X.. X.. X.. X.X .X. ..X X.X X.. XXX XXX X.X
 ... XXX XX. X.. X.X XX. XX. X.X XXX .X. ..X XX. X.. X.X XXX X.X
 ... X.X X.X X.. X.X X.. X.. X.X X.X .X. X.X X.X X.. X.X XXX X.X
 ... X.X XX. .XX XX. XXX X.. .XX X.X .X. .X. X.X XXX X.X X.X .X.

0x70..0x7f:
 XX. .X. XX. .XX XXX X.X X.X X.X X.X X.X XXX .XX .X. XX. X.X ..X  
 X.X X.X X.X X.. .X. X.X X.X X.X X.X X.X ..X .X. .X. .X. .X. .XX  
 XX. X.X XX. .X. .X. X.X X.X X.X .X. .X. .X. X.. .X. ..X ... X.X  
 X.. XXX X.X ..X .X. X.X X.X XXX X.X .X. X.. .X. .X. .X. ... .XX  
 X.. .XX X.X XX. .X. XXX .X. X.X X.X .X. XXX .XX .X. XX. ... ..X  
                                                                                                                                  
```

## ADC timing

We have 3 bits of sampling time in `ADC_SMPRn` from 1.5 to 239.5 cycles.

As per RefMan 11.6.: "The total conversion time is calculated as follows: Tconv = Sampling time + 12.5 cycles"

So the total conversion time by those 3 bits in `ADC_SMPRn`:

* 000: 14 cycles
* 001: 20 cycles
* 010: 26 cycles
* 011: 41 cycles
* 100: 54 cycles
* 101: 68 cycles
* 110: 84 cycles
* 111: 252 cycles

As we use dual adc mode, it has two relevant sub-modes: fast and slow interleaved

In fast interleaved mode adc2 starts immediately and adc1 follows it after 7 clks,
so a total conversion time of 14 clks is the ideal (for 50% overlap), that is `000` in `ADC_SMPRn`.

Slow interleaved mode is similar, only that the delay is 14 clks and the CONT
bit must be cleared, as the conversions are implicitely repeated at every 28 clks.
The sampling must be less than 14 clks, that is `010`.

In addition to this, we have 2 bits of prescaler in RCC:

* 00: PCLK2 divided by 2
* 01: PCLK2 divided by 4
* 10: PCLK2 divided by 6
* 11: PCLK2 divided by 8

So the conversion times (with a PCLK2 of 72 MHz):

|       | SMPRn | ADC  |              PCLK clks        |              microseconds             |
|       | bits  | clks |   00  |   01  |   10  |   11  |    00   |    01   |    10   |    11   |
|-------|-------|------|-------|-------|-------|-------|---------|---------|---------|---------|
| fast  |  000  |    7 |   14  |   28  |   42  |   56  | *0.194* | *0.388* |  0.583  | *0.777* |
| slow  |  010  |   14 |   28  |   56  |   84  |  112  |  0.388  |  0.777  |  1.166  | *1.555* |


As per RefMan 11.1.: "The ADC input clock ... must not exceed 14 MHz", which means
a minimal prescaler of 5.14, that is 6, so the '10' column is guaranteed to work.

Most probably '01' works as well, maybe with somewhat degraded precision, but '00'
is questionable.

On the PC side some resampling is unavoidable, possible over-sampling, meaning that
we sample with smaller intervals than the desired. This means a bigger number of
required samples though, and as we want 512 samples and can have at most 1024,
this means a maximal over-sampling factor of 2, so for a desired interval `t`
we must sample at `t/2 .. t`:

* 200 nsec:  0.194 = fast,00
* 500 nsec:  0.388 = fast,01
*   1 usec:  0.777 = fast,11
*   2 usec:  1.555 = slow,11

As the slow mode would be used only for the 2-usec sampling, we can just skip it and keep
only the other three. If there is a need for 2-usec, then we still can resample it on the pc-side
from the 0.777 periodicity.


## Digital sample timing

TIM1 is used to drive the DMA that samples GPIOA.

TIM1's base clock is APB2 clk = 72 MHz, and to conform the analog sampling we need the same or similar periodicity.

The freq of the analog sampling is 72 MHz / {2,4,6,8} / 7 = 72 MHz / (14 * {1,2,3,4})

[//]: # ( vim: set sw=4 ts=4 et: )
