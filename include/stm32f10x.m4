dnl stm32f10x.h
dnl MCD Application Team
dnl V3.5.0
dnl 11-March-2011

include(core_cm3.m4)

dnl Choose ONE series
defsym({STM32F10X_BASE}, 1)     dnl Base series: STM32F10[123]xx
defsym({STM32F10X_VL}, 1)       dnl Value Line series: STM32F100xx
defsym({STM32F10X_CL}, 1)       dnl Connectivity Line series: STM32F10[57]xx

dnl Choose ONE density
defsym({STM32F10X_LD}, 1)       dnl Low density: w/ Flash 16..32 Kbytes.
defsym({STM32F10X_MD}, 1)       dnl Medium density: w/ Flash 64..128 Kbytes.
defsym({STM32F10X_HD}, 1)       dnl High density: w/ Flash 256..512 Kbytes.
defsym({STM32F10X_XL}, 1)       dnl XL density: w/ Flash 512..1024 Kbytes.

dnl Value of the External oscillator in Hz
dnl Tip: To avoid modifying this file each time you need to use different HSE, you
dnl      can define the HSE value in your toolchain compiler preprocessor.
ifdef({HSE_VALUE},,{
defsym({HSE_VALUE}, ifdef({STM32F10X_CL}, 25000000, 8000000))
})

defsym({HSE_STARTUP_TIMEOUT},               0x0500)             dnl Time out for HSE start up
defsym({HSI_VALUE},                         8000000)            dnl Value of the Internal oscillator in Hz

dnl STM32F10x Standard Peripheral Library version number
defsym({__STM32F10X_STDPERIPH_VERSION_MAIN}, 0x03)              dnl [31:24] main version
defsym({__STM32F10X_STDPERIPH_VERSION_SUB1}, 0x05)              dnl [23:16] sub1 version
defsym({__STM32F10X_STDPERIPH_VERSION_SUB2}, 0x00)              dnl [15: 8] sub2 version
defsym({__STM32F10X_STDPERIPH_VERSION_RC},  0x00)               dnl [ 7: 0] release candidate
dnl define({__STM32F10X_STDPERIPH_VERSION},     heval((__STM32F10X_STDPERIPH_VERSION_MAIN << 24) | (__STM32F10X_STDPERIPH_VERSION_SUB1 << 16) | (__STM32F10X_STDPERIPH_VERSION_SUB2 << 8) |(__STM32F10X_STDPERIPH_VERSION_RC)))

dnl Configuration of the Cortex-M3 Processor and Core Peripherals
defsym({__MPU_PRESENT},                     ifdef({STM32F10X_XL}, 1, 0))
defmask({__NVIC_PRIO},                      4, 4)                  dnl STM32 uses 4 Bits for the Priority Levels


dnl STM32F10x Interrupt Number Definition, according to the selected device

dnl ******  ARM7 Processor Exceptions Numbers ********************************************************
defsym({Exception_InitialSP},               0)
defsym({Exception_Reset},                   1)
defsym({Exception_NonMaskableInt},          2)                  dnl Non Maskable Interrupt
defsym({Exception_HardFault},               3)                  dnl Hard Fault
dnl ******  Cortex-M3 Processor Exceptions Numbers ***************************************************
defsym({Exception_MemoryManagement},        4)                  dnl Cortex-M3 Memory Management Interrupt
defsym({Exception_BusFault},                5)                  dnl Cortex-M3 Bus Fault Interrupt
defsym({Exception_UsageFault},              6)                  dnl Cortex-M3 Usage Fault Interrupt
defsym({Exception_SVCall},                  11)                 dnl Cortex-M3 SV Call Interrupt
defsym({Exception_DebugMonitor},            12)                 dnl Cortex-M3 Debug Monitor Interrupt
defsym({Exception_PendSV},                  14)                 dnl Cortex-M3 Pend SV Interrupt
defsym({Exception_SysTick},                 15)                 dnl Cortex-M3 System Tick Interrupt
dnl ******  STM32 specific Interrupt Numbers *********************************************************
def_exc_irq({WWDG},                         16)                 dnl Window WatchDog Interrupt
def_exc_irq({PVD},                          17)                 dnl PVD through EXTI Line detection Interrupt
def_exc_irq({TAMPER},                       18)                 dnl Tamper Interrupt
def_exc_irq({RTC},                          19)                 dnl RTC global Interrupt
def_exc_irq({FLASH},                        20)                 dnl FLASH global Interrupt
def_exc_irq({RCC},                          21)                 dnl RCC global Interrupt
def_exc_irq({EXTI0},                        22)                 dnl EXTI Line0 Interrupt
def_exc_irq({EXTI1},                        23)                 dnl EXTI Line1 Interrupt
def_exc_irq({EXTI2},                        24)                 dnl EXTI Line2 Interrupt
def_exc_irq({EXTI3},                        25)                 dnl EXTI Line3 Interrupt
def_exc_irq({EXTI4},                        26)                 dnl EXTI Line4 Interrupt
def_exc_irq({DMA1_Channel1},                27)                 dnl DMA1 Channel 1 global Interrupt
def_exc_irq({DMA1_Channel2},                28)                 dnl DMA1 Channel 2 global Interrupt
def_exc_irq({DMA1_Channel3},                29)                 dnl DMA1 Channel 3 global Interrupt
def_exc_irq({DMA1_Channel4},                30)                 dnl DMA1 Channel 4 global Interrupt
def_exc_irq({DMA1_Channel5},                31)                 dnl DMA1 Channel 5 global Interrupt
def_exc_irq({DMA1_Channel6},                32)                 dnl DMA1 Channel 6 global Interrupt
def_exc_irq({DMA1_Channel7},                33)                 dnl DMA1 Channel 7 global Interrupt

dnl ******  STM32F10X common
def_exc_irq({CAN1_RX1},                     37)                 dnl CAN1 RX1 Interrupt
def_exc_irq({CAN1_SCE},                     38)                 dnl CAN1 SCE Interrupt
def_exc_irq({EXTI9_5},                      39)                 dnl External Line[9:5] Interrupts
def_exc_irq({TIM1_CC},                      43)                 dnl TIM1 Capture Compare Interrupt
def_exc_irq({TIM2},                         44)                 dnl TIM2 global Interrupt
def_exc_irq({TIM3},                         45)                 dnl TIM3 global Interrupt
def_exc_irq({TIM4},                         46)                 dnl TIM4 global Interrupt
def_exc_irq({I2C1_EV},                      47)                 dnl I2C1 Event Interrupt
def_exc_irq({I2C1_ER},                      48)                 dnl I2C1 Error Interrupt
def_exc_irq({I2C2_EV},                      49)                 dnl I2C2 Event Interrupt
def_exc_irq({I2C2_ER},                      50)                 dnl I2C2 Error Interrupt
def_exc_irq({SPI1},                         51)                 dnl SPI1 global Interrupt
def_exc_irq({SPI2},                         52)                 dnl SPI2 global Interrupt
def_exc_irq({USART1},                       53)                 dnl USART1 global Interrupt
def_exc_irq({USART2},                       54)                 dnl USART2 global Interrupt
def_exc_irq({USART3},                       55)                 dnl USART3 global Interrupt
def_exc_irq({EXTI15_10},                    56)                 dnl External Line[15:10] Interrupts
def_exc_irq({RTCAlarm},                     57)                 dnl RTC Alarm through EXTI Line Interrupt
def_exc_irq({TIM5},                         66)                 dnl TIM5 global Interrupt
def_exc_irq({SPI3},                         67)                 dnl SPI3 global Interrupt
def_exc_irq({UART4},                        68)                 dnl UART4 global Interrupt
def_exc_irq({UART5},                        69)                 dnl UART5 global Interrupt
def_exc_irq({TIM7},                         71)                 dnl TIM7 global Interrupt
def_exc_irq({DMA2_Channel1},                72)                 dnl DMA2 Channel 1 global Interrupt
def_exc_irq({DMA2_Channel2},                73)                 dnl DMA2 Channel 2 global Interrupt
def_exc_irq({DMA2_Channel3},                74)                 dnl DMA2 Channel 3 global Interrupt

ifdef({STM32F10X_BASE},{
def_exc_irq({ADC1_2},                       34)                 dnl ADC1 and ADC2 global Interrupt
def_exc_irq({USB_HP_CAN1_TX},               35)                 dnl USB Device High Priority or CAN1 TX Interrupts
def_exc_irq({USB_LP_CAN1_RX0},              36)                 dnl USB Device Low Priority or CAN1 RX0 Interrupts
def_exc_irq({TIM1_BRK},                     40)                 dnl TIM1 Break Interrupt
def_exc_irq({TIM1_UP},                      41)                 dnl TIM1 Update Interrupt
def_exc_irq({TIM1_TRG_COM},                 42)                 dnl TIM1 Trigger and Commutation Interrupt
def_exc_irq({USBWakeUp},                    58)                 dnl USB Device WakeUp from suspend through EXTI Line Interrupt
def_exc_irq({TIM8_BRK},                     59)                 dnl TIM8 Break Interrupt
def_exc_irq({TIM8_UP},                      60)                 dnl TIM8 Update Interrupt
def_exc_irq({TIM8_TRG_COM},                 61)                 dnl TIM8 Trigger and Commutation Interrupt
def_exc_irq({TIM8_CC},                      62)                 dnl TIM8 Capture Compare Interrupt
def_exc_irq({ADC3},                         63)                 dnl ADC3 global Interrupt
def_exc_irq({FSMC},                         64)                 dnl FSMC global Interrupt
def_exc_irq({SDIO},                         65)                 dnl SDIO global Interrupt
def_exc_irq({TIM6},                         70)                 dnl TIM6 global Interrupt
def_exc_irq({DMA2_Channel4_5},              75)                 dnl DMA2 Channel 4 and Channel 5 global Interrupt
}) dnl endif STM32F10X_BASE

ifdef({STM32F10X_CL},{
def_exc_irq({ADC1_2},                       34)                 dnl ADC1 and ADC2 global Interrupt
def_exc_irq({CAN1_TX},                      35)                 dnl USB Device High Priority or CAN1 TX Interrupts
def_exc_irq({CAN1_RX0},                     36)                 dnl USB Device Low Priority or CAN1 RX0 Interrupts
def_exc_irq({TIM1_BRK},                     40)                 dnl TIM1 Break Interrupt
def_exc_irq({TIM1_UP},                      41)                 dnl TIM1 Update Interrupt
def_exc_irq({TIM1_TRG_COM},                 42)                 dnl TIM1 Trigger and Commutation Interrupt
def_exc_irq({OTG_FS_WKUP},                  58)                 dnl USB OTG FS WakeUp from suspend through EXTI Line Interrupt
def_exc_irq({TIM6},                         70)                 dnl TIM6 global Interrupt
def_exc_irq({DMA2_Channel4},                75)                 dnl DMA2 Channel 4 global Interrupt
def_exc_irq({DMA2_Channel5},                76)                 dnl DMA2 Channel 5 global Interrupt
def_exc_irq({ETH},                          77)                 dnl Ethernet global Interrupt
def_exc_irq({ETH_WKUP},                     78)                 dnl Ethernet Wakeup through EXTI line Interrupt
def_exc_irq({CAN2_TX},                      79)                 dnl CAN2 TX Interrupt
def_exc_irq({CAN2_RX0},                     80)                 dnl CAN2 RX0 Interrupt
def_exc_irq({CAN2_RX1},                     81)                 dnl CAN2 RX1 Interrupt
def_exc_irq({CAN2_SCE},                     82)                 dnl CAN2 SCE Interrupt
def_exc_irq({OTG_FS},                       83)                 dnl USB OTG FS global Interrupt
}) dnl endif STM32F10X_CL

ifdef({STM32F10X_VL},{
def_exc_irq({ADC1},                         34)                 dnl ADC1 global Interrupt
def_exc_irq({TIM1_BRK_TIM15},               40)                 dnl TIM1 Break and TIM15 Interrupts
def_exc_irq({TIM1_UP_TIM16},                41)                 dnl TIM1 Update and TIM16 Interrupts
def_exc_irq({TIM1_TRG_COM_TIM17},           42)                 dnl TIM1 Trigger and Commutation and TIM17 Interrupt
def_exc_irq({CEC},                          58)                 dnl HDMI-CEC Interrupt
def_exc_irq({TIM12},                        59)                 dnl TIM12 global Interrupt
def_exc_irq({TIM13},                        60)                 dnl TIM13 global Interrupt
def_exc_irq({TIM14},                        61)                 dnl TIM14 global Interrupt
def_exc_irq({TIM6_DAC},                     70)                 dnl TIM6 and DAC underrun Interrupt
def_exc_irq({DMA2_Channel4_5},              75)                 dnl DMA2 Channel 4 and Channel 5 global Interrupt
def_exc_irq({DMA2_Channel5},                76)                 dnl DMA2 Channel 5 global Interrupt (only if the MISC_REMAP bit in the AFIO_MAPR2 register is set)
}) dnl endif STM32F10X_VL

dnl Analog to Digital Converter
defsym({ADC_SR},                            0 * 4)
defsym({ADC_CR1},                           1 * 4)
defsym({ADC_CR2},                           2 * 4)
defsym({ADC_SMPR1},                         3 * 4)
defsym({ADC_SMPR2},                         4 * 4)
defsym({ADC_JOFR1},                         5 * 4)
defsym({ADC_JOFR2},                         6 * 4)
defsym({ADC_JOFR3},                         7 * 4)
defsym({ADC_JOFR4},                         8 * 4)
defsym({ADC_HTR},                           9 * 4)
defsym({ADC_LTR},                           10 * 4)
defsym({ADC_SQR1},                          11 * 4)
defsym({ADC_SQR2},                          12 * 4)
defsym({ADC_SQR3},                          13 * 4)
defsym({ADC_JSQR},                          14 * 4)
defsym({ADC_JDR1},                          15 * 4)
defsym({ADC_JDR2},                          16 * 4)
defsym({ADC_JDR3},                          17 * 4)
defsym({ADC_JDR4},                          18 * 4)
defsym({ADC_DR},                            19 * 4)

dnl Backup Registers
defsym({BKP_DR1},                           1 * 4)
defsym({BKP_DR2},                           2 * 4)
defsym({BKP_DR3},                           3 * 4)
defsym({BKP_DR4},                           4 * 4)
defsym({BKP_DR5},                           5 * 4)
defsym({BKP_DR6},                           6 * 4)
defsym({BKP_DR7},                           7 * 4)
defsym({BKP_DR8},                           8 * 4)
defsym({BKP_DR9},                           9 * 4)
defsym({BKP_DR10},                          10 * 4)
defsym({BKP_RTCCR},                         11 * 4)
defsym({BKP_CR},                            12 * 4)
defsym({BKP_CSR},                           13 * 4)
defsym({BKP_DR11},                          16 * 4)
defsym({BKP_DR12},                          17 * 4)
defsym({BKP_DR13},                          18 * 4)
defsym({BKP_DR14},                          19 * 4)
defsym({BKP_DR15},                          20 * 4)
defsym({BKP_DR16},                          21 * 4)
defsym({BKP_DR17},                          22 * 4)
defsym({BKP_DR18},                          23 * 4)
defsym({BKP_DR19},                          24 * 4)
defsym({BKP_DR20},                          25 * 4)
defsym({BKP_DR21},                          26 * 4)
defsym({BKP_DR22},                          27 * 4)
defsym({BKP_DR23},                          28 * 4)
defsym({BKP_DR24},                          29 * 4)
defsym({BKP_DR25},                          30 * 4)
defsym({BKP_DR26},                          31 * 4)
defsym({BKP_DR27},                          32 * 4)
defsym({BKP_DR28},                          33 * 4)
defsym({BKP_DR29},                          34 * 4)
defsym({BKP_DR30},                          35 * 4)
defsym({BKP_DR31},                          36 * 4)
defsym({BKP_DR32},                          37 * 4)
defsym({BKP_DR33},                          38 * 4)
defsym({BKP_DR34},                          39 * 4)
defsym({BKP_DR35},                          40 * 4)
defsym({BKP_DR36},                          41 * 4)
defsym({BKP_DR37},                          42 * 4)
defsym({BKP_DR38},                          43 * 4)
defsym({BKP_DR39},                          44 * 4)
defsym({BKP_DR40},                          45 * 4)
defsym({BKP_DR41},                          46 * 4)
defsym({BKP_DR42},                          47 * 4)

dnl USB Peripheral
defsym({USB_EP0R},                          0 * 4)
defsym({USB_EP1R},                          1 * 4)
defsym({USB_EP2R},                          2 * 4)
defsym({USB_EP3R},                          3 * 4)
defsym({USB_EP4R},                          4 * 4)
defsym({USB_EP5R},                          5 * 4)
defsym({USB_EP6R},                          6 * 4)
defsym({USB_EP7R},                          7 * 4)
defsym({USB_CNTR},                          16 * 4)   dnl Control Register
defsym({USB_ISTR},                          17 * 4)   dnl Interrupt Status Register
defsym({USB_FNR},                           18 * 4)   dnl Frame Number Register
defsym({USB_DADDR},                         19 * 4)   dnl Device Address Register
defsym({USB_BTABLE},                        20 * 4)   dnl Buffer Table Address Register

dnl Controller Area Network TxMailBox and FIFOMailBox
defsym({CAN_MailBox_IR},                    0 * 4)
defsym({CAN_MailBox_DTR},                   1 * 4)
defsym({CAN_MailBox_DLR},                   2 * 4)
defsym({CAN_MailBox_DHR},                   3 * 4)

dnl Controller Area Network FilterRegister
defsym({CAN_FilterRegister_FR1},            0 * 4)
defsym({CAN_FilterRegister_FR2},            1 * 4)

dnl Controller Area Network
defsym({CAN_MCR},                           0 * 4)
defsym({CAN_MSR},                           1 * 4)
defsym({CAN_TSR},                           2 * 4)
defsym({CAN_RF0R},                          3 * 4)
defsym({CAN_RF1R},                          4 * 4)
defsym({CAN_IER},                           5 * 4)
defsym({CAN_ESR},                           6 * 4)
defsym({CAN_BTR},                           7 * 4)
defsym({CAN_TxMailBox_0},                   96 * 4)
defsym({CAN_TxMailBox_1},                   100 * 4)
defsym({CAN_TxMailBox_2},                   104 * 4)
defsym({CAN_FIFOMailBox_0},                 108 * 4)
defsym({CAN_FIFOMailBox_1},                 112 * 4)
defsym({CAN_FMR},                           124 * 4)
defsym({CAN_FM1R},                          125 * 4)
defsym({CAN_FS1R},                          127 * 4)
defsym({CAN_FFA1R},                         129 * 4)
defsym({CAN_FA1R},                          132 * 4)
defsym({CAN_FilterRegisters},               140 * 4)

dnl Consumer Electronics Control (CEC * 4)
defsym({CEC_CFGR},                          0 * 4)
defsym({CEC_OAR},                           1 * 4)
defsym({CEC_PRES},                          2 * 4)
defsym({CEC_ESR},                           3 * 4)
defsym({CEC_CSR},                           4 * 4)
defsym({CEC_TXD},                           5 * 4)
defsym({CEC_RXD},                           6 * 4)

dnl CRC calculation unit
defsym({CRC_DR},                            0 * 4)
defsym({CRC_IDR},                           1 * 4)
defsym({CRC_CR},                            2 * 4)

dnl Digital to Analog Converter
defsym({DAC_CR},                            0 * 4)
defsym({DAC_SWTRIGR},                       1 * 4)
defsym({DAC_DHR12R1},                       2 * 4)
defsym({DAC_DHR12L1},                       3 * 4)
defsym({DAC_DHR8R1},                        4 * 4)
defsym({DAC_DHR12R2},                       5 * 4)
defsym({DAC_DHR12L2},                       6 * 4)
defsym({DAC_DHR8R2},                        7 * 4)
defsym({DAC_DHR12RD},                       8 * 4)
defsym({DAC_DHR12LD},                       9 * 4)
defsym({DAC_DHR8RD},                        10 * 4)
defsym({DAC_DOR1},                          11 * 4)
defsym({DAC_DOR2},                          12 * 4)
defsym({DAC_SR},                            13 * 4)

dnl Debug MCU
defsym({DBGMCU_IDCODE},                     0 * 4)
defsym({DBGMCU_CR},                         1 * 4)

dnl DMA Controller
defsym({DMA_Channel_CCR},                   0 * 4)
defsym({DMA_Channel_CNDTR},                 1 * 4)
defsym({DMA_Channel_CPAR},                  2 * 4)
defsym({DMA_Channel_CMAR},                  3 * 4)

defsym({DMA_ISR},                           0 * 4)
defsym({DMA_IFCR},                          1 * 4)
defsym({DMA_CHANNEL1},                      8 + 0 * 0x14)
defsym({DMA_CHANNEL2},                      8 + 1 * 0x14)
defsym({DMA_CHANNEL3},                      8 + 2 * 0x14)
defsym({DMA_CHANNEL4},                      8 + 3 * 0x14)
defsym({DMA_CHANNEL5},                      8 + 4 * 0x14)
defsym({DMA_CHANNEL6},                      8 + 5 * 0x14)
defsym({DMA_CHANNEL7},                      8 + 6 * 0x14)

dnl Ethernet MAC
defsym({ETH_MACCR},                         0 * 4)
defsym({ETH_MACFFR},                        1 * 4)
defsym({ETH_MACHTHR},                       2 * 4)
defsym({ETH_MACHTLR},                       3 * 4)
defsym({ETH_MACMIIAR},                      4 * 4)
defsym({ETH_MACMIIDR},                      5 * 4)
defsym({ETH_MACFCR},                        6 * 4)
defsym({ETH_MACVLANTR},                     7 * 4)
defsym({ETH_MACRWUFFR},                     10 * 4)
defsym({ETH_MACPMTCSR},                     11 * 4)
defsym({ETH_MACSR},                         14 * 4)
defsym({ETH_MACIMR},                        15 * 4)
defsym({ETH_MACA0HR},                       16 * 4)
defsym({ETH_MACA0LR},                       17 * 4)
defsym({ETH_MACA1HR},                       18 * 4)
defsym({ETH_MACA1LR},                       19 * 4)
defsym({ETH_MACA2HR},                       20 * 4)
defsym({ETH_MACA2LR},                       21 * 4)
defsym({ETH_MACA3HR},                       22 * 4)
defsym({ETH_MACA3LR},                       23 * 4)
defsym({ETH_MMCCR},                         64 * 4)
defsym({ETH_MMCRIR},                        65 * 4)
defsym({ETH_MMCTIR},                        66 * 4)
defsym({ETH_MMCRIMR},                       67 * 4)
defsym({ETH_MMCTIMR},                       68 * 4)
defsym({ETH_MMCTGFSCCR},                    83 * 4)
defsym({ETH_MMCTGFMSCCR},                   84 * 4)
defsym({ETH_MMCTGFCR},                      90 * 4)
defsym({ETH_MMCRFCECR},                     101 * 4)
defsym({ETH_MMCRFAECR},                     102 * 4)
defsym({ETH_MMCRGUFCR},                     113 * 4)
defsym({ETH_PTPTSCR},                       448 * 4)
defsym({ETH_PTPSSIR},                       449 * 4)
defsym({ETH_PTPTSHR},                       450 * 4)
defsym({ETH_PTPTSLR},                       451 * 4)
defsym({ETH_PTPTSHUR},                      452 * 4)
defsym({ETH_PTPTSLUR},                      453 * 4)
defsym({ETH_PTPTSAR},                       454 * 4)
defsym({ETH_PTPTTHR},                       455 * 4)
defsym({ETH_PTPTTLR},                       456 * 4)
defsym({ETH_DMABMR},                        1024 * 4)
defsym({ETH_DMATPDR},                       1025 * 4)
defsym({ETH_DMARPDR},                       1026 * 4)
defsym({ETH_DMARDLAR},                      1027 * 4)
defsym({ETH_DMATDLAR},                      1028 * 4)
defsym({ETH_DMASR},                         1029 * 4)
defsym({ETH_DMAOMR},                        1030 * 4)
defsym({ETH_DMAIER},                        1031 * 4)
defsym({ETH_DMAMFBOCR},                     1032 * 4)
defsym({ETH_DMACHTDR},                      1042 * 4)
defsym({ETH_DMACHRDR},                      1043 * 4)
defsym({ETH_DMACHTBAR},                     1044 * 4)
defsym({ETH_DMACHRBAR},                     1045 * 4)

dnl External Interrupt/Event Controller
defsym({EXTI_IMR},                          0 * 4)
defsym({EXTI_EMR},                          1 * 4)
defsym({EXTI_RTSR},                         2 * 4)
defsym({EXTI_FTSR},                         3 * 4)
defsym({EXTI_SWIER},                        4 * 4)
defsym({EXTI_PR},                           5 * 4)

dnl FLASH Registers
defsym({FLASH_ACR},                         0 * 4)
defsym({FLASH_KEYR},                        1 * 4)
defsym({FLASH_OPTKEYR},                     2 * 4)
defsym({FLASH_SR},                          3 * 4)
defsym({FLASH_CR},                          4 * 4)
defsym({FLASH_AR},                          5 * 4)
defsym({FLASH_OBR},                         7 * 4)
defsym({FLASH_WRPR},                        8 * 4)
defsym({FLASH_KEYR2},                       17 * 4)
defsym({FLASH_SR2},                         19 * 4)
defsym({FLASH_CR2},                         20 * 4)
defsym({FLASH_AR2},                         21 * 4)

dnl Option Bytes Registers
defsym({OB_RDP_USER},                       0 * 4)
defsym({OB_Data},                           1 * 4)
defsym({OB_WRP0},                           2 * 4)
defsym({OB_WRP1},                           3 * 4)

dnl Flexible Static Memory Controller BankN
defsym({FSMC_Bank_PCR},                     0 * 4)
defsym({FSMC_Bank_SR},                      1 * 4)
defsym({FSMC_Bank_PMEM},                    2 * 4)
defsym({FSMC_Bank_PATT},                    3 * 4)
defsym({FSMC_Bank_PIO},                     4 * 4)
defsym({FSMC_Bank_ECCR},                    5 * 4)

dnl General Purpose I/O
defsym({GPIO_CRL},                          0 * 4)
defsym({GPIO_CRH},                          1 * 4)
defsym({GPIO_IDR},                          2 * 4)
defsym({GPIO_ODR},                          3 * 4)
defsym({GPIO_BSRR},                         4 * 4)
defsym({GPIO_BRR},                          5 * 4)
defsym({GPIO_LCKR},                         6 * 4)

dnl Alternate Function I/O
defsym({AFIO_EVCR},                         0 * 4)
defsym({AFIO_MAPR},                         1 * 4)
defsym({AFIO_EXTICR_0},                     2 * 4)
defsym({AFIO_EXTICR_1},                     3 * 4)
defsym({AFIO_EXTICR_2},                     4 * 4)
defsym({AFIO_EXTICR_3},                     5 * 4)
defsym({AFIO_MAPR2},                        7 * 4)

dnl Inter Integrated Circuit Interface
defsym({I2C_CR1},                           0 * 4)
defsym({I2C_CR2},                           1 * 4)
defsym({I2C_OAR1},                          2 * 4)
defsym({I2C_OAR2},                          3 * 4)
defsym({I2C_DR},                            4 * 4)
defsym({I2C_SR1},                           5 * 4)
defsym({I2C_SR2},                           6 * 4)
defsym({I2C_CCR},                           7 * 4)
defsym({I2C_TRISE},                         8 * 4)

dnl Independent WATCHDOG
defsym({IWDG_KR},                           0 * 4)
defsym({IWDG_PR},                           1 * 4)
defsym({IWDG_RLR},                          2 * 4)
defsym({IWDG_SR},                           3 * 4)

dnl Power Control
defsym({PWR_CR},                            0 * 4)
defsym({PWR_CSR},                           1 * 4)

dnl Reset and Clock Control
defsym({RCC_CR},                            0 * 4)
defsym({RCC_CFGR},                          1 * 4)
defsym({RCC_CIR},                           2 * 4)
defsym({RCC_APB2RSTR},                      3 * 4)
defsym({RCC_APB1RSTR},                      4 * 4)
defsym({RCC_AHBENR},                        5 * 4)
defsym({RCC_APB2ENR},                       6 * 4)
defsym({RCC_APB1ENR},                       7 * 4)
defsym({RCC_BDCR},                          8 * 4)
defsym({RCC_CSR},                           9 * 4)
defsym({RCC_AHBRSTR},                       10 * 4)
defsym({RCC_CFGR2},                         11 * 4)

dnl Real-Time Clock
defsym({RTC_CRH},                           0 * 4)
defsym({RTC_CRL},                           1 * 4)
defsym({RTC_PRLH},                          2 * 4)
defsym({RTC_PRLL},                          3 * 4)
defsym({RTC_DIVH},                          4 * 4)
defsym({RTC_DIVL},                          5 * 4)
defsym({RTC_CNTH},                          6 * 4)
defsym({RTC_CNTL},                          7 * 4)
defsym({RTC_ALRH},                          8 * 4)
defsym({RTC_ALRL},                          9 * 4)

dnl SD host Interface
defsym({SDIO_POWER},                        0 * 4)
defsym({SDIO_CLKCR},                        1 * 4)
defsym({SDIO_ARG},                          2 * 4)
defsym({SDIO_CMD},                          3 * 4)
defsym({SDIO_RESPCMD},                      4 * 4)
defsym({SDIO_RESP1},                        5 * 4)
defsym({SDIO_RESP2},                        6 * 4)
defsym({SDIO_RESP3},                        7 * 4)
defsym({SDIO_RESP4},                        8 * 4)
defsym({SDIO_DTIMER},                       9 * 4)
defsym({SDIO_DLEN},                         10 * 4)
defsym({SDIO_DCTRL},                        11 * 4)
defsym({SDIO_DCOUNT},                       12 * 4)
defsym({SDIO_STA},                          13 * 4)
defsym({SDIO_ICR},                          14 * 4)
defsym({SDIO_MASK},                         15 * 4)
defsym({SDIO_FIFOCNT},                      18 * 4)
defsym({SDIO_FIFO},                         32 * 4)

dnl Serial Peripheral Interface
defsym({SPI_CR1},                           0 * 4)
defsym({SPI_CR2},                           1 * 4)
defsym({SPI_SR},                            2 * 4)
defsym({SPI_DR},                            3 * 4)
defsym({SPI_CRCPR},                         4 * 4)
defsym({SPI_RXCRCR},                        5 * 4)
defsym({SPI_TXCRCR},                        6 * 4)
defsym({SPI_I2SCFGR},                       7 * 4)
defsym({SPI_I2SPR},                         8 * 4)

dnl TIM
defsym({TIM_CR1},                           0 * 4)
defsym({TIM_CR2},                           1 * 4)
defsym({TIM_SMCR},                          2 * 4)
defsym({TIM_DIER},                          3 * 4)
defsym({TIM_SR},                            4 * 4)
defsym({TIM_EGR},                           5 * 4)
defsym({TIM_CCMR1},                         6 * 4)
defsym({TIM_CCMR2},                         7 * 4)
defsym({TIM_CCER},                          8 * 4)
defsym({TIM_CNT},                           9 * 4)
defsym({TIM_PSC},                           10 * 4)
defsym({TIM_ARR},                           11 * 4)
defsym({TIM_RCR},                           12 * 4)
defsym({TIM_CCR1},                          13 * 4)
defsym({TIM_CCR2},                          14 * 4)
defsym({TIM_CCR3},                          15 * 4)
defsym({TIM_CCR4},                          16 * 4)
defsym({TIM_BDTR},                          17 * 4)
defsym({TIM_DCR},                           18 * 4)
defsym({TIM_DMAR},                          19 * 4)

dnl Universal Synchronous Asynchronous Receiver Transmitter
defsym({USART_SR},                          0 * 4)
defsym({USART_DR},                          1 * 4)
defsym({USART_BRR},                         2 * 4)
defsym({USART_CR1},                         3 * 4)
defsym({USART_CR2},                         4 * 4)
defsym({USART_CR3},                         5 * 4)
defsym({USART_GTPR},                        6 * 4)

dnl Window WATCHDOG
defsym({WWDG_CR},                           0 * 4)
defsym({WWDG_CFR},                          1 * 4)
defsym({WWDG_SR},                           2 * 4)


defsym({FLASH_BASE},                        0x08000000)         dnl FLASH base address in the alias region
defsym({OB_BASE},                           0x1FFFF800)         dnl Flash Option Bytes base address
defsym({SRAM_BASE},                         0x20000000)         dnl SRAM base address in the alias region
defsym({PERIPH_BASE},                       0x40000000)         dnl Peripheral base address in the alias region
defsym({SRAM_BB_BASE},                      0x22000000)         dnl SRAM base address in the bit-band region
defsym({PERIPH_BB_BASE},                    0x42000000)         dnl Peripheral base address in the bit-band region
defsym({FSMC_BASE},                         0xA0000000)         dnl FSMC registers base address
defsym({DBGMCU_BASE},                       0xE0042000)         dnl Debug MCU registers base address

dnl Peripheral memory map
defsym({APB1PERIPH_BASE},                   heval(PERIPH_BASE))
defsym({APB2PERIPH_BASE},                   heval(PERIPH_BASE + 0x10000))
defsym({AHBPERIPH_BASE},                    heval(PERIPH_BASE + 0x20000))

defsym({USB_BASE},                          heval(PERIPH_BASE + 0x5C00))        dnl USB Registers Base Address
defsym({USB_PMA_BASE},                      heval(PERIPH_BASE + 0x6000))        dnl USB Packet Memory Area Address

defsym({TIM2_BASE},                         heval(APB1PERIPH_BASE + 0x0000))
defsym({TIM3_BASE},                         heval(APB1PERIPH_BASE + 0x0400))
defsym({TIM4_BASE},                         heval(APB1PERIPH_BASE + 0x0800))
defsym({TIM5_BASE},                         heval(APB1PERIPH_BASE + 0x0C00))
defsym({TIM6_BASE},                         heval(APB1PERIPH_BASE + 0x1000))
defsym({TIM7_BASE},                         heval(APB1PERIPH_BASE + 0x1400))
defsym({TIM12_BASE},                        heval(APB1PERIPH_BASE + 0x1800))
defsym({TIM13_BASE},                        heval(APB1PERIPH_BASE + 0x1C00))
defsym({TIM14_BASE},                        heval(APB1PERIPH_BASE + 0x2000))
defsym({RTC_BASE},                          heval(APB1PERIPH_BASE + 0x2800))
defsym({WWDG_BASE},                         heval(APB1PERIPH_BASE + 0x2C00))
defsym({IWDG_BASE},                         heval(APB1PERIPH_BASE + 0x3000))
defsym({SPI2_BASE},                         heval(APB1PERIPH_BASE + 0x3800))
defsym({SPI3_BASE},                         heval(APB1PERIPH_BASE + 0x3C00))
defsym({USART2_BASE},                       heval(APB1PERIPH_BASE + 0x4400))
defsym({USART3_BASE},                       heval(APB1PERIPH_BASE + 0x4800))
defsym({UART4_BASE},                        heval(APB1PERIPH_BASE + 0x4C00))
defsym({UART5_BASE},                        heval(APB1PERIPH_BASE + 0x5000))
defsym({I2C1_BASE},                         heval(APB1PERIPH_BASE + 0x5400))
defsym({I2C2_BASE},                         heval(APB1PERIPH_BASE + 0x5800))
defsym({CAN1_BASE},                         heval(APB1PERIPH_BASE + 0x6400))
defsym({CAN2_BASE},                         heval(APB1PERIPH_BASE + 0x6800))
defsym({BKP_BASE},                          heval(APB1PERIPH_BASE + 0x6C00))
defsym({PWR_BASE},                          heval(APB1PERIPH_BASE + 0x7000))
defsym({DAC_BASE},                          heval(APB1PERIPH_BASE + 0x7400))
defsym({CEC_BASE},                          heval(APB1PERIPH_BASE + 0x7800))

defsym({AFIO_BASE},                         heval(APB2PERIPH_BASE + 0x0000))
defsym({EXTI_BASE},                         heval(APB2PERIPH_BASE + 0x0400))
defsym({GPIOA_BASE},                        heval(APB2PERIPH_BASE + 0x0800))
defsym({GPIOB_BASE},                        heval(APB2PERIPH_BASE + 0x0C00))
defsym({GPIOC_BASE},                        heval(APB2PERIPH_BASE + 0x1000))
defsym({GPIOD_BASE},                        heval(APB2PERIPH_BASE + 0x1400))
defsym({GPIOE_BASE},                        heval(APB2PERIPH_BASE + 0x1800))
defsym({GPIOF_BASE},                        heval(APB2PERIPH_BASE + 0x1C00))
defsym({GPIOG_BASE},                        heval(APB2PERIPH_BASE + 0x2000))
defsym({ADC1_BASE},                         heval(APB2PERIPH_BASE + 0x2400))
defsym({ADC2_BASE},                         heval(APB2PERIPH_BASE + 0x2800))
defsym({TIM1_BASE},                         heval(APB2PERIPH_BASE + 0x2C00))
defsym({SPI1_BASE},                         heval(APB2PERIPH_BASE + 0x3000))
defsym({TIM8_BASE},                         heval(APB2PERIPH_BASE + 0x3400))
defsym({USART1_BASE},                       heval(APB2PERIPH_BASE + 0x3800))
defsym({ADC3_BASE},                         heval(APB2PERIPH_BASE + 0x3C00))
defsym({TIM15_BASE},                        heval(APB2PERIPH_BASE + 0x4000))
defsym({TIM16_BASE},                        heval(APB2PERIPH_BASE + 0x4400))
defsym({TIM17_BASE},                        heval(APB2PERIPH_BASE + 0x4800))
defsym({TIM9_BASE},                         heval(APB2PERIPH_BASE + 0x4C00))
defsym({TIM10_BASE},                        heval(APB2PERIPH_BASE + 0x5000))
defsym({TIM11_BASE},                        heval(APB2PERIPH_BASE + 0x5400))

defsym({SDIO_BASE},                         heval(PERIPH_BASE + 0x18000))

defsym({DMA1_BASE},                         heval(AHBPERIPH_BASE + 0x0000))
defsym({DMA1_Channel1_BASE},                heval(AHBPERIPH_BASE + 0x0008))
defsym({DMA1_Channel2_BASE},                heval(AHBPERIPH_BASE + 0x001C))
defsym({DMA1_Channel3_BASE},                heval(AHBPERIPH_BASE + 0x0030))
defsym({DMA1_Channel4_BASE},                heval(AHBPERIPH_BASE + 0x0044))
defsym({DMA1_Channel5_BASE},                heval(AHBPERIPH_BASE + 0x0058))
defsym({DMA1_Channel6_BASE},                heval(AHBPERIPH_BASE + 0x006C))
defsym({DMA1_Channel7_BASE},                heval(AHBPERIPH_BASE + 0x0080))

defsym({DMA2_BASE},                         heval(AHBPERIPH_BASE + 0x0400))
defsym({DMA2_Channel1_BASE},                heval(AHBPERIPH_BASE + 0x0408))
defsym({DMA2_Channel2_BASE},                heval(AHBPERIPH_BASE + 0x041C))
defsym({DMA2_Channel3_BASE},                heval(AHBPERIPH_BASE + 0x0430))
defsym({DMA2_Channel4_BASE},                heval(AHBPERIPH_BASE + 0x0444))
defsym({DMA2_Channel5_BASE},                heval(AHBPERIPH_BASE + 0x0458))

defsym({RCC_BASE},                          heval(AHBPERIPH_BASE + 0x1000))
defsym({FLASH_REG_BASE},                    heval(AHBPERIPH_BASE + 0x2000))     dnl Flash registers base address
defsym({CRC_BASE},                          heval(AHBPERIPH_BASE + 0x3000))

defsym({ETH_BASE},                          heval(AHBPERIPH_BASE + 0x8000))
defsym({ETH_MAC_BASE},                      heval(ETH_BASE))
defsym({ETH_MMC_BASE},                      heval(ETH_BASE + 0x0100))
defsym({ETH_PTP_BASE},                      heval(ETH_BASE + 0x0700))
defsym({ETH_DMA_BASE},                      heval(ETH_BASE + 0x1000))

defsym({FSMC_Bank1_BASE},                   heval(FSMC_BASE + 0x0000))          dnl FSMC Bank1 registers base address
defsym({FSMC_Bank1E_BASE},                  heval(FSMC_BASE + 0x0104))          dnl FSMC Bank1E registers base address
defsym({FSMC_Bank2_BASE},                   heval(FSMC_BASE + 0x0060))          dnl FSMC Bank2 registers base address
defsym({FSMC_Bank3_BASE},                   heval(FSMC_BASE + 0x0080))          dnl FSMC Bank3 registers base address
defsym({FSMC_Bank4_BASE},                   heval(FSMC_BASE + 0x00A0))          dnl FSMC Bank4 registers base address

dnl FIXME: define macro for:
dnl REG(TIM, 2, CNT) -> heval(TIM2_BASE + TIM_CNT)

dnl ******************************************************************************
dnl                         Peripheral Registers_Bits_Definition
dnl ******************************************************************************

dnl ******************************************************************************
dnl
dnl                          CRC calculation unit
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for CRC_DR register  *********************
defmask({CRC_DR_DR},                        0, 32)              dnl Data register bits


dnl *******************  Bit definition for CRC_IDR register  ********************
defmask({CRC_IDR_IDR},                      0, 8)               dnl General-purpose 8-bit data register bits


dnl ********************  Bit definition for CRC_CR register  ********************
defsym({CRC_CR_RESET},                      0x01)               dnl RESET bit

dnl ******************************************************************************
dnl
dnl                             Power Control
dnl
dnl ******************************************************************************

dnl ********************  Bit definition for PWR_CR register  ********************
defsym({PWR_CR_LPDS},                       0x0001)             dnl Low-Power Deepsleep
defsym({PWR_CR_PDDS},                       0x0002)             dnl Power Down Deepsleep
defsym({PWR_CR_CWUF},                       0x0004)             dnl Clear Wakeup Flag
defsym({PWR_CR_CSBF},                       0x0008)             dnl Clear Standby Flag
defsym({PWR_CR_PVDE},                       0x0010)             dnl Power Voltage Detector Enable

defmask({PWR_CR_PLS},                       5, 3)               dnl PLS[2:0] bits (PVD Level Selection)
defsym({PWR_CR_PLS_2V2},                    0x0000)             dnl PVD level 2.2V
defsym({PWR_CR_PLS_2V3},                    0x0020)             dnl PVD level 2.3V
defsym({PWR_CR_PLS_2V4},                    0x0040)             dnl PVD level 2.4V
defsym({PWR_CR_PLS_2V5},                    0x0060)             dnl PVD level 2.5V
defsym({PWR_CR_PLS_2V6},                    0x0080)             dnl PVD level 2.6V
defsym({PWR_CR_PLS_2V7},                    0x00A0)             dnl PVD level 2.7V
defsym({PWR_CR_PLS_2V8},                    0x00C0)             dnl PVD level 2.8V
defsym({PWR_CR_PLS_2V9},                    0x00E0)             dnl PVD level 2.9V

defsym({PWR_CR_DBP},                        0x0100)             dnl Disable Backup Domain write protection


dnl *******************  Bit definition for PWR_CSR register  ********************
defsym({PWR_CSR_WUF},                       0x0001)             dnl Wakeup Flag
defsym({PWR_CSR_SBF},                       0x0002)             dnl Standby Flag
defsym({PWR_CSR_PVDO},                      0x0004)             dnl PVD Output
defsym({PWR_CSR_EWUP},                      0x0100)             dnl Enable WKUP pin

dnl ******************************************************************************
dnl
dnl                            Backup registers
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for BKP_DRn register  ********************
defmask({BKP_DR_D},                         0, 16)              dnl Backup data

dnl ******************  Bit definition for BKP_RTCCR register  *******************
defmask({BKP_RTCCR_CAL},                    0, 7)               dnl Calibration value
defsym({BKP_RTCCR_CCO},                     0x0080)             dnl Calibration Clock Output
defsym({BKP_RTCCR_ASOE},                    0x0100)             dnl Alarm or Second Output Enable
defsym({BKP_RTCCR_ASOS},                    0x0200)             dnl Alarm or Second Output Selection

dnl ********************  Bit definition for BKP_CR register  ********************
defsym({BKP_CR_TPE},                        0x01)               dnl TAMPER pin enable
defsym({BKP_CR_TPAL},                       0x02)               dnl TAMPER pin active level

dnl *******************  Bit definition for BKP_CSR register  ********************
defsym({BKP_CSR_CTE},                       0x0001)             dnl Clear Tamper event
defsym({BKP_CSR_CTI},                       0x0002)             dnl Clear Tamper Interrupt
defsym({BKP_CSR_TPIE},                      0x0004)             dnl TAMPER Pin interrupt enable
defsym({BKP_CSR_TEF},                       0x0100)             dnl Tamper Event Flag
defsym({BKP_CSR_TIF},                       0x0200)             dnl Tamper Interrupt Flag

dnl ******************************************************************************
dnl
dnl                         Reset and Clock Control
dnl
dnl ******************************************************************************

dnl ********************  Bit definition for RCC_CR register  ********************
defsym({RCC_CR_HSION},                      0x00000001)         dnl Internal High Speed clock enable
defsym({RCC_CR_HSIRDY},                     0x00000002)         dnl Internal High Speed clock ready flag
defmask({RCC_CR_HSITRIM},                   3, 5)               dnl Internal High Speed clock trimming
defmask({RCC_CR_HSICAL},                    8, 8)               dnl Internal High Speed clock Calibration
defsym({RCC_CR_HSEON},                      0x00010000)         dnl External High Speed clock enable
defsym({RCC_CR_HSERDY},                     0x00020000)         dnl External High Speed clock ready flag
defsym({RCC_CR_HSEBYP},                     0x00040000)         dnl External High Speed clock Bypass
defsym({RCC_CR_CSSON},                      0x00080000)         dnl Clock Security System enable
defsym({RCC_CR_PLLON},                      0x01000000)         dnl PLL enable
defsym({RCC_CR_PLLRDY},                     0x02000000)         dnl PLL clock ready flag
defsym({RCC_CR_PLL2ON},                     0x04000000)         dnl PLL2 enable
defsym({RCC_CR_PLL2RDY},                    0x08000000)         dnl PLL2 clock ready flag
defsym({RCC_CR_PLL3ON},                     0x10000000)         dnl PLL3 enable
defsym({RCC_CR_PLL3RDY},                    0x20000000)         dnl PLL3 clock ready flag

dnl *******************  Bit definition for RCC_CFGR register  *******************
defmask({RCC_CFGR_SW},                      0, 2)               dnl SW[1:0] bits (System clock Switch)
defsym({RCC_CFGR_SW_HSI},                   0x00000000)         dnl HSI selected as system clock
defsym({RCC_CFGR_SW_HSE},                   0x00000001)         dnl HSE selected as system clock
defsym({RCC_CFGR_SW_PLL},                   0x00000002)         dnl PLL selected as system clock

defmask({RCC_CFGR_SWS},                     2, 2)               dnl SWS[1:0] bits (System Clock Switch Status)
defsym({RCC_CFGR_SWS_HSI},                  0x00000000)         dnl HSI oscillator used as system clock
defsym({RCC_CFGR_SWS_HSE},                  0x00000004)         dnl HSE oscillator used as system clock
defsym({RCC_CFGR_SWS_PLL},                  0x00000008)         dnl PLL used as system clock

defmask({RCC_CFGR_HPRE},                    4, 4)               dnl HPRE[3:0] bits (AHB prescaler)
defsym({RCC_CFGR_HPRE_DIV1},                0x00000000)         dnl SYSCLK not divided
defsym({RCC_CFGR_HPRE_DIV2},                0x00000080)         dnl SYSCLK divided by 2
defsym({RCC_CFGR_HPRE_DIV4},                0x00000090)         dnl SYSCLK divided by 4
defsym({RCC_CFGR_HPRE_DIV8},                0x000000A0)         dnl SYSCLK divided by 8
defsym({RCC_CFGR_HPRE_DIV16},               0x000000B0)         dnl SYSCLK divided by 16
defsym({RCC_CFGR_HPRE_DIV64},               0x000000C0)         dnl SYSCLK divided by 64
defsym({RCC_CFGR_HPRE_DIV128},              0x000000D0)         dnl SYSCLK divided by 128
defsym({RCC_CFGR_HPRE_DIV256},              0x000000E0)         dnl SYSCLK divided by 256
defsym({RCC_CFGR_HPRE_DIV512},              0x000000F0)         dnl SYSCLK divided by 512

defmask({RCC_CFGR_PPRE1},                   8, 3)               dnl PRE1[2:0] bits (APB1 prescaler)
defsym({RCC_CFGR_PPRE1_DIV1},               0x00000000)         dnl HCLK not divided
defsym({RCC_CFGR_PPRE1_DIV2},               0x00000400)         dnl HCLK divided by 2
defsym({RCC_CFGR_PPRE1_DIV4},               0x00000500)         dnl HCLK divided by 4
defsym({RCC_CFGR_PPRE1_DIV8},               0x00000600)         dnl HCLK divided by 8
defsym({RCC_CFGR_PPRE1_DIV16},              0x00000700)         dnl HCLK divided by 16

defmask({RCC_CFGR_PPRE2},                   11, 3)              dnl PRE2[2:0] bits (APB2 prescaler)
defsym({RCC_CFGR_PPRE2_DIV1},               0x00000000)         dnl HCLK not divided
defsym({RCC_CFGR_PPRE2_DIV2},               0x00002000)         dnl HCLK divided by 2
defsym({RCC_CFGR_PPRE2_DIV4},               0x00002800)         dnl HCLK divided by 4
defsym({RCC_CFGR_PPRE2_DIV8},               0x00003000)         dnl HCLK divided by 8
defsym({RCC_CFGR_PPRE2_DIV16},              0x00003800)         dnl HCLK divided by 16

defmask({RCC_CFGR_ADCPRE},                  14, 2)              dnl ADCPRE[1:0] bits (ADC prescaler)
defsym({RCC_CFGR_ADCPRE_DIV2},              0x00000000)         dnl PCLK2 divided by 2
defsym({RCC_CFGR_ADCPRE_DIV4},              0x00004000)         dnl PCLK2 divided by 4
defsym({RCC_CFGR_ADCPRE_DIV6},              0x00008000)         dnl PCLK2 divided by 6
defsym({RCC_CFGR_ADCPRE_DIV8},              0x0000C000)         dnl PCLK2 divided by 8
defsym({RCC_CFGR_PLLSRC},                   0x00010000)         dnl PLL entry clock source
defsym({RCC_CFGR_PLLXTPRE},                 0x00020000)         dnl HSE divider for PLL entry
defmask({RCC_CFGR_PLLMULL},                 18, 4)              dnl PLLMUL[3:0] bits (PLL multiplication factor)
defmask({RCC_CFGR_MCO},                     24, 4)              dnl MCO[3:0] bits (Microcontroller Clock Output)

defsym({RCC_CFGR_PLLSRC_HSI_Div2},          0x00000000)         dnl HSI clock divided by 2 selected as PLL entry clock source

defsym({RCC_CFGR_PLLMULL2},                 0x00000000)         dnl PLL input clock*2
defsym({RCC_CFGR_PLLMULL3},                 0x00040000)         dnl PLL input clock*3
defsym({RCC_CFGR_PLLMULL4},                 0x00080000)         dnl PLL input clock * 4
defsym({RCC_CFGR_PLLMULL5},                 0x000C0000)         dnl PLL input clock * 5
defsym({RCC_CFGR_PLLMULL6},                 0x00100000)         dnl PLL input clock * 6
defsym({RCC_CFGR_PLLMULL7},                 0x00140000)         dnl PLL input clock * 7
defsym({RCC_CFGR_PLLMULL8},                 0x00180000)         dnl PLL input clock * 8
defsym({RCC_CFGR_PLLMULL9},                 0x001C0000)         dnl PLL input clock * 9

defsym({RCC_CFGR_MCO_NOCLOCK},              0x00000000)         dnl No clock

ifdef({STM32F10X_CL},{
defsym({RCC_CFGR_PLLSRC_PREDIV1},           0x00010000)         dnl PREDIV1 clock selected as PLL entry clock source
defsym({RCC_CFGR_PLLXTPRE_PREDIV1},         0x00000000)         dnl PREDIV1 clock not divided for PLL entry
defsym({RCC_CFGR_PLLXTPRE_PREDIV1_Div2},    0x00020000)         dnl PREDIV1 clock divided by 2 for PLL entry
defsym({RCC_CFGR_OTGFSPRE},                 0x00400000)         dnl USB OTG FS prescaler
defsym({RCC_CFGR_MCO_SYSCLK},               0x04000000)         dnl System clock selected as MCO source
defsym({RCC_CFGR_MCO_HSI},                  0x05000000)         dnl HSI clock selected as MCO source
defsym({RCC_CFGR_MCO_HSE},                  0x06000000)         dnl HSE clock selected as MCO source
defsym({RCC_CFGR_PLLMULL6_5},               0x00340000)         dnl PLL input clock * 6.5
defsym({RCC_CFGR_MCO_PLLCLK_Div2},          0x07000000)         dnl PLL clock divided by 2 selected as MCO source
defsym({RCC_CFGR_MCO_PLL2CLK},              0x08000000)         dnl PLL2 clock selected as MCO source
defsym({RCC_CFGR_MCO_PLL3CLK_Div2},         0x09000000)         dnl PLL3 clock divided by 2 selected as MCO source
defsym({RCC_CFGR_MCO_Ext_HSE},              0x0A000000)         dnl XT1 external 3-25 MHz oscillator clock selected as MCO source
defsym({RCC_CFGR_MCO_PLL3CLK},              0x0B000000)         dnl PLL3 clock selected as MCO source
}) dnl endif STM32F10X_CL

ifdef({STM32F10X_VL},{
defsym({RCC_CFGR_PLLSRC_PREDIV1},           0x00010000)         dnl PREDIV1 clock selected as PLL entry clock source
defsym({RCC_CFGR_PLLXTPRE_PREDIV1},         0x00000000)         dnl PREDIV1 clock not divided for PLL entry
defsym({RCC_CFGR_PLLXTPRE_PREDIV1_Div2},    0x00020000)         dnl PREDIV1 clock divided by 2 for PLL entry
defsym({RCC_CFGR_PLLMULL10},                0x00200000)         dnl PLL input clock*10
defsym({RCC_CFGR_PLLMULL11},                0x00240000)         dnl PLL input clock*11
defsym({RCC_CFGR_PLLMULL12},                0x00280000)         dnl PLL input clock*12
defsym({RCC_CFGR_PLLMULL13},                0x002C0000)         dnl PLL input clock*13
defsym({RCC_CFGR_PLLMULL14},                0x00300000)         dnl PLL input clock*14
defsym({RCC_CFGR_PLLMULL15},                0x00340000)         dnl PLL input clock*15
defsym({RCC_CFGR_PLLMULL16},                0x00380000)         dnl PLL input clock*16
defsym({RCC_CFGR_MCO_PLL},                  0x07000000)         dnl PLL clock divided by 2 selected as MCO source
}) dnl endif STM32F10X_VL

ifdef({STM32F10X_BASE},{
defsym({RCC_CFGR_PLLSRC_HSE},               0x00010000)         dnl HSE clock selected as PLL entry clock source
defsym({RCC_CFGR_PLLXTPRE_HSE},             0x00000000)         dnl HSE clock not divided for PLL entry
defsym({RCC_CFGR_PLLXTPRE_HSE_Div2},        0x00020000)         dnl HSE clock divided by 2 for PLL entry
defsym({RCC_CFGR_PLLMULL10},                0x00200000)         dnl PLL input clock*10
defsym({RCC_CFGR_PLLMULL11},                0x00240000)         dnl PLL input clock*11
defsym({RCC_CFGR_PLLMULL12},                0x00280000)         dnl PLL input clock*12
defsym({RCC_CFGR_PLLMULL13},                0x002C0000)         dnl PLL input clock*13
defsym({RCC_CFGR_PLLMULL14},                0x00300000)         dnl PLL input clock*14
defsym({RCC_CFGR_PLLMULL15},                0x00340000)         dnl PLL input clock*15
defsym({RCC_CFGR_PLLMULL16},                0x00380000)         dnl PLL input clock*16
defsym({RCC_CFGR_USBPRE},                   0x00400000)         dnl USB Device prescaler
defsym({RCC_CFGR_MCO_PLL},                  0x07000000)         dnl PLL clock divided by 2 selected as MCO source
}) dnl endif STM32F10X_BASE

dnl ******************  Bit definition for RCC_CIR register  ********************
defsym({RCC_CIR_LSIRDYF},                   0x00000001)         dnl LSI Ready Interrupt flag
defsym({RCC_CIR_LSERDYF},                   0x00000002)         dnl LSE Ready Interrupt flag
defsym({RCC_CIR_HSIRDYF},                   0x00000004)         dnl HSI Ready Interrupt flag
defsym({RCC_CIR_HSERDYF},                   0x00000008)         dnl HSE Ready Interrupt flag
defsym({RCC_CIR_PLLRDYF},                   0x00000010)         dnl PLL Ready Interrupt flag
defsym({RCC_CIR_PLL2RDYF},                  0x00000020)         dnl PLL2 Ready Interrupt flag
defsym({RCC_CIR_PLL3RDYF},                  0x00000040)         dnl PLL3 Ready Interrupt flag
defsym({RCC_CIR_CSSF},                      0x00000080)         dnl Clock Security System Interrupt flag
defsym({RCC_CIR_LSIRDYIE},                  0x00000100)         dnl LSI Ready Interrupt Enable
defsym({RCC_CIR_LSERDYIE},                  0x00000200)         dnl LSE Ready Interrupt Enable
defsym({RCC_CIR_HSIRDYIE},                  0x00000400)         dnl HSI Ready Interrupt Enable
defsym({RCC_CIR_HSERDYIE},                  0x00000800)         dnl HSE Ready Interrupt Enable
defsym({RCC_CIR_PLLRDYIE},                  0x00001000)         dnl PLL Ready Interrupt Enable
defsym({RCC_CIR_PLL2RDYIE},                 0x00002000)         dnl PLL2 Ready Interrupt Enable
defsym({RCC_CIR_PLL3RDYIE},                 0x00004000)         dnl PLL3 Ready Interrupt Enable
defsym({RCC_CIR_LSIRDYC},                   0x00010000)         dnl LSI Ready Interrupt Clear
defsym({RCC_CIR_LSERDYC},                   0x00020000)         dnl LSE Ready Interrupt Clear
defsym({RCC_CIR_HSIRDYC},                   0x00040000)         dnl HSI Ready Interrupt Clear
defsym({RCC_CIR_HSERDYC},                   0x00080000)         dnl HSE Ready Interrupt Clear
defsym({RCC_CIR_PLLRDYC},                   0x00100000)         dnl PLL Ready Interrupt Clear
defsym({RCC_CIR_PLL2RDYC},                  0x00200000)         dnl PLL2 Ready Interrupt Clear
defsym({RCC_CIR_PLL3RDYC},                  0x00400000)         dnl PLL3 Ready Interrupt Clear
defsym({RCC_CIR_CSSC},                      0x00800000)         dnl Clock Security System Interrupt Clear

dnl *****************  Bit definition for RCC_APB2RSTR register  *****************
defsym({RCC_APB2RSTR_AFIORST},              0x00000001)         dnl Alternate Function I/O reset
defsym({RCC_APB2RSTR_IOPARST},              0x00000004)         dnl I/O port A reset
defsym({RCC_APB2RSTR_IOPBRST},              0x00000008)         dnl I/O port B reset
defsym({RCC_APB2RSTR_IOPCRST},              0x00000010)         dnl I/O port C reset
defsym({RCC_APB2RSTR_IOPDRST},              0x00000020)         dnl I/O port D reset
defsym({RCC_APB2RSTR_IOPERST},              0x00000040)         dnl I/O port E reset
defsym({RCC_APB2RSTR_IOPFRST},              0x00000080)         dnl I/O port F reset
defsym({RCC_APB2RSTR_IOPGRST},              0x00000100)         dnl I/O port G reset
defsym({RCC_APB2RSTR_ADC1RST},              0x00000200)         dnl ADC 1 interface reset
defsym({RCC_APB2RSTR_ADC2RST},              0x00000400)         dnl ADC 2 interface reset
defsym({RCC_APB2RSTR_TIM1RST},              0x00000800)         dnl TIM1 Timer reset
defsym({RCC_APB2RSTR_SPI1RST},              0x00001000)         dnl SPI 1 reset
defsym({RCC_APB2RSTR_TIM8RST},              0x00002000)         dnl TIM8 Timer reset
defsym({RCC_APB2RSTR_USART1RST},            0x00004000)         dnl USART1 reset
defsym({RCC_APB2RSTR_ADC3RST} ,               0x00008000)       dnl ADC3 interface reset
defsym({RCC_APB2RSTR_TIM15RST},             0x00010000)         dnl TIM15 Timer reset
defsym({RCC_APB2RSTR_TIM16RST},             0x00020000)         dnl TIM16 Timer reset
defsym({RCC_APB2RSTR_TIM17RST},             0x00040000)         dnl TIM17 Timer reset
defsym({RCC_APB2RSTR_TIM9RST},              0x00080000)         dnl TIM9 Timer reset
defsym({RCC_APB2RSTR_TIM10RST},             0x00100000)         dnl TIM10 Timer reset
defsym({RCC_APB2RSTR_TIM11RST},             0x00200000)         dnl TIM11 Timer reset

dnl *****************  Bit definition for RCC_APB1RSTR register  *****************
defsym({RCC_APB1RSTR_TIM2RST},              0x00000001)         dnl Timer 2 reset
defsym({RCC_APB1RSTR_TIM3RST},              0x00000002)         dnl Timer 3 reset
defsym({RCC_APB1RSTR_TIM4RST},              0x00000004)         dnl Timer 4 reset
defsym({RCC_APB1RSTR_TIM5RST},              0x00000008)         dnl Timer 5 reset
defsym({RCC_APB1RSTR_TIM6RST},              0x00000010)         dnl Timer 6 reset
defsym({RCC_APB1RSTR_TIM7RST},              0x00000020)         dnl Timer 7 reset
defsym({RCC_APB1RSTR_TIM12RST},             0x00000040)         dnl TIM12 Timer reset
defsym({RCC_APB1RSTR_TIM13RST},             0x00000080)         dnl TIM13 Timer reset
defsym({RCC_APB1RSTR_TIM14RST},             0x00000100)         dnl TIM14 Timer reset
defsym({RCC_APB1RSTR_WWDGRST},              0x00000800)         dnl Window Watchdog reset
defsym({RCC_APB1RSTR_SPI2RST},              0x00004000)         dnl SPI 2 reset
defsym({RCC_APB1RSTR_SPI3RST},              0x00008000)         dnl SPI 3 reset
defsym({RCC_APB1RSTR_USART2RST},            0x00020000)         dnl USART 2 reset
defsym({RCC_APB1RSTR_USART3RST},            0x00040000)         dnl USART 3 reset
defsym({RCC_APB1RSTR_UART4RST},             0x00080000)         dnl UART 4 reset
defsym({RCC_APB1RSTR_UART5RST},             0x00100000)         dnl UART 5 reset
defsym({RCC_APB1RSTR_I2C1RST},              0x00200000)         dnl I2C 1 reset
defsym({RCC_APB1RSTR_I2C2RST},              0x00400000)         dnl I2C 2 reset
defsym({RCC_APB1RSTR_USBRST},               0x00800000)         dnl USB Device reset
defsym({RCC_APB1RSTR_CAN1RST},              0x02000000)         dnl CAN1 reset
defsym({RCC_APB1RSTR_CAN2RST},              0x04000000)         dnl CAN2 reset
defsym({RCC_APB1RSTR_BKPRST},               0x08000000)         dnl Backup interface reset
defsym({RCC_APB1RSTR_PWRRST},               0x10000000)         dnl Power interface reset
defsym({RCC_APB1RSTR_DACRST},               0x20000000)         dnl DAC interface reset
defsym({RCC_APB1RSTR_CECRST},               0x40000000)         dnl CEC interface reset

dnl ******************  Bit definition for RCC_AHBENR register  ******************
defsym({RCC_AHBENR_DMA1EN},                 0x0001)             dnl DMA1 clock enable
defsym({RCC_AHBENR_DMA2EN} ,                0x0002)             dnl DMA2 clock enable
defsym({RCC_AHBENR_SRAMEN},                 0x0004)             dnl SRAM interface clock enable
defsym({RCC_AHBENR_FLITFEN},                0x0010)             dnl FLITF clock enable
defsym({RCC_AHBENR_CRCEN},                  0x0040)             dnl CRC clock enable
defsym({RCC_AHBENR_FSMCEN},                 0x0100)             dnl FSMC clock enable
defsym({RCC_AHBENR_SDIOEN},                 0x0400)             dnl SDIO clock enable
defsym({RCC_AHBENR_OTGFSEN},                0x00001000)         dnl USB OTG FS clock enable
defsym({RCC_AHBENR_ETHMACEN},               0x00004000)         dnl ETHERNET MAC clock enable
defsym({RCC_AHBENR_ETHMACTXEN},             0x00008000)         dnl ETHERNET MAC Tx clock enable
defsym({RCC_AHBENR_ETHMACRXEN},             0x00010000)         dnl ETHERNET MAC Rx clock enable

dnl ******************  Bit definition for RCC_APB2ENR register  *****************
defsym({RCC_APB2ENR_AFIOEN},                0x00000001)         dnl Alternate Function I/O clock enable
defsym({RCC_APB2ENR_IOPAEN},                0x00000004)         dnl I/O port A clock enable
defsym({RCC_APB2ENR_IOPBEN},                0x00000008)         dnl I/O port B clock enable
defsym({RCC_APB2ENR_IOPCEN},                0x00000010)         dnl I/O port C clock enable
defsym({RCC_APB2ENR_IOPDEN},                0x00000020)         dnl I/O port D clock enable
defsym({RCC_APB2ENR_IOPEEN},                0x00000040)         dnl I/O port E clock enable
defsym({RCC_APB2ENR_IOPFEN},                0x00000080)         dnl I/O port F clock enable
defsym({RCC_APB2ENR_IOPGEN},                0x00000100)         dnl I/O port G clock enable
defsym({RCC_APB2ENR_ADC1EN},                0x00000200)         dnl ADC 1 interface clock enable
defsym({RCC_APB2ENR_ADC2EN},                0x00000400)         dnl ADC 2 interface clock enable
defsym({RCC_APB2ENR_TIM1EN},                0x00000800)         dnl TIM1 Timer clock enable
defsym({RCC_APB2ENR_SPI1EN},                0x00001000)         dnl SPI 1 clock enable
defsym({RCC_APB2ENR_TIM8EN},                0x00002000)         dnl TIM8 Timer clock enable
defsym({RCC_APB2ENR_USART1EN},              0x00004000)         dnl USART1 clock enable
defsym({RCC_APB2ENR_ADC3EN},                0x00008000)         dnl DMA1 clock enable
defsym({RCC_APB2ENR_TIM15EN},               0x00010000)         dnl TIM15 Timer clock enable
defsym({RCC_APB2ENR_TIM16EN},               0x00020000)         dnl TIM16 Timer clock enable
defsym({RCC_APB2ENR_TIM17EN},               0x00040000)         dnl TIM17 Timer clock enable
defsym({RCC_APB2ENR_TIM9EN},                0x00080000)         dnl TIM9 Timer clock enable
defsym({RCC_APB2ENR_TIM10EN},               0x00100000)         dnl TIM10 Timer clock enable
defsym({RCC_APB2ENR_TIM11EN},               0x00200000)         dnl TIM11 Timer clock enable

dnl *****************  Bit definition for RCC_APB1ENR register  ******************
defsym({RCC_APB1ENR_TIM2EN},                0x00000001)         dnl Timer 2 clock enabled
defsym({RCC_APB1ENR_TIM3EN},                0x00000002)         dnl Timer 3 clock enable
defsym({RCC_APB1ENR_TIM4EN},                0x00000004)         dnl Timer 4 clock enable
defsym({RCC_APB1ENR_TIM5EN},                0x00000008)         dnl Timer 5 clock enable
defsym({RCC_APB1ENR_TIM6EN},                0x00000010)         dnl Timer 6 clock enable
defsym({RCC_APB1ENR_TIM7EN},                0x00000020)         dnl Timer 7 clock enable
defsym({RCC_APB1ENR_TIM12EN},               0x00000040)         dnl TIM12 Timer clock enable
defsym({RCC_APB1ENR_TIM13EN},               0x00000080)         dnl TIM13 Timer clock enable
defsym({RCC_APB1ENR_TIM14EN},               0x00000100)         dnl TIM14 Timer clock enable
defsym({RCC_APB1ENR_WWDGEN},                0x00000800)         dnl Window Watchdog clock enable
defsym({RCC_APB1ENR_SPI2EN},                0x00004000)         dnl SPI 2 clock enable
defsym({RCC_APB1ENR_SPI3EN},                0x00008000)         dnl SPI 3 clock enable
defsym({RCC_APB1ENR_USART2EN},              0x00020000)         dnl USART 2 clock enable
defsym({RCC_APB1ENR_USART3EN},              0x00040000)         dnl USART 3 clock enable
defsym({RCC_APB1ENR_UART4EN},               0x00080000)         dnl UART 4 clock enable
defsym({RCC_APB1ENR_UART5EN},               0x00100000)         dnl UART 5 clock enable
defsym({RCC_APB1ENR_I2C1EN},                0x00200000)         dnl I2C 1 clock enable
defsym({RCC_APB1ENR_I2C2EN},                0x00400000)         dnl I2C 2 clock enable
defsym({RCC_APB1ENR_UART4EN},               0x00080000)         dnl UART 4 clock enable
defsym({RCC_APB1ENR_UART5EN},               0x00100000)         dnl UART 5 clock enable
defsym({RCC_APB1ENR_USBEN},                 0x00800000)         dnl USB Device clock enable
defsym({RCC_APB1ENR_CAN1EN},                0x02000000)         dnl CAN1 clock enable
defsym({RCC_APB1ENR_CAN2EN},                0x04000000)         dnl CAN2 clock enable
defsym({RCC_APB1ENR_BKPEN},                 0x08000000)         dnl Backup interface clock enable
defsym({RCC_APB1ENR_PWREN},                 0x10000000)         dnl Power interface clock enable
defsym({RCC_APB1ENR_DACEN},                 0x20000000)         dnl DAC interface clock enable
defsym({RCC_APB1ENR_CECEN},                 0x40000000)         dnl CEC interface clock enable

dnl *******************  Bit definition for RCC_BDCR register  *******************
defsym({RCC_BDCR_LSEON},                    0x00000001)         dnl External Low Speed oscillator enable
defsym({RCC_BDCR_LSERDY},                   0x00000002)         dnl External Low Speed oscillator Ready
defsym({RCC_BDCR_LSEBYP},                   0x00000004)         dnl External Low Speed oscillator Bypass
defmask({RCC_BDCR_RTCSEL},                  8, 2)               dnl RTCSEL[1:0] bits (RTC clock source selection)
defsym({RCC_BDCR_RTCSEL_NOCLOCK},           0x00000000)         dnl No clock
defsym({RCC_BDCR_RTCSEL_LSE},               0x00000100)         dnl LSE oscillator clock used as RTC clock
defsym({RCC_BDCR_RTCSEL_LSI},               0x00000200)         dnl LSI oscillator clock used as RTC clock
defsym({RCC_BDCR_RTCSEL_HSE},               0x00000300)         dnl HSE oscillator clock divided by 128 used as RTC clock
defsym({RCC_BDCR_RTCEN},                    0x00008000)         dnl RTC clock enable
defsym({RCC_BDCR_BDRST},                    0x00010000)         dnl Backup domain software reset

dnl *******************  Bit definition for RCC_CSR register  ********************
defsym({RCC_CSR_LSION},                     0x00000001)         dnl Internal Low Speed oscillator enable
defsym({RCC_CSR_LSIRDY},                    0x00000002)         dnl Internal Low Speed oscillator Ready
defsym({RCC_CSR_RMVF},                      0x01000000)         dnl Remove reset flag
defsym({RCC_CSR_PINRSTF},                   0x04000000)         dnl PIN reset flag
defsym({RCC_CSR_PORRSTF},                   0x08000000)         dnl POR/PDR reset flag
defsym({RCC_CSR_SFTRSTF},                   0x10000000)         dnl Software Reset flag
defsym({RCC_CSR_IWDGRSTF},                  0x20000000)         dnl Independent Watchdog reset flag
defsym({RCC_CSR_WWDGRSTF},                  0x40000000)         dnl Window watchdog reset flag
defsym({RCC_CSR_LPWRRSTF},                  0x80000000)         dnl Low-Power reset flag

dnl *******************  Bit definition for RCC_AHBRSTR register  ****************
defsym({RCC_AHBRSTR_OTGFSRST},              0x00001000)         dnl USB OTG FS reset
defsym({RCC_AHBRSTR_ETHMACRST},             0x00004000)         dnl ETHERNET MAC reset

dnl *******************  Bit definition for RCC_CFGR2 register  ******************
defmask({RCC_CFGR2_PREDIV1},                0, 4)               dnl PREDIV1[3:0] bits
defmask({RCC_CFGR2_PREDIV2},                4, 4)               dnl PREDIV2[3:0] bits

defmask({RCC_CFGR2_PLL2MUL},                8, 4)               dnl PLL2MUL[3:0] bits
defsym({RCC_CFGR2_PLL2MUL8},                0x00000600)         dnl PLL2 input clock * 8
defsym({RCC_CFGR2_PLL2MUL9},                0x00000700)         dnl PLL2 input clock * 9
defsym({RCC_CFGR2_PLL2MUL10},               0x00000800)         dnl PLL2 input clock * 10
defsym({RCC_CFGR2_PLL2MUL11},               0x00000900)         dnl PLL2 input clock * 11
defsym({RCC_CFGR2_PLL2MUL12},               0x00000A00)         dnl PLL2 input clock * 12
defsym({RCC_CFGR2_PLL2MUL13},               0x00000B00)         dnl PLL2 input clock * 13
defsym({RCC_CFGR2_PLL2MUL14},               0x00000C00)         dnl PLL2 input clock * 14
defsym({RCC_CFGR2_PLL2MUL16},               0x00000E00)         dnl PLL2 input clock * 16
defsym({RCC_CFGR2_PLL2MUL20},               0x00000F00)         dnl PLL2 input clock * 20

defmask({RCC_CFGR2_PLL3MUL},                12, 4)              dnl PLL3MUL[3:0] bits
defsym({RCC_CFGR2_PLL3MUL8},                0x00006000)         dnl PLL3 input clock * 8
defsym({RCC_CFGR2_PLL3MUL9},                0x00007000)         dnl PLL3 input clock * 9
defsym({RCC_CFGR2_PLL3MUL10},               0x00008000)         dnl PLL3 input clock * 10
defsym({RCC_CFGR2_PLL3MUL11},               0x00009000)         dnl PLL3 input clock * 11
defsym({RCC_CFGR2_PLL3MUL12},               0x0000A000)         dnl PLL3 input clock * 12
defsym({RCC_CFGR2_PLL3MUL13},               0x0000B000)         dnl PLL3 input clock * 13
defsym({RCC_CFGR2_PLL3MUL14},               0x0000C000)         dnl PLL3 input clock * 14
defsym({RCC_CFGR2_PLL3MUL16},               0x0000E000)         dnl PLL3 input clock * 16
defsym({RCC_CFGR2_PLL3MUL20},               0x0000F000)         dnl PLL3 input clock * 20

defsym({RCC_CFGR2_PREDIV1SRC},              0x00010000)         dnl PREDIV1 entry clock source
defsym({RCC_CFGR2_PREDIV1SRC_PLL2},         0x00010000)         dnl PLL2 selected as PREDIV1 entry clock source
defsym({RCC_CFGR2_PREDIV1SRC_HSE},          0x00000000)         dnl HSE selected as PREDIV1 entry clock source
defsym({RCC_CFGR2_I2S2SRC},                 0x00020000)         dnl I2S2 entry clock source
defsym({RCC_CFGR2_I2S3SRC},                 0x00040000)         dnl I2S3 clock source


dnl ******************************************************************************
dnl
dnl                General Purpose and Alternate Function I/O
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for GPIO_CRL register  *******************
defsym({GPIO_CRL_MODE},                     0x33333333)         dnl Port x mode bits

defmask({GPIO_CRL_MODE0},                   0, 2)               dnl MODE0[1:0] bits (Port x mode bits, pin 0)
defmask({GPIO_CRL_MODE1},                   4, 2)               dnl MODE1[1:0] bits (Port x mode bits, pin 1)
defmask({GPIO_CRL_MODE2},                   8, 2)               dnl MODE2[1:0] bits (Port x mode bits, pin 2)
defmask({GPIO_CRL_MODE3},                   12, 2)              dnl MODE3[1:0] bits (Port x mode bits, pin 3)
defmask({GPIO_CRL_MODE4},                   16, 2)              dnl MODE4[1:0] bits (Port x mode bits, pin 4)
defmask({GPIO_CRL_MODE5},                   20, 2)              dnl MODE5[1:0] bits (Port x mode bits, pin 5)
defmask({GPIO_CRL_MODE6},                   24, 2)              dnl MODE6[1:0] bits (Port x mode bits, pin 6)
defmask({GPIO_CRL_MODE7},                   28, 2)              dnl MODE7[1:0] bits (Port x mode bits, pin 7)
defsym({GPIO_CRL_CNF},                      0xCCCCCCCC)         dnl Port x configuration bits
defmask({GPIO_CRL_CNF0},                    2, 2)               dnl CNF0[1:0] bits (Port x configuration bits, pin 0)
defmask({GPIO_CRL_CNF1},                    6, 2)               dnl CNF1[1:0] bits (Port x configuration bits, pin 1)
defmask({GPIO_CRL_CNF2},                    10, 2)              dnl CNF2[1:0] bits (Port x configuration bits, pin 2)
defmask({GPIO_CRL_CNF3},                    14, 2)              dnl CNF3[1:0] bits (Port x configuration bits, pin 3)
defmask({GPIO_CRL_CNF4},                    18, 2)              dnl CNF4[1:0] bits (Port x configuration bits, pin 4)
defmask({GPIO_CRL_CNF5},                    22, 2)              dnl CNF5[1:0] bits (Port x configuration bits, pin 5)
defmask({GPIO_CRL_CNF6},                    26, 2)              dnl CNF6[1:0] bits (Port x configuration bits, pin 6)
defmask({GPIO_CRL_CNF7},                    30, 2)              dnl CNF7[1:0] bits (Port x configuration bits, pin 7)
dnl *******************  Bit definition for GPIO_CRH register  *******************
defsym({GPIO_CRH_MODE},                     0x33333333)         dnl Port x mode bits
defmask({GPIO_CRH_MODE8},                   0, 2)               dnl MODE8[1:0] bits (Port x mode bits, pin 8)
defmask({GPIO_CRH_MODE9},                   4, 2)               dnl MODE9[1:0] bits (Port x mode bits, pin 9)
defmask({GPIO_CRH_MODE10},                  8, 2)               dnl MODE10[1:0] bits (Port x mode bits, pin 10)
defmask({GPIO_CRH_MODE11},                  12, 2)              dnl MODE11[1:0] bits (Port x mode bits, pin 11)
defmask({GPIO_CRH_MODE12},                  16, 2)              dnl MODE12[1:0] bits (Port x mode bits, pin 12)
defmask({GPIO_CRH_MODE13},                  20, 2)              dnl MODE13[1:0] bits (Port x mode bits, pin 13)
defmask({GPIO_CRH_MODE14},                  24, 2)              dnl MODE14[1:0] bits (Port x mode bits, pin 14)
defmask({GPIO_CRH_MODE15},                  28, 2)              dnl MODE15[1:0] bits (Port x mode bits, pin 15)
defsym({GPIO_CRH_CNF},                      0xCCCCCCCC)         dnl Port x configuration bits
defmask({GPIO_CRH_CNF8},                    2, 2)               dnl CNF8[1:0] bits (Port x configuration bits, pin 8)
defmask({GPIO_CRH_CNF9},                    6, 2)               dnl CNF9[1:0] bits (Port x configuration bits, pin 9)
defmask({GPIO_CRH_CNF10},                   10, 2)              dnl CNF10[1:0] bits (Port x configuration bits, pin 10)
defmask({GPIO_CRH_CNF11},                   14, 2)              dnl CNF11[1:0] bits (Port x configuration bits, pin 11)
defmask({GPIO_CRH_CNF12},                   18, 2)              dnl CNF12[1:0] bits (Port x configuration bits, pin 12)
defmask({GPIO_CRH_CNF13},                   22, 2)              dnl CNF13[1:0] bits (Port x configuration bits, pin 13)
defmask({GPIO_CRH_CNF14},                   26, 2)              dnl CNF14[1:0] bits (Port x configuration bits, pin 14)
defmask({GPIO_CRH_CNF15},                   30, 2)              dnl CNF15[1:0] bits (Port x configuration bits, pin 15)

defsym({GPIO_MODE_INPUT},                   0)
defsym({GPIO_MODE_OUTPUT_10MHz},            1)
defsym({GPIO_MODE_OUTPUT_2MHz},             2)
defsym({GPIO_MODE_OUTPUT_50MHz},            3)

defsym({GPIO_CNF_INPUT_ANALOG},             0)
defsym({GPIO_CNF_INPUT_FLOAT},              1)
defsym({GPIO_CNF_INPUT_PUPD},               2)

defsym({GPIO_CNF_OUTPUT_PP},                0)
defsym({GPIO_CNF_OUTPUT_OD},                1)
defsym({GPIO_CNF_ALTERNATE_PP},             2)
defsym({GPIO_CNF_ALTERNATE_OD},             3)


dnl ******************  Bit definition for AFIO_EVCR register  *******************
defmask({AFIO_EVCR_PORT},                   4, 3)               dnl PORT[2:0] bits (Port selection)
defsym({AFIO_EVCR_PORT_PA},                 0x00)               dnl Port A selected
defsym({AFIO_EVCR_PORT_PB},                 0x10)               dnl Port B selected
defsym({AFIO_EVCR_PORT_PC},                 0x20)               dnl Port C selected
defsym({AFIO_EVCR_PORT_PD},                 0x30)               dnl Port D selected
defsym({AFIO_EVCR_PORT_PE},                 0x40)               dnl Port E selected
defsym({AFIO_EVCR_EVOE},                    0x80)               dnl Event Output Enable

dnl ******************  Bit definition for AFIO_MAPR register  *******************
defsym({AFIO_MAPR_SPI1_REMAP},              0x00000001)         dnl SPI1 remapping
defsym({AFIO_MAPR_I2C1_REMAP},              0x00000002)         dnl I2C1 remapping
defsym({AFIO_MAPR_USART1_REMAP},            0x00000004)         dnl USART1 remapping
defsym({AFIO_MAPR_USART2_REMAP},            0x00000008)         dnl USART2 remapping

defmask({AFIO_MAPR_USART3_REMAP},           4, 2)               dnl USART3_REMAP[1:0] bits (USART3 remapping)
dnl USART3_REMAP configuration
defsym({AFIO_MAPR_USART3_REMAP_NOREMAP},    0x00000000)         dnl No remap (TX/PB10, RX/PB11, CK/PB12, CTS/PB13, RTS/PB14)
defsym({AFIO_MAPR_USART3_REMAP_PARTIALREMAP},                                           0x00000010)             dnl Partial remap (TX/PC10, RX/PC11, CK/PC12, CTS/PB13, RTS/PB14)
defsym({AFIO_MAPR_USART3_REMAP_FULLREMAP},  0x00000030)         dnl Full remap (TX/PD8, RX/PD9, CK/PD10, CTS/PD11, RTS/PD12)

defmask({AFIO_MAPR_TIM1_REMAP},             6, 2)               dnl TIM1_REMAP[1:0] bits (TIM1 remapping)
defsym({AFIO_MAPR_TIM1_REMAP_NOREMAP},      0x00000000)         dnl No remap (ETR/PA12, CH1/PA8, CH2/PA9, CH3/PA10, CH4/PA11, BKIN/PB12, CH1N/PB13, CH2N/PB14, CH3N/PB15)
defsym({AFIO_MAPR_TIM1_REMAP_PARTIALREMAP}, 0x00000040)         dnl Partial remap (ETR/PA12, CH1/PA8, CH2/PA9, CH3/PA10, CH4/PA11, BKIN/PA6, CH1N/PA7, CH2N/PB0, CH3N/PB1)
defsym({AFIO_MAPR_TIM1_REMAP_FULLREMAP},    0x000000C0)         dnl Full remap (ETR/PE7, CH1/PE9, CH2/PE11, CH3/PE13, CH4/PE14, BKIN/PE15, CH1N/PE8, CH2N/PE10, CH3N/PE12)

defmask({AFIO_MAPR_TIM2_REMAP},             8, 2)               dnl TIM2_REMAP[1:0] bits (TIM2 remapping)
defsym({AFIO_MAPR_TIM2_REMAP_NOREMAP},      0x00000000)         dnl No remap (CH1/ETR/PA0, CH2/PA1, CH3/PA2, CH4/PA3)
defsym({AFIO_MAPR_TIM2_REMAP_PARTIALREMAP1},                                            0x00000100)             dnl Partial remap (CH1/ETR/PA15, CH2/PB3, CH3/PA2, CH4/PA3)
defsym({AFIO_MAPR_TIM2_REMAP_PARTIALREMAP2},                                            0x00000200)             dnl Partial remap (CH1/ETR/PA0, CH2/PA1, CH3/PB10, CH4/PB11)
defsym({AFIO_MAPR_TIM2_REMAP_FULLREMAP},    0x00000300)         dnl Full remap (CH1/ETR/PA15, CH2/PB3, CH3/PB10, CH4/PB11)

defmask({AFIO_MAPR_TIM3_REMAP},             10, 2)              dnl TIM3_REMAP[1:0] bits (TIM3 remapping)
defsym({AFIO_MAPR_TIM3_REMAP_NOREMAP},      0x00000000)         dnl No remap (CH1/PA6, CH2/PA7, CH3/PB0, CH4/PB1)
defsym({AFIO_MAPR_TIM3_REMAP_PARTIALREMAP}, 0x00000800)         dnl Partial remap (CH1/PB4, CH2/PB5, CH3/PB0, CH4/PB1)
defsym({AFIO_MAPR_TIM3_REMAP_FULLREMAP},    0x00000C00)         dnl Full remap (CH1/PC6, CH2/PC7, CH3/PC8, CH4/PC9)

defsym({AFIO_MAPR_TIM4_REMAP},              0x00001000)         dnl TIM4_REMAP bit (TIM4 remapping)

defmask({AFIO_MAPR_CAN_REMAP},              13, 2)              dnl CAN_REMAP[1:0] bits (CAN Alternate function remapping)
defsym({AFIO_MAPR_CAN_REMAP_REMAP1},        0x00000000)         dnl CANRX mapped to PA11, CANTX mapped to PA12
defsym({AFIO_MAPR_CAN_REMAP_REMAP2},        0x00004000)         dnl CANRX mapped to PB8, CANTX mapped to PB9
defsym({AFIO_MAPR_CAN_REMAP_REMAP3},        0x00006000)         dnl CANRX mapped to PD0, CANTX mapped to PD1

defsym({AFIO_MAPR_PD01_REMAP},              0x00008000)         dnl Port D0/Port D1 mapping on OSC_IN/OSC_OUT
defsym({AFIO_MAPR_TIM5CH4_IREMAP},          0x00010000)         dnl TIM5 Channel4 Internal Remap
defsym({AFIO_MAPR_ADC1_ETRGINJ_REMAP},      0x00020000)         dnl ADC 1 External Trigger Injected Conversion remapping
defsym({AFIO_MAPR_ADC1_ETRGREG_REMAP},      0x00040000)         dnl ADC 1 External Trigger Regular Conversion remapping
defsym({AFIO_MAPR_ADC2_ETRGINJ_REMAP},      0x00080000)         dnl ADC 2 External Trigger Injected Conversion remapping
defsym({AFIO_MAPR_ADC2_ETRGREG_REMAP},      0x00100000)         dnl ADC 2 External Trigger Regular Conversion remapping
defsym({AFIO_MAPR_ETH_REMAP},               0x00200000)         dnl SPI3_REMAP bit (Ethernet MAC I/O remapping)
defsym({AFIO_MAPR_CAN2_REMAP},              0x00400000)         dnl CAN2_REMAP bit (CAN2 I/O remapping)
defsym({AFIO_MAPR_MII_RMII_SEL},            0x00800000)         dnl MII_RMII_SEL bit (Ethernet MII or RMII selection)

defmask({AFIO_MAPR_SWJ_CFG},                24, 3)              dnl SWJ_CFG[2:0] bits (Serial Wire JTAG configuration)

defsym({AFIO_MAPR_SWJ_CFG_RESET},           0x00000000)         dnl Full SWJ (JTAG-DP + SW-DP) : Reset State
defsym({AFIO_MAPR_SWJ_CFG_NOJNTRST},        0x01000000)         dnl Full SWJ (JTAG-DP + SW-DP) but without JNTRST
defsym({AFIO_MAPR_SWJ_CFG_JTAGDISABLE},     0x02000000)         dnl JTAG-DP Disabled and SW-DP Enabled
defsym({AFIO_MAPR_SWJ_CFG_DISABLE},         0x04000000)         dnl JTAG-DP Disabled and SW-DP Disabled

defsym({AFIO_MAPR_SPI3_REMAP},              0x10000000)         dnl SPI3_REMAP bit (SPI3 remapping)
defsym({AFIO_MAPR_TIM2ITR1_IREMAP},         0x20000000)         dnl TIM2ITR1_IREMAP bit (TIM2 internal trigger 1 remapping)
defsym({AFIO_MAPR_PTP_PPS_REMAP},           0x40000000)         dnl PTP_PPS_REMAP bit (Ethernet PTP PPS remapping)

dnl *****************  Bit definition for AFIO_EXTICR1 register  *****************
defmask({AFIO_EXTICR1_EXTI0},               0, 4)               dnl EXTI 0 configuration
defmask({AFIO_EXTICR1_EXTI1},               4, 4)               dnl EXTI 1 configuration
defmask({AFIO_EXTICR1_EXTI2},               8, 4)               dnl EXTI 2 configuration
defmask({AFIO_EXTICR1_EXTI3},               12, 4)              dnl EXTI 3 configuration
dnl *****************  Bit definition for AFIO_EXTICR2 register  *****************
defmask({AFIO_EXTICR2_EXTI4},               0, 4)               dnl EXTI 4 configuration
defmask({AFIO_EXTICR2_EXTI5},               4, 4)               dnl EXTI 5 configuration
defmask({AFIO_EXTICR2_EXTI6},               8, 4)               dnl EXTI 6 configuration
defmask({AFIO_EXTICR2_EXTI7},               12, 4)              dnl EXTI 7 configuration
dnl *****************  Bit definition for AFIO_EXTICR3 register  *****************
defsym({AFIO_EXTICR3_EXTI8},                0x000F)             dnl EXTI 8 configuration
defsym({AFIO_EXTICR3_EXTI9},                0x00F0)             dnl EXTI 9 configuration
defsym({AFIO_EXTICR3_EXTI10},               0x0F00)             dnl EXTI 10 configuration
defsym({AFIO_EXTICR3_EXTI11},               0xF000)             dnl EXTI 11 configuration
dnl *****************  Bit definition for AFIO_EXTICR4 register  *****************
defsym({AFIO_EXTICR4_EXTI12},               0x000F)             dnl EXTI 12 configuration
defsym({AFIO_EXTICR4_EXTI13},               0x00F0)             dnl EXTI 13 configuration
defsym({AFIO_EXTICR4_EXTI14},               0x0F00)             dnl EXTI 14 configuration
defsym({AFIO_EXTICR4_EXTI15},               0xF000)             dnl EXTI 15 configuration

defsym({AFIO_EXTICR_EXTI_PA},               0)  dnl PA[n] pin
defsym({AFIO_EXTICR_EXTI_PB},               1)  dnl PB[n] pin
defsym({AFIO_EXTICR_EXTI_PC},               2)  dnl PC[n] pin
defsym({AFIO_EXTICR_EXTI_PD},               3)  dnl PD[n] pin
defsym({AFIO_EXTICR_EXTI_PE},               4)  dnl PE[n] pin
defsym({AFIO_EXTICR_EXTI_PF},               5)  dnl PF[n] pin
defsym({AFIO_EXTICR_EXTI_PG},               6)  dnl PG[n] pin

dnl ******************  Bit definition for AFIO_MAPR2 register  ******************
defsym({AFIO_MAPR2_TIM15_REMAP},            0x00000001)         dnl TIM15 remapping
defsym({AFIO_MAPR2_TIM16_REMAP},            0x00000002)         dnl TIM16 remapping
defsym({AFIO_MAPR2_TIM17_REMAP},            0x00000004)         dnl TIM17 remapping
defsym({AFIO_MAPR2_CEC_REMAP},              0x00000008)         dnl CEC remapping
defsym({AFIO_MAPR2_TIM1_DMA_REMAP},         0x00000010)         dnl TIM1_DMA remapping
defsym({AFIO_MAPR2_TIM9_REMAP},             0x00000020)         dnl TIM9 remapping
defsym({AFIO_MAPR2_TIM10_REMAP},            0x00000040)         dnl TIM10 remapping
defsym({AFIO_MAPR2_TIM11_REMAP},            0x00000080)         dnl TIM11 remapping
defsym({AFIO_MAPR2_TIM13_REMAP},            0x00000100)         dnl TIM13 remapping
defsym({AFIO_MAPR2_TIM14_REMAP},            0x00000200)         dnl TIM14 remapping
defsym({AFIO_MAPR2_FSMC_NADV_REMAP},        0x00000400)         dnl FSMC NADV remapping
defsym({AFIO_MAPR2_TIM67_DAC_DMA_REMAP},    0x00000800)         dnl TIM6/TIM7 and DAC DMA remapping
defsym({AFIO_MAPR2_TIM12_REMAP},            0x00001000)         dnl TIM12 remapping
defsym({AFIO_MAPR2_MISC_REMAP},             0x00002000)         dnl Miscellaneous remapping

dnl ******************************************************************************
dnl
dnl                               SystemTick
dnl
dnl ******************************************************************************

dnl *****************  Bit definition for SysTick_CTRL register  *****************
defsym({SysTick_CTRL_ENABLE},               0x00000001)         dnl Counter enable
defsym({SysTick_CTRL_TICKINT},              0x00000002)         dnl Counting down to 0 pends the SysTick handler
defsym({SysTick_CTRL_CLKSOURCE},            0x00000004)         dnl Clock source
defsym({SysTick_CTRL_COUNTFLAG},            0x00010000)         dnl Count Flag

dnl *****************  Bit definition for SysTick_LOAD register  *****************
defsym({SysTick_LOAD_RELOAD},               0x00FFFFFF)         dnl Value to load into the SysTick Current Value Register when the counter reaches 0

dnl *****************  Bit definition for SysTick_VAL register  ******************
defmask({SysTick_VAL_CURRENT},              0, 24)              dnl Current value at the time the register is accessed

dnl *****************  Bit definition for SysTick_CALIB register  ****************
defmask({SysTick_CALIB_TENMS},              0, 24)              dnl Reload value to use for 10ms timing
defsym({SysTick_CALIB_SKEW},                0x40000000)         dnl Calibration value is not exactly 10 ms
defsym({SysTick_CALIB_NOREF},               0x80000000)         dnl The reference clock is not provided

dnl ******************************************************************************
dnl
dnl                  Nested Vectored Interrupt Controller
dnl
dnl ******************************************************************************

dnl ******************  Bit definition for NVIC_PRI0 register  *******************
defmask({NVIC_IPR0_PRI_0},                  0, 8)               dnl Priority of interrupt 0
defmask({NVIC_IPR0_PRI_1},                  8, 8)               dnl Priority of interrupt 1
defmask({NVIC_IPR0_PRI_2},                  16, 8)              dnl Priority of interrupt 2
defmask({NVIC_IPR0_PRI_3},                  24, 8)              dnl Priority of interrupt 3
dnl ******************  Bit definition for NVIC_PRI1 register  *******************
defmask({NVIC_IPR1_PRI_4},                  0, 8)               dnl Priority of interrupt 4
defmask({NVIC_IPR1_PRI_5},                  8, 8)               dnl Priority of interrupt 5
defmask({NVIC_IPR1_PRI_6},                  16, 8)              dnl Priority of interrupt 6
defmask({NVIC_IPR1_PRI_7},                  24, 8)              dnl Priority of interrupt 7
dnl ******************  Bit definition for NVIC_PRI2 register  *******************
defmask({NVIC_IPR2_PRI_8},                  0, 8)               dnl Priority of interrupt 8
defmask({NVIC_IPR2_PRI_9},                  8, 8)               dnl Priority of interrupt 9
defmask({NVIC_IPR2_PRI_10},                 16, 8)              dnl Priority of interrupt 10
defmask({NVIC_IPR2_PRI_11},                 24, 8)              dnl Priority of interrupt 11
dnl ******************  Bit definition for NVIC_PRI3 register  *******************
defmask({NVIC_IPR3_PRI_12},                 0, 8)               dnl Priority of interrupt 12
defmask({NVIC_IPR3_PRI_13},                 8, 8)               dnl Priority of interrupt 13
defmask({NVIC_IPR3_PRI_14},                 16, 8)              dnl Priority of interrupt 14
defmask({NVIC_IPR3_PRI_15},                 24, 8)              dnl Priority of interrupt 15
dnl ******************  Bit definition for NVIC_PRI4 register  *******************
defmask({NVIC_IPR4_PRI_16},                 0, 8)               dnl Priority of interrupt 16
defmask({NVIC_IPR4_PRI_17},                 8, 8)               dnl Priority of interrupt 17
defmask({NVIC_IPR4_PRI_18},                 16, 8)              dnl Priority of interrupt 18
defmask({NVIC_IPR4_PRI_19},                 24, 8)              dnl Priority of interrupt 19
dnl ******************  Bit definition for NVIC_PRI5 register  *******************
defmask({NVIC_IPR5_PRI_20},                 0, 8)               dnl Priority of interrupt 20
defmask({NVIC_IPR5_PRI_21},                 8, 8)               dnl Priority of interrupt 21
defmask({NVIC_IPR5_PRI_22},                 16, 8)              dnl Priority of interrupt 22
defmask({NVIC_IPR5_PRI_23},                 24, 8)              dnl Priority of interrupt 23
dnl ******************  Bit definition for NVIC_PRI6 register  *******************
defmask({NVIC_IPR6_PRI_24},                 0, 8)               dnl Priority of interrupt 24
defmask({NVIC_IPR6_PRI_25},                 8, 8)               dnl Priority of interrupt 25
defmask({NVIC_IPR6_PRI_26},                 16, 8)              dnl Priority of interrupt 26
defmask({NVIC_IPR6_PRI_27},                 24, 8)              dnl Priority of interrupt 27
dnl ******************  Bit definition for NVIC_PRI7 register  *******************
defmask({NVIC_IPR7_PRI_28},                 0, 8)               dnl Priority of interrupt 28
defmask({NVIC_IPR7_PRI_29},                 8, 8)               dnl Priority of interrupt 29
defmask({NVIC_IPR7_PRI_30},                 16, 8)              dnl Priority of interrupt 30
defmask({NVIC_IPR7_PRI_31},                 24, 8)              dnl Priority of interrupt 31

dnl ******************  Bit definition for SCB_CPUID register  *******************
defmask({SCB_CPUID_REVISION},               0, 4)               dnl Implementation defined revision number
defmask({SCB_CPUID_PARTNO},                 4, 12)              dnl Number of processor within family
defmask({SCB_CPUID_Constant},               16, 4)              dnl Reads as 0x0F
defmask({SCB_CPUID_VARIANT},                20, 4)              dnl Implementation defined variant number
defmask({SCB_CPUID_IMPLEMENTER},            24, 8)              dnl Implementer code. ARM is 0x41

dnl *******************  Bit definition for SCB_ICSR register  *******************
defmask({SCB_ICSR_VECTACTIVE},              0, 9)               dnl Active ISR number field
defsym({SCB_ICSR_RETTOBASE},                0x00000800)         dnl All active exceptions minus the IPSR_current_exception yields the empty set
defmask({SCB_ICSR_VECTPENDING},             12, 10)             dnl Pending ISR number field
defsym({SCB_ICSR_ISRPENDING},               0x00400000)         dnl Interrupt pending flag
defsym({SCB_ICSR_ISRPREEMPT},               0x00800000)         dnl It indicates that a pending interrupt becomes active in the next running cycle
defsym({SCB_ICSR_PENDSTCLR},                0x02000000)         dnl Clear pending SysTick bit
defsym({SCB_ICSR_PENDSTSET},                0x04000000)         dnl Set pending SysTick bit
defsym({SCB_ICSR_PENDSVCLR},                0x08000000)         dnl Clear pending pendSV bit
defsym({SCB_ICSR_PENDSVSET},                0x10000000)         dnl Set pending pendSV bit
defsym({SCB_ICSR_NMIPENDSET},               0x80000000)         dnl Set pending NMI bit

dnl *******************  Bit definition for SCB_VTOR register  *******************
defmask({SCB_VTOR_TBLOFF},                  7, 22)              dnl Vector table base offset field
defsym({SCB_VTOR_TBLBASE},                  0x20000000)         dnl Table base in code(0) or RAM(1)

dnl*****************  Bit definition for SCB_AIRCR register  ******************
defsym({SCB_AIRCR_VECTRESET},               0x00000001)         dnl System Reset bit
defsym({SCB_AIRCR_VECTCLRACTIVE},           0x00000002)         dnl Clear active vector bit
defsym({SCB_AIRCR_SYSRESETREQ},             0x00000004)         dnl Requests chip control logic to generate a reset
defmask({SCB_AIRCR_PRIGROUP},               8, 3)               dnl PRIGROUP[2:0] bits (Priority group)
defsym({SCB_AIRCR_ENDIANESS},               0x00008000)         dnl Data endianness bit
defmask({SCB_AIRCR_VECTKEY},                16, 16)             dnl Register key (VECTKEY) - Reads as 0xFA05 (VECTKEYSTAT)

dnl *******************  Bit definition for SCB_SCR register  ********************
defsym({SCB_SCR_SLEEPONEXIT},               0x02)               dnl Sleep on exit bit
defsym({SCB_SCR_SLEEPDEEP},                 0x04)               dnl Sleep deep bit
defsym({SCB_SCR_SEVONPEND},                 0x10)               dnl Wake up from WFE

dnl ********************  Bit definition for SCB_CCR register  *******************
defsym({SCB_CCR_NONBASETHRDENA},            0x0001)             dnl Thread mode can be entered from any level in Handler mode by controlled return value
defsym({SCB_CCR_USERSETMPEND},              0x0002)             dnl Enables user code to write the Software Trigger Interrupt register to trigger (pend) a Main exception
defsym({SCB_CCR_UNALIGN_TRP},               0x0008)             dnl Trap for unaligned access
defsym({SCB_CCR_DIV_0_TRP},                 0x0010)             dnl Trap on Divide by 0
defsym({SCB_CCR_BFHFNMIGN},                 0x0100)             dnl Handlers running at priority -1 and -2
defsym({SCB_CCR_STKALIGN},                  0x0200)             dnl On exception entry, the SP used prior to the exception is adjusted to be 8-byte aligned

dnl ******************  Bit definition for SCB_SHCSR register  *******************
defsym({SCB_SHCSR_MEMFAULTACT},             0x00000001)         dnl MemManage is active
defsym({SCB_SHCSR_BUSFAULTACT},             0x00000002)         dnl BusFault is active
defsym({SCB_SHCSR_USGFAULTACT},             0x00000008)         dnl UsageFault is active
defsym({SCB_SHCSR_SVCALLACT},               0x00000080)         dnl SVCall is active
defsym({SCB_SHCSR_MONITORACT},              0x00000100)         dnl Monitor is active
defsym({SCB_SHCSR_PENDSVACT},               0x00000400)         dnl PendSV is active
defsym({SCB_SHCSR_SYSTICKACT},              0x00000800)         dnl SysTick is active
defsym({SCB_SHCSR_USGFAULTPENDED},          0x00001000)         dnl Usage Fault is pended
defsym({SCB_SHCSR_MEMFAULTPENDED},          0x00002000)         dnl MemManage is pended
defsym({SCB_SHCSR_BUSFAULTPENDED},          0x00004000)         dnl Bus Fault is pended
defsym({SCB_SHCSR_SVCALLPENDED},            0x00008000)         dnl SVCall is pended
defsym({SCB_SHCSR_MEMFAULTENA},             0x00010000)         dnl MemManage enable
defsym({SCB_SHCSR_BUSFAULTENA},             0x00020000)         dnl Bus Fault enable
defsym({SCB_SHCSR_USGFAULTENA},             0x00040000)         dnl UsageFault enable

dnl *******************  Bit definition for SCB_CFSR register  *******************
defsym({SCB_CFSR_IACCVIOL},                 0x00000001)         dnl Instruction access violation
defsym({SCB_CFSR_DACCVIOL},                 0x00000002)         dnl Data access violation
defsym({SCB_CFSR_MUNSTKERR},                0x00000008)         dnl Unstacking error
defsym({SCB_CFSR_MSTKERR},                  0x00000010)         dnl Stacking error
defsym({SCB_CFSR_MMARVALID},                0x00000080)         dnl Memory Manage Address Register address valid flag
defsym({SCB_CFSR_IBUSERR},                  0x00000100)         dnl Instruction bus error flag
defsym({SCB_CFSR_PRECISERR},                0x00000200)         dnl Precise data bus error
defsym({SCB_CFSR_IMPRECISERR},              0x00000400)         dnl Imprecise data bus error
defsym({SCB_CFSR_UNSTKERR},                 0x00000800)         dnl Unstacking error
defsym({SCB_CFSR_STKERR},                   0x00001000)         dnl Stacking error
defsym({SCB_CFSR_BFARVALID},                0x00008000)         dnl Bus Fault Address Register address valid flag
defsym({SCB_CFSR_UNDEFINSTR},               0x00010000)         dnl The processor attempt to execute an undefined instruction
defsym({SCB_CFSR_INVSTATE},                 0x00020000)         dnl Invalid combination of EPSR and instruction
defsym({SCB_CFSR_INVPC},                    0x00040000)         dnl Attempt to load EXC_RETURN into pc illegally
defsym({SCB_CFSR_NOCP},                     0x00080000)         dnl Attempt to use a coprocessor instruction
defsym({SCB_CFSR_UNALIGNED},                0x01000000)         dnl Fault occurs when there is an attempt to make an unaligned memory access
defsym({SCB_CFSR_DIVBYZERO},                0x02000000)         dnl Fault occurs when SDIV or DIV instruction is used with a divisor of 0

dnl *******************  Bit definition for SCB_HFSR register  *******************
defsym({SCB_HFSR_VECTTBL},                  0x00000002)         dnl Fault occurs because of vector table read on exception processing
defsym({SCB_HFSR_FORCED},                   0x40000000)         dnl Hard Fault activated when a configurable Fault was received and cannot activate
defsym({SCB_HFSR_DEBUGEVT},                 0x80000000)         dnl Fault related to debug

dnl *******************  Bit definition for SCB_DFSR register  *******************
defsym({SCB_DFSR_HALTED},                   0x01)               dnl Halt request flag
defsym({SCB_DFSR_BKPT},                     0x02)               dnl BKPT flag
defsym({SCB_DFSR_DWTTRAP},                  0x04)               dnl Data Watchpoint and Trace (DWT) flag
defsym({SCB_DFSR_VCATCH},                   0x08)               dnl Vector catch flag
defsym({SCB_DFSR_EXTERNAL},                 0x10)               dnl External debug request flag

dnl *******************  Bit definition for SCB_MMFAR register  ******************
defmask({SCB_MMFAR_ADDRESS},                0, 32)              dnl Mem Manage fault address field

dnl *******************  Bit definition for SCB_BFAR register  *******************
defmask({SCB_BFAR_ADDRESS},                 0, 32)              dnl Bus fault address field

dnl *******************  Bit definition for SCB_afsr register  *******************
defmask({SCB_AFSR_IMPDEF},                  0, 32)              dnl Implementation defined

dnl ******************************************************************************
dnl
dnl                             DMA Controller
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for DMA_ISR and DMA_IFCR registers  ********************
defsym({DMA_IR_GIF1},                       0x00000001)         dnl Channel 1 Global interrupt flag
defsym({DMA_IR_TCIF1},                      0x00000002)         dnl Channel 1 Transfer Complete flag
defsym({DMA_IR_HTIF1},                      0x00000004)         dnl Channel 1 Half Transfer flag
defsym({DMA_IR_TEIF1},                      0x00000008)         dnl Channel 1 Transfer Error flag
defsym({DMA_IR_GIF2},                       0x00000010)         dnl Channel 2 Global interrupt flag
defsym({DMA_IR_TCIF2},                      0x00000020)         dnl Channel 2 Transfer Complete flag
defsym({DMA_IR_HTIF2},                      0x00000040)         dnl Channel 2 Half Transfer flag
defsym({DMA_IR_TEIF2},                      0x00000080)         dnl Channel 2 Transfer Error flag
defsym({DMA_IR_GIF3},                       0x00000100)         dnl Channel 3 Global interrupt flag
defsym({DMA_IR_TCIF3},                      0x00000200)         dnl Channel 3 Transfer Complete flag
defsym({DMA_IR_HTIF3},                      0x00000400)         dnl Channel 3 Half Transfer flag
defsym({DMA_IR_TEIF3},                      0x00000800)         dnl Channel 3 Transfer Error flag
defsym({DMA_IR_GIF4},                       0x00001000)         dnl Channel 4 Global interrupt flag
defsym({DMA_IR_TCIF4},                      0x00002000)         dnl Channel 4 Transfer Complete flag
defsym({DMA_IR_HTIF4},                      0x00004000)         dnl Channel 4 Half Transfer flag
defsym({DMA_IR_TEIF4},                      0x00008000)         dnl Channel 4 Transfer Error flag
defsym({DMA_IR_GIF5},                       0x00010000)         dnl Channel 5 Global interrupt flag
defsym({DMA_IR_TCIF5},                      0x00020000)         dnl Channel 5 Transfer Complete flag
defsym({DMA_IR_HTIF5},                      0x00040000)         dnl Channel 5 Half Transfer flag
defsym({DMA_IR_TEIF5},                      0x00080000)         dnl Channel 5 Transfer Error flag
defsym({DMA_IR_GIF6},                       0x00100000)         dnl Channel 6 Global interrupt flag
defsym({DMA_IR_TCIF6},                      0x00200000)         dnl Channel 6 Transfer Complete flag
defsym({DMA_IR_HTIF6},                      0x00400000)         dnl Channel 6 Half Transfer flag
defsym({DMA_IR_TEIF6},                      0x00800000)         dnl Channel 6 Transfer Error flag
defsym({DMA_IR_GIF7},                       0x01000000)         dnl Channel 7 Global interrupt flag
defsym({DMA_IR_TCIF7},                      0x02000000)         dnl Channel 7 Transfer Complete flag
defsym({DMA_IR_HTIF7},                      0x04000000)         dnl Channel 7 Half Transfer flag
defsym({DMA_IR_TEIF7},                      0x08000000)         dnl Channel 7 Transfer Error flag

dnl *******************  Bit definition for DMA_CCRn register  *******************
defsym({DMA_CCR_EN},                        0x0001)             dnl Channel enable
defsym({DMA_CCR_TCIE},                      0x0002)             dnl Transfer complete interrupt enable
defsym({DMA_CCR_HTIE},                      0x0004)             dnl Half Transfer interrupt enable
defsym({DMA_CCR_TEIE},                      0x0008)             dnl Transfer error interrupt enable
defsym({DMA_CCR_DIR},                       0x0010)             dnl Data transfer direction
defsym({DMA_CCR_CIRC},                      0x0020)             dnl Circular mode
defsym({DMA_CCR_PINC},                      0x0040)             dnl Peripheral increment mode
defsym({DMA_CCR_MINC},                      0x0080)             dnl Memory increment mode
defmask({DMA_CCR_PSIZE},                    8, 2)               dnl PSIZE[1:0] bits (Peripheral size)
defmask({DMA_CCR_MSIZE},                    10, 2)              dnl MSIZE[1:0] bits (Memory size)
defmask({DMA_CCR_PL},                       12, 2)              dnl PL[1:0] bits (Channel Priority level)
defsym({DMA_CCR_MEM2MEM},                   0x4000)             dnl Memory to memory mode enable

dnl ******************  Bit definition for DMA_CNDTRn register  ******************
defmask({DMA_CNDTR_NDT},                    0, 16)              dnl Number of data to Transfer

dnl ******************  Bit definition for DMA_CPARn register  *******************
defmask({DMA_CPAR_PA},                      0, 32)              dnl Peripheral Address

dnl ******************  Bit definition for DMA_CMARn register  *******************
defmask({DMA_CMAR_MA},                      0, 32)              dnl Memory Address

dnl ******************************************************************************
dnl
dnl                        Analog to Digital Converter
dnl
dnl ******************************************************************************

dnl ********************  Bit definition for ADC_SR register  ********************
defsym({ADC_SR_AWD},                        0x01)               dnl Analog watchdog flag
defsym({ADC_SR_EOC},                        0x02)               dnl End of conversion
defsym({ADC_SR_JEOC},                       0x04)               dnl Injected channel end of conversion
defsym({ADC_SR_JSTRT},                      0x08)               dnl Injected channel Start flag
defsym({ADC_SR_STRT},                       0x10)               dnl Regular channel Start flag

dnl *******************  Bit definition for ADC_CR1 register  ********************
defmask({ADC_CR1_AWDCH},                    0, 5)               dnl AWDCH[4:0] bits (Analog watchdog channel select bits)
defsym({ADC_CR1_EOCIE},                     0x00000020)         dnl Interrupt enable for EOC
defsym({ADC_CR1_AWDIE},                     0x00000040)         dnl Analog Watchdog interrupt enable
defsym({ADC_CR1_JEOCIE},                    0x00000080)         dnl Interrupt enable for injected channels
defsym({ADC_CR1_SCAN},                      0x00000100)         dnl Scan mode
defsym({ADC_CR1_AWDSGL},                    0x00000200)         dnl Enable the watchdog on a single channel in scan mode
defsym({ADC_CR1_JAUTO},                     0x00000400)         dnl Automatic injected group conversion
defsym({ADC_CR1_DISCEN},                    0x00000800)         dnl Discontinuous mode on regular channels
defsym({ADC_CR1_JDISCEN},                   0x00001000)         dnl Discontinuous mode on injected channels
defmask({ADC_CR1_DISCNUM},                  13, 3)              dnl DISCNUM[2:0] bits (Discontinuous mode channel count)
defmask({ADC_CR1_DUALMOD},                  16, 4)              dnl DUALMOD[3:0] bits (Dual mode selection)
defsym({ADC_CR1_JAWDEN},                    0x00400000)         dnl Analog watchdog enable on injected channels
defsym({ADC_CR1_AWDEN},                     0x00800000)         dnl Analog watchdog enable on regular channels

dnl *******************  Bit definition for ADC_CR2 register  ********************
defsym({ADC_CR2_ADON},                      0x00000001)         dnl A/D Converter ON / OFF
defsym({ADC_CR2_CONT},                      0x00000002)         dnl Continuous Conversion
defsym({ADC_CR2_CAL},                       0x00000004)         dnl A/D Calibration
defsym({ADC_CR2_RSTCAL},                    0x00000008)         dnl Reset Calibration
defsym({ADC_CR2_DMA},                       0x00000100)         dnl Direct Memory access mode
defsym({ADC_CR2_ALIGN},                     0x00000800)         dnl Data Alignment
defmask({ADC_CR2_JEXTSEL},                  12, 3)              dnl JEXTSEL[2:0] bits (External event select for injected group)
defsym({ADC_CR2_JEXTTRIG},                  0x00008000)         dnl External Trigger Conversion mode for injected channels
defmask({ADC_CR2_EXTSEL},                   17, 3)              dnl EXTSEL[2:0] bits (External Event Select for regular group)
defsym({ADC_CR2_EXTTRIG},                   0x00100000)         dnl External Trigger Conversion mode for regular channels
defsym({ADC_CR2_JSWSTART},                  0x00200000)         dnl Start Conversion of injected channels
defsym({ADC_CR2_SWSTART},                   0x00400000)         dnl Start Conversion of regular channels
defsym({ADC_CR2_TSVREFE},                   0x00800000)         dnl Temperature Sensor and VREFINT Enable

dnl ******************  Bit definition for ADC_SMPR1 register  *******************
defmask({ADC_SMPR1_SMP10},                  0, 3)               dnl SMP10[2:0] bits (Channel 10 Sample time selection)
defmask({ADC_SMPR1_SMP11},                  3, 3)               dnl SMP11[2:0] bits (Channel 11 Sample time selection)
defmask({ADC_SMPR1_SMP12},                  6, 3)               dnl SMP12[2:0] bits (Channel 12 Sample time selection)
defmask({ADC_SMPR1_SMP13},                  9, 3)               dnl SMP13[2:0] bits (Channel 13 Sample time selection)
defmask({ADC_SMPR1_SMP14},                  12, 3)              dnl SMP14[2:0] bits (Channel 14 Sample time selection)
defmask({ADC_SMPR1_SMP15},                  15, 3)              dnl SMP15[2:0] bits (Channel 15 Sample time selection)
defmask({ADC_SMPR1_SMP16},                  18, 3)              dnl SMP16[2:0] bits (Channel 16 Sample time selection)
defmask({ADC_SMPR1_SMP17},                  21, 3)              dnl SMP17[2:0] bits (Channel 17 Sample time selection)

dnl ******************  Bit definition for ADC_SMPR2 register  *******************
defmask({ADC_SMPR2_SMP0},                   0, 3)               dnl SMP0[2:0] bits (Channel 0 Sample time selection)
defmask({ADC_SMPR2_SMP1},                   3, 3)               dnl SMP1[2:0] bits (Channel 1 Sample time selection)
defmask({ADC_SMPR2_SMP2},                   6, 3)               dnl SMP2[2:0] bits (Channel 2 Sample time selection)
defmask({ADC_SMPR2_SMP3},                   9, 3)               dnl SMP3[2:0] bits (Channel 3 Sample time selection)
defmask({ADC_SMPR2_SMP4},                   12, 3)              dnl SMP4[2:0] bits (Channel 4 Sample time selection)
defmask({ADC_SMPR2_SMP5},                   15, 3)              dnl SMP5[2:0] bits (Channel 5 Sample time selection)
defmask({ADC_SMPR2_SMP6},                   18, 3)              dnl SMP6[2:0] bits (Channel 6 Sample time selection)
defmask({ADC_SMPR2_SMP7},                   21, 3)              dnl SMP7[2:0] bits (Channel 7 Sample time selection)
defmask({ADC_SMPR2_SMP8},                   24, 3)              dnl SMP8[2:0] bits (Channel 8 Sample time selection)
defmask({ADC_SMPR2_SMP9},                   27, 3)              dnl SMP9[2:0] bits (Channel 9 Sample time selection)

dnl ******************  Bit definition for ADC_JOFRn register  *******************
defmask({ADC_JOFR_JOFFSET},                 0, 12)              dnl Data offset for injected channel 4

dnl *******************  Bit definition for ADC_HTR register  ********************
defmask({ADC_HTR_HT},                       0, 12)              dnl Analog watchdog high threshold

dnl *******************  Bit definition for ADC_LTR register  ********************
defmask({ADC_LTR_LT},                       0, 12)              dnl Analog watchdog low threshold

dnl *******************  Bit definition for ADC_SQR1 register  *******************
defmask({ADC_SQR1_SQ13},                    0, 5)               dnl SQ13[4:0] bits (13th conversion in regular sequence)
defmask({ADC_SQR1_SQ14},                    5, 5)               dnl SQ14[4:0] bits (14th conversion in regular sequence)
defmask({ADC_SQR1_SQ15},                    10, 5)              dnl SQ15[4:0] bits (15th conversion in regular sequence)
defmask({ADC_SQR1_SQ16},                    15, 5)              dnl SQ16[4:0] bits (16th conversion in regular sequence)
defmask({ADC_SQR1_L},                       20, 4)              dnl L[3:0] bits (Regular channel sequence length)

dnl *******************  Bit definition for ADC_SQR2 register  *******************
defmask({ADC_SQR2_SQ7},                     0, 5)               dnl SQ7[4:0] bits (7th conversion in regular sequence)
defmask({ADC_SQR2_SQ8},                     5, 5)               dnl SQ8[4:0] bits (8th conversion in regular sequence)
defmask({ADC_SQR2_SQ9},                     10, 5)              dnl SQ9[4:0] bits (9th conversion in regular sequence)
defmask({ADC_SQR2_SQ10},                    15, 5)              dnl SQ10[4:0] bits (10th conversion in regular sequence)
defmask({ADC_SQR2_SQ11},                    20, 5)              dnl SQ11[4:0] bits (11th conversion in regular sequence)
defmask({ADC_SQR2_SQ12},                    25, 5)              dnl SQ12[4:0] bits (12th conversion in regular sequence)

dnl *******************  Bit definition for ADC_SQR3 register  *******************
defmask({ADC_SQR3_SQ1},                     0, 5)               dnl SQ1[4:0] bits (1st conversion in regular sequence)
defmask({ADC_SQR3_SQ2},                     5, 5)               dnl SQ2[4:0] bits (2nd conversion in regular sequence)
defmask({ADC_SQR3_SQ3},                     10, 5)              dnl SQ3[4:0] bits (3rd conversion in regular sequence)
defmask({ADC_SQR3_SQ4},                     15, 5)              dnl SQ4[4:0] bits (4th conversion in regular sequence)
defmask({ADC_SQR3_SQ5},                     20, 5)              dnl SQ5[4:0] bits (5th conversion in regular sequence)
defmask({ADC_SQR3_SQ6},                     25, 5)              dnl SQ6[4:0] bits (6th conversion in regular sequence)

dnl *******************  Bit definition for ADC_JSQR register  *******************
defmask({ADC_JSQR_JSQ1},                    0, 5)               dnl JSQ1[4:0] bits (1st conversion in injected sequence)
defmask({ADC_JSQR_JSQ2},                    5, 5)               dnl JSQ2[4:0] bits (2nd conversion in injected sequence)
defmask({ADC_JSQR_JSQ3},                    10, 5)              dnl JSQ3[4:0] bits (3rd conversion in injected sequence)
defmask({ADC_JSQR_JSQ4},                    15, 5)              dnl JSQ4[4:0] bits (4th conversion in injected sequence)
defmask({ADC_JSQR_JL},                      20, 2)              dnl JL[1:0] bits (Injected Sequence length)

dnl *******************  Bit definition for ADC_JDRn register  *******************
defmask({ADC_JDR_JDATA},                    0, 16)              dnl Injected data

dnl ********************  Bit definition for ADC_DR register  ********************
defmask({ADC_DR_DATA},                      0, 16)              dnl Regular data
defmask({ADC_DR_ADC2DATA},                  16, 16)             dnl ADC2 data

dnl ******************************************************************************
dnl
dnl                      Digital to Analog Converter
dnl
dnl ******************************************************************************

dnl ********************  Bit definition for DAC_CR register  ********************
defsym({DAC_CR_EN1},                        0x00000001)         dnl DAC channel1 enable
defsym({DAC_CR_BOFF1},                      0x00000002)         dnl DAC channel1 output buffer disable
defsym({DAC_CR_TEN1},                       0x00000004)         dnl DAC channel1 Trigger enable
defmask({DAC_CR_TSEL1},                     3, 3)               dnl TSEL1[2:0] (DAC channel1 Trigger selection)
defmask({DAC_CR_WAVE1},                     6, 2)               dnl WAVE1[1:0] (DAC channel1 noise/triangle wave generation enable)
defmask({DAC_CR_MAMP1},                     8, 4)               dnl MAMP1[3:0] (DAC channel1 Mask/Amplitude selector)
defsym({DAC_CR_DMAEN1},                     0x00001000)         dnl DAC channel1 DMA enable

defsym({DAC_CR_EN2},                        0x00010000)         dnl DAC channel2 enable
defsym({DAC_CR_BOFF2},                      0x00020000)         dnl DAC channel2 output buffer disable
defsym({DAC_CR_TEN2},                       0x00040000)         dnl DAC channel2 Trigger enable
defmask({DAC_CR_TSEL2},                     19, 3)              dnl TSEL2[2:0] (DAC channel2 Trigger selection)
defmask({DAC_CR_WAVE2},                     22, 2)              dnl WAVE2[1:0] (DAC channel2 noise/triangle wave generation enable)
defmask({DAC_CR_MAMP2},                     24, 4)              dnl MAMP2[3:0] (DAC channel2 Mask/Amplitude selector)
defsym({DAC_CR_DMAEN2},                     0x10000000)         dnl DAC channel2 DMA enabled

dnl *****************  Bit definition for DAC_SWTRIGR register  ******************
defsym({DAC_SWTRIGR_SWTRIG1},               0x01)               dnl DAC channel1 software trigger
defsym({DAC_SWTRIGR_SWTRIG2},               0x02)               dnl DAC channel2 software trigger

dnl *****************  Bit definition for DAC_DHR12Rn register  ******************
defmask({DAC_DHR12R_DACCDHR},               0, 12)              dnl DAC channelN 12-bit Right aligned data

dnl *****************  Bit definition for DAC_DHR12Ln register  ******************
defmask({DAC_DHR12L_DACCDHR},               4, 12)              dnl DAC channelN 12-bit Left aligned data

dnl ******************  Bit definition for DAC_DHR8Rn register  ******************
defmask({DAC_DHR8R_DACCDHR},                0, 8)               dnl DAC channelN 8-bit Right aligned data

dnl *****************  Bit definition for DAC_DHR12RD register  ******************
defmask({DAC_DHR12RD_DACC1DHR},             0, 12)              dnl DAC channel1 12-bit Right aligned data
defmask({DAC_DHR12RD_DACC2DHR},             16, 12)             dnl DAC channel2 12-bit Right aligned data

dnl *****************  Bit definition for DAC_DHR12LD register  ******************
defmask({DAC_DHR12LD_DACC1DHR},             4, 12)              dnl DAC channel1 12-bit Left aligned data
defmask({DAC_DHR12LD_DACC2DHR},             20, 12)             dnl DAC channel2 12-bit Left aligned data

dnl ******************  Bit definition for DAC_DHR8RD register  ******************
defmask({DAC_DHR8RD_DACC1DHR},              0, 8)               dnl DAC channel1 8-bit Right aligned data
defmask({DAC_DHR8RD_DACC2DHR},              8, 8)               dnl DAC channel2 8-bit Right aligned data

dnl *******************  Bit definition for DAC_DORn register  *******************
defmask({DAC_DOR_DACCDOR},                  0, 12)              dnl DAC channelN data output

dnl ********************  Bit definition for DAC_SR register  ********************
defsym({DAC_SR_DMAUDR1},                    0x00002000)         dnl DAC channel1 DMA underrun flag
defsym({DAC_SR_DMAUDR2},                    0x20000000)         dnl DAC channel2 DMA underrun flag

dnl ******************************************************************************
dnl
dnl                                    CEC
dnl
dnl ******************************************************************************
dnl ********************  Bit definition for CEC_CFGR register  ******************
defsym({CEC_CFGR_PE},                       0x0001)             dnl  Peripheral Enable
defsym({CEC_CFGR_IE},                       0x0002)             dnl  Interrupt Enable
defsym({CEC_CFGR_BTEM},                     0x0004)             dnl  Bit Timing Error Mode
defsym({CEC_CFGR_BPEM},                     0x0008)             dnl  Bit Period Error Mode

dnl ********************  Bit definition for CEC_OAR register  ******************
defsym({CEC_OAR_OA},                        0x000F)             dnl  OA[3:0]: Own Address
defsym({CEC_OAR_OA_0},                      0x0001)             dnl  Bit 0
defsym({CEC_OAR_OA_1},                      0x0002)             dnl  Bit 1
defsym({CEC_OAR_OA_2},                      0x0004)             dnl  Bit 2
defsym({CEC_OAR_OA_3},                      0x0008)             dnl  Bit 3

dnl ********************  Bit definition for CEC_PRES register  ******************
defmask({CEC_PRES_PRES},                    0, 14)              dnl  Prescaler Counter Value

dnl ********************  Bit definition for CEC_ESR register  ******************
defsym({CEC_ESR_BTE},                       0x0001)             dnl  Bit Timing Error
defsym({CEC_ESR_BPE},                       0x0002)             dnl  Bit Period Error
defsym({CEC_ESR_RBTFE},                     0x0004)             dnl  Rx Block Transfer Finished Error
defsym({CEC_ESR_SBE},                       0x0008)             dnl  Start Bit Error
defsym({CEC_ESR_ACKE},                      0x0010)             dnl  Block Acknowledge Error
defsym({CEC_ESR_LINE},                      0x0020)             dnl  Line Error
defsym({CEC_ESR_TBTFE},                     0x0040)             dnl  Tx Block Transfer Finished Error

dnl ********************  Bit definition for CEC_CSR register  ******************
defsym({CEC_CSR_TSOM},                      0x0001)             dnl  Tx Start Of Message
defsym({CEC_CSR_TEOM},                      0x0002)             dnl  Tx End Of Message
defsym({CEC_CSR_TERR},                      0x0004)             dnl  Tx Error
defsym({CEC_CSR_TBTRF},                     0x0008)             dnl  Tx Byte Transfer Request or Block Transfer Finished
defsym({CEC_CSR_RSOM},                      0x0010)             dnl  Rx Start Of Message
defsym({CEC_CSR_REOM},                      0x0020)             dnl  Rx End Of Message
defsym({CEC_CSR_RERR},                      0x0040)             dnl  Rx Error
defsym({CEC_CSR_RBTF},                      0x0080)             dnl  Rx Block Transfer Finished

dnl ********************  Bit definition for CEC_TXD register  ******************
defmask({CEC_TXD_TXD},                      0, 8)               dnl  Tx Data register

dnl ********************  Bit definition for CEC_RXD register  ******************
defmask({CEC_RXD_RXD},                      0, 8)               dnl  Rx Data register

dnl ******************************************************************************
dnl
dnl                                    TIM
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for TIM_CR1 register  ********************
defsym({TIM_CR1_CEN},                       0x0001)             dnl Counter enable
defsym({TIM_CR1_UDIS},                      0x0002)             dnl Update disable
defsym({TIM_CR1_URS},                       0x0004)             dnl Update request source
defsym({TIM_CR1_OPM},                       0x0008)             dnl One pulse mode
defsym({TIM_CR1_DIR},                       0x0010)             dnl Direction
defmask({TIM_CR1_CMS},                      5, 2)               dnl CMS[1:0] bits (Center-aligned mode selection)
defsym({TIM_CR1_ARPE},                      0x0080)             dnl Auto-reload preload enable
defmask({TIM_CR1_CKD},                      8, 2)               dnl CKD[1:0] bits (clock division)

dnl *******************  Bit definition for TIM_CR2 register  ********************
defsym({TIM_CR2_CCPC},                      0x0001)             dnl Capture/Compare Preloaded Control
defsym({TIM_CR2_CCUS},                      0x0004)             dnl Capture/Compare Control Update Selection
defsym({TIM_CR2_CCDS},                      0x0008)             dnl Capture/Compare DMA Selection
defmask({TIM_CR2_MMS},                      4, 3)               dnl MMS[2:0] bits (Master Mode Selection)
defsym({TIM_CR2_TI1S},                      0x0080)             dnl TI1 Selection
defsym({TIM_CR2_OIS1},                      0x0100)             dnl Output Idle state 1 (OC1 output)
defsym({TIM_CR2_OIS1N},                     0x0200)             dnl Output Idle state 1 (OC1N output)
defsym({TIM_CR2_OIS2},                      0x0400)             dnl Output Idle state 2 (OC2 output)
defsym({TIM_CR2_OIS2N},                     0x0800)             dnl Output Idle state 2 (OC2N output)
defsym({TIM_CR2_OIS3},                      0x1000)             dnl Output Idle state 3 (OC3 output)
defsym({TIM_CR2_OIS3N},                     0x2000)             dnl Output Idle state 3 (OC3N output)
defsym({TIM_CR2_OIS4},                      0x4000)             dnl Output Idle state 4 (OC4 output)

dnl *******************  Bit definition for TIM_SMCR register  *******************
defmask({TIM_SMCR_SMS},                     0, 3)               dnl SMS[2:0] bits (Slave mode selection)
defmask({TIM_SMCR_TS},                      4, 3)               dnl TS[2:0] bits (Trigger selection)
defsym({TIM_SMCR_MSM},                      0x0080)             dnl Master/slave mode
defmask({TIM_SMCR_ETF},                     8, 4)               dnl ETF[3:0] bits (External trigger filter)
defmask({TIM_SMCR_ETPS},                    12, 2)              dnl ETPS[1:0] bits (External trigger prescaler)
defsym({TIM_SMCR_ECE},                      0x4000)             dnl External clock enable
defsym({TIM_SMCR_ETP},                      0x8000)             dnl External trigger polarity

dnl *******************  Bit definition for TIM_DIER register  *******************
defsym({TIM_DIER_UIE},                      0x0001)             dnl Update interrupt enable
defsym({TIM_DIER_CC1IE},                    0x0002)             dnl Capture/Compare 1 interrupt enable
defsym({TIM_DIER_CC2IE},                    0x0004)             dnl Capture/Compare 2 interrupt enable
defsym({TIM_DIER_CC3IE},                    0x0008)             dnl Capture/Compare 3 interrupt enable
defsym({TIM_DIER_CC4IE},                    0x0010)             dnl Capture/Compare 4 interrupt enable
defsym({TIM_DIER_COMIE},                    0x0020)             dnl COM interrupt enable
defsym({TIM_DIER_TIE},                      0x0040)             dnl Trigger interrupt enable
defsym({TIM_DIER_BIE},                      0x0080)             dnl Break interrupt enable
defsym({TIM_DIER_UDE},                      0x0100)             dnl Update DMA request enable
defsym({TIM_DIER_CC1DE},                    0x0200)             dnl Capture/Compare 1 DMA request enable
defsym({TIM_DIER_CC2DE},                    0x0400)             dnl Capture/Compare 2 DMA request enable
defsym({TIM_DIER_CC3DE},                    0x0800)             dnl Capture/Compare 3 DMA request enable
defsym({TIM_DIER_CC4DE},                    0x1000)             dnl Capture/Compare 4 DMA request enable
defsym({TIM_DIER_COMDE},                    0x2000)             dnl COM DMA request enable
defsym({TIM_DIER_TDE},                      0x4000)             dnl Trigger DMA request enable

dnl ********************  Bit definition for TIM_SR register  ********************
defsym({TIM_SR_UIF},                        0x0001)             dnl Update interrupt Flag
defsym({TIM_SR_CC1IF},                      0x0002)             dnl Capture/Compare 1 interrupt Flag
defsym({TIM_SR_CC2IF},                      0x0004)             dnl Capture/Compare 2 interrupt Flag
defsym({TIM_SR_CC3IF},                      0x0008)             dnl Capture/Compare 3 interrupt Flag
defsym({TIM_SR_CC4IF},                      0x0010)             dnl Capture/Compare 4 interrupt Flag
defsym({TIM_SR_COMIF},                      0x0020)             dnl COM interrupt Flag
defsym({TIM_SR_TIF},                        0x0040)             dnl Trigger interrupt Flag
defsym({TIM_SR_BIF},                        0x0080)             dnl Break interrupt Flag
defsym({TIM_SR_CC1OF},                      0x0200)             dnl Capture/Compare 1 Overcapture Flag
defsym({TIM_SR_CC2OF},                      0x0400)             dnl Capture/Compare 2 Overcapture Flag
defsym({TIM_SR_CC3OF},                      0x0800)             dnl Capture/Compare 3 Overcapture Flag
defsym({TIM_SR_CC4OF},                      0x1000)             dnl Capture/Compare 4 Overcapture Flag

dnl *******************  Bit definition for TIM_EGR register  ********************
defsym({TIM_EGR_UG},                        0x01)               dnl Update Generation
defsym({TIM_EGR_CC1G},                      0x02)               dnl Capture/Compare 1 Generation
defsym({TIM_EGR_CC2G},                      0x04)               dnl Capture/Compare 2 Generation
defsym({TIM_EGR_CC3G},                      0x08)               dnl Capture/Compare 3 Generation
defsym({TIM_EGR_CC4G},                      0x10)               dnl Capture/Compare 4 Generation
defsym({TIM_EGR_COMG},                      0x20)               dnl Capture/Compare Control Update Generation
defsym({TIM_EGR_TG},                        0x40)               dnl Trigger Generation
defsym({TIM_EGR_BG},                        0x80)               dnl Break Generation

dnl ******************  Bit definition for TIM_CCMR1 register  *******************
defmask({TIM_CCMR1_CC1S},                   0, 2)               dnl CC1S[1:0] bits (Capture/Compare 1 Selection)
defsym({TIM_CCMR1_OC1FE},                   0x0004)             dnl Output Compare 1 Fast enable
defsym({TIM_CCMR1_OC1PE},                   0x0008)             dnl Output Compare 1 Preload enable
defmask({TIM_CCMR1_OC1M},                   4, 3)               dnl OC1M[2:0] bits (Output Compare 1 Mode)
defsym({TIM_CCMR1_OC1CE},                   0x0080)             dnl Output Compare 1Clear Enable

defmask({TIM_CCMR1_CC2S},                   8, 2)               dnl CC2S[1:0] bits (Capture/Compare 2 Selection)
defsym({TIM_CCMR1_OC2FE},                   0x0400)             dnl Output Compare 2 Fast enable
defsym({TIM_CCMR1_OC2PE},                   0x0800)             dnl Output Compare 2 Preload enable
defmask({TIM_CCMR1_OC2M},                   12, 3)              dnl OC2M[2:0] bits (Output Compare 2 Mode)
defsym({TIM_CCMR1_OC2CE},                   0x8000)             dnl Output Compare 2 Clear Enable

defmask({TIM_CCMR1_IC1PSC},                 2, 2)               dnl IC1PSC[1:0] bits (Input Capture 1 Prescaler)
defmask({TIM_CCMR1_IC1F},                   4, 4)               dnl IC1F[3:0] bits (Input Capture 1 Filter)
defmask({TIM_CCMR1_IC2PSC},                 10, 2)              dnl IC2PSC[1:0] bits (Input Capture 2 Prescaler)
defmask({TIM_CCMR1_IC2F},                   12, 4)              dnl IC2F[3:0] bits (Input Capture 2 Filter)

dnl ******************  Bit definition for TIM_CCMR2 register  *******************
defmask({TIM_CCMR2_CC3S},                   0, 2)               dnl CC3S[1:0] bits (Capture/Compare 3 Selection)
defsym({TIM_CCMR2_OC3FE},                   0x0004)             dnl Output Compare 3 Fast enable
defsym({TIM_CCMR2_OC3PE},                   0x0008)             dnl Output Compare 3 Preload enable
defmask({TIM_CCMR2_OC3M},                   4, 3)               dnl OC3M[2:0] bits (Output Compare 3 Mode)
defsym({TIM_CCMR2_OC3CE},                   0x0080)             dnl Output Compare 3 Clear Enable
defmask({TIM_CCMR2_CC4S},                   8, 2)               dnl CC4S[1:0] bits (Capture/Compare 4 Selection)
defsym({TIM_CCMR2_OC4FE},                   0x0400)             dnl Output Compare 4 Fast enable
defsym({TIM_CCMR2_OC4PE},                   0x0800)             dnl Output Compare 4 Preload enable
defmask({TIM_CCMR2_OC4M},                   12, 3)              dnl OC4M[2:0] bits (Output Compare 4 Mode)
defsym({TIM_CCMR2_OC4CE},                   0x8000)             dnl Output Compare 4 Clear Enable

defmask({TIM_CCMR2_IC3PSC},                 2, 2)               dnl IC3PSC[1:0] bits (Input Capture 3 Prescaler)
defmask({TIM_CCMR2_IC3F},                   4, 4)               dnl IC3F[3:0] bits (Input Capture 3 Filter)
defmask({TIM_CCMR2_IC4PSC},                 10, 2)              dnl IC4PSC[1:0] bits (Input Capture 4 Prescaler)
defmask({TIM_CCMR2_IC4F},                   12, 4)              dnl IC4F[3:0] bits (Input Capture 4 Filter)

dnl *******************  Bit definition for TIM_CCER register  *******************
defsym({TIM_CCER_CC1E},                     0x0001)             dnl Capture/Compare 1 output enable
defsym({TIM_CCER_CC1P},                     0x0002)             dnl Capture/Compare 1 output Polarity
defsym({TIM_CCER_CC1NE},                    0x0004)             dnl Capture/Compare 1 Complementary output enable
defsym({TIM_CCER_CC1NP},                    0x0008)             dnl Capture/Compare 1 Complementary output Polarity
defsym({TIM_CCER_CC2E},                     0x0010)             dnl Capture/Compare 2 output enable
defsym({TIM_CCER_CC2P},                     0x0020)             dnl Capture/Compare 2 output Polarity
defsym({TIM_CCER_CC2NE},                    0x0040)             dnl Capture/Compare 2 Complementary output enable
defsym({TIM_CCER_CC2NP},                    0x0080)             dnl Capture/Compare 2 Complementary output Polarity
defsym({TIM_CCER_CC3E},                     0x0100)             dnl Capture/Compare 3 output enable
defsym({TIM_CCER_CC3P},                     0x0200)             dnl Capture/Compare 3 output Polarity
defsym({TIM_CCER_CC3NE},                    0x0400)             dnl Capture/Compare 3 Complementary output enable
defsym({TIM_CCER_CC3NP},                    0x0800)             dnl Capture/Compare 3 Complementary output Polarity
defsym({TIM_CCER_CC4E},                     0x1000)             dnl Capture/Compare 4 output enable
defsym({TIM_CCER_CC4P},                     0x2000)             dnl Capture/Compare 4 output Polarity
defsym({TIM_CCER_CC4NP},                    0x8000)             dnl Capture/Compare 4 Complementary output Polarity

dnl *******************  Bit definition for TIM_CNT register  ********************
defmask({TIM_CNT_CNT},                      0, 16)              dnl Counter Value

dnl *******************  Bit definition for TIM_PSC register  ********************
defmask({TIM_PSC_PSC},                      0, 16)              dnl Prescaler Value

dnl *******************  Bit definition for TIM_ARR register  ********************
defmask({TIM_ARR_ARR},                      0, 16)              dnl actual auto-reload Value

dnl *******************  Bit definition for TIM_RCR register  ********************
defmask({TIM_RCR_REP},                      0, 8)               dnl Repetition Counter Value

dnl *******************  Bit definition for TIM_CCRn register  *******************
defmask({TIM_CCR_CCR},                      0, 16)              dnl Capture/Compare 4 Value

dnl *******************  Bit definition for TIM_BDTR register  *******************
defmask({TIM_BDTR_DTG},                     0, 8)               dnl DTG[0:7] bits (Dead-Time Generator set-up)
defmask({TIM_BDTR_LOCK},                    8, 2)               dnl LOCK[1:0] bits (Lock Configuration)
defsym({TIM_BDTR_OSSI},                     0x0400)             dnl Off-State Selection for Idle mode
defsym({TIM_BDTR_OSSR},                     0x0800)             dnl Off-State Selection for Run mode
defsym({TIM_BDTR_BKE},                      0x1000)             dnl Break enable
defsym({TIM_BDTR_BKP},                      0x2000)             dnl Break Polarity
defsym({TIM_BDTR_AOE},                      0x4000)             dnl Automatic Output enable
defsym({TIM_BDTR_MOE},                      0x8000)             dnl Main Output enable

dnl *******************  Bit definition for TIM_DCR register  ********************
defmask({TIM_DCR_DBA},                      0, 5)               dnl DBA[4:0] bits (DMA Base Address)
defmask({TIM_DCR_DBL},                      8, 5)               dnl DBL[4:0] bits (DMA Burst Length)

dnl *******************  Bit definition for TIM_DMAR register  *******************
defmask({TIM_DMAR_DMAB},                    0, 16)              dnl DMA register for burst accesses

dnl ******************************************************************************
dnl
dnl                             Real-Time Clock
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for RTC_CRH register  ********************
defsym({RTC_CRH_SECIE},                     0x01)               dnl Second Interrupt Enable
defsym({RTC_CRH_ALRIE},                     0x02)               dnl Alarm Interrupt Enable
defsym({RTC_CRH_OWIE},                      0x04)               dnl OverfloW Interrupt Enable

dnl *******************  Bit definition for RTC_CRL register  ********************
defsym({RTC_CRL_SECF},                      0x01)               dnl Second Flag
defsym({RTC_CRL_ALRF},                      0x02)               dnl Alarm Flag
defsym({RTC_CRL_OWF},                       0x04)               dnl OverfloW Flag
defsym({RTC_CRL_RSF},                       0x08)               dnl Registers Synchronized Flag
defsym({RTC_CRL_CNF},                       0x10)               dnl Configuration Flag
defsym({RTC_CRL_RTOFF},                     0x20)               dnl RTC operation OFF

dnl *******************  Bit definition for RTC_PRLH register  *******************
defmask({RTC_PRLH_PRL},                    0, 4)                dnl RTC Prescaler Reload Value High

dnl *******************  Bit definition for RTC_PRLL register  *******************
defmask({RTC_PRLL_PRL},                     0, 16)              dnl RTC Prescaler Reload Value Low

dnl *******************  Bit definition for RTC_DIVH register  *******************
defmask({RTC_DIVH_RTC_DIV},                 0, 4)               dnl RTC Clock Divider High

dnl *******************  Bit definition for RTC_DIVL register  *******************
defmask({RTC_DIVL_RTC_DIV},                 0, 16)              dnl RTC Clock Divider Low

dnl *******************  Bit definition for RTC_CNTH register  *******************
defmask({RTC_CNTH_RTC_CNT},                 0, 16)              dnl RTC Counter High

dnl *******************  Bit definition for RTC_CNTL register  *******************
defmask({RTC_CNTL_RTC_CNT},                 0, 16)              dnl RTC Counter Low

dnl *******************  Bit definition for RTC_ALRH register  *******************
defmask({RTC_ALRH_RTC_ALR},                 0, 16)              dnl RTC Alarm High

dnl *******************  Bit definition for RTC_ALRL register  *******************
defmask({RTC_ALRL_RTC_ALR},                 0, 16)              dnl RTC Alarm Low

dnl ******************************************************************************
dnl
dnl                           Independent WATCHDOG
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for IWDG_KR register  ********************
defmask({IWDG_KR_KEY},                      0, 16)              dnl Key value (write only, read 0000h)

dnl *******************  Bit definition for IWDG_PR register  ********************
defmask({IWDG_PR_PR},                       0, 3)               dnl PR[2:0] (Prescaler divider)

dnl *******************  Bit definition for IWDG_RLR register  *******************
defmask({IWDG_RLR_RL},                      0, 12)              dnl Watchdog counter reload value

dnl *******************  Bit definition for IWDG_SR register  ********************
defsym({IWDG_SR_PVU},                       0x01)               dnl Watchdog prescaler value update
defsym({IWDG_SR_RVU},                       0x02)               dnl Watchdog counter reload value update

dnl ******************************************************************************
dnl
dnl                            Window WATCHDOG
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for WWDG_CR register  ********************
defmask({WWDG_CR_T},                        0, 7)               dnl T[6:0] bits (7-Bit counter (MSB to LSB))
defsym({WWDG_CR_WDGA},                      0x80)               dnl Activation bit

dnl *******************  Bit definition for WWDG_CFR register  *******************
defmask({WWDG_CFR_W},                       0, 7)               dnl W[6:0] bits (7-bit window value)
defmask({WWDG_CFR_WDGTB},                   8, 2)               dnl WDGTB[1:0] bits (Timer Base)
defsym({WWDG_CFR_EWI},                      0x0200)             dnl Early Wakeup Interrupt

dnl *******************  Bit definition for WWDG_SR register  ********************
defsym({WWDG_SR_EWIF},                      0x01)               dnl Early Wakeup Interrupt Flag

dnl ******************************************************************************
dnl
dnl                       Flexible Static Memory Controller
dnl
dnl ******************************************************************************

dnl ******************  Bit definition for FSMC_BCRn register  *******************
defsym({FSMC_BCR_MBKEN},                    0x00000001)         dnl Memory bank enable bit
defsym({FSMC_BCR_MUXEN},                    0x00000002)         dnl Address/data multiplexing enable bit
defmask({FSMC_BCR_MTYP},                    2, 2)               dnl MTYP[1:0] bits (Memory type)
defmask({FSMC_BCR_MWID},                    4, 2)               dnl MWID[1:0] bits (Memory data bus width)
defsym({FSMC_BCR_FACCEN},                   0x00000040)         dnl Flash access enable
defsym({FSMC_BCR_BURSTEN},                  0x00000100)         dnl Burst enable bit
defsym({FSMC_BCR_WAITPOL},                  0x00000200)         dnl Wait signal polarity bit
defsym({FSMC_BCR_WRAPMOD},                  0x00000400)         dnl Wrapped burst mode support
defsym({FSMC_BCR_WAITCFG},                  0x00000800)         dnl Wait timing configuration
defsym({FSMC_BCR_WREN},                     0x00001000)         dnl Write enable bit
defsym({FSMC_BCR_WAITEN},                   0x00002000)         dnl Wait enable bit
defsym({FSMC_BCR_EXTMOD},                   0x00004000)         dnl Extended mode enable
defsym({FSMC_BCR_ASYNCWAIT},                0x00008000)         dnl Asynchronous wait
defsym({FSMC_BCR_CBURSTRW},                 0x00080000)         dnl Write burst enable

dnl ******************  Bit definition for FSMC_BTRn register  *******************
defmask({FSMC_BTR_ADDSET},                  0, 4)               dnl ADDSET[3:0] bits (Address setup phase duration)
defmask({FSMC_BTR_ADDHLD},                  4, 4)               dnl ADDHLD[3:0] bits (Address-hold phase duration)
defmask({FSMC_BTR_DATAST},                  8, 8)               dnl DATAST [3:0] bits (Data-phase duration)
defmask({FSMC_BTR_BUSTURN},                 16, 4)              dnl BUSTURN[3:0] bits (Bus turnaround phase duration)
defmask({FSMC_BTR_CLKDIV},                  20, 4)              dnl CLKDIV[3:0] bits (Clock divide ratio)
defmask({FSMC_BTR_DATLAT},                  24, 4)              dnl DATLA[3:0] bits (Data latency)
defmask({FSMC_BTR_ACCMOD},                  28, 2)              dnl ACCMOD[1:0] bits (Access mode)

dnl ******************  Bit definition for FSMC_BWTRn register  ******************
defmask({FSMC_BWTR_ADDSET},                 0, 4)               dnl ADDSET[3:0] bits (Address setup phase duration)
defmask({FSMC_BWTR_ADDHLD},                 4, 4)               dnl ADDHLD[3:0] bits (Address-hold phase duration)
defmask({FSMC_BWTR_DATAST},                 8, 8)               dnl DATAST [3:0] bits (Data-phase duration)
defmask({FSMC_BWTR_CLKDIV},                 20, 4)              dnl CLKDIV[3:0] bits (Clock divide ratio)
defmask({FSMC_BWTR_DATLAT},                 24, 4)              dnl DATLA[3:0] bits (Data latency)
defmask({FSMC_BWTR_ACCMOD},                 28, 2)              dnl ACCMOD[1:0] bits (Access mode)

dnl ******************  Bit definition for FSMC_PCRn register  *******************
defsym({FSMC_PCR_PWAITEN},                  0x00000002)         dnl Wait feature enable bit
defsym({FSMC_PCR_PBKEN},                    0x00000004)         dnl PC Card/NAND Flash memory bank enable bit
defsym({FSMC_PCR_PTYP},                     0x00000008)         dnl Memory type
defmask({FSMC_PCR_PWID},                    4, 2)               dnl PWID[1:0] bits (NAND Flash databus width)
defmask({FSMC_PCR_PWID},                    4, 2)               dnl PWID[1:0] bits (NAND Flash databus width)
defsym({FSMC_PCR_ECCEN},                    0x00000040)         dnl ECC computation logic enable bit
defmask({FSMC_PCR_TCLR},                    9, 4)               dnl TCLR[3:0] bits (CLE to RE delay)
defmask({FSMC_PCR_TAR},                     13, 4)              dnl TAR[3:0] bits (ALE to RE delay)
defmask({FSMC_PCR_ECCPS},                   17, 3)              dnl ECCPS[2:0] bits (ECC page size)

dnl *******************  Bit definition for FSMC_SRn register  *******************
defsym({FSMC_SR_IRS},                       0x01)               dnl Interrupt Rising Edge status
defsym({FSMC_SR_ILS},                       0x02)               dnl Interrupt Level status
defsym({FSMC_SR_IFS},                       0x04)               dnl Interrupt Falling Edge status
defsym({FSMC_SR_IREN},                      0x08)               dnl Interrupt Rising Edge detection Enable bit
defsym({FSMC_SR_ILEN},                      0x10)               dnl Interrupt Level detection Enable bit
defsym({FSMC_SR_IFEN},                      0x20)               dnl Interrupt Falling Edge detection Enable bit
defsym({FSMC_SR_FEMPT},                     0x40)               dnl FIFO empty

dnl ******************  Bit definition for FSMC_P{IO,MEM,ATT}n register  *******************
defmask({FSMC_P_SET},                       0, 8)               dnl SET[7:0] bits (setup time)
defmask({FSMC_P_WAIT},                      8, 8)               dnl WAIT[7:0] bits (wait time)
defmask({FSMC_P_HOLD},                      16, 8)              dnl HOLD[7:0] bits (hold time)
defmask({FSMC_P_HIZ},                       24, 8)              dnl HIZ[7:0] bits (databus HiZ time)

dnl ******************  Bit definition for FSMC_ECCRn register  ******************
defmask({FSMC_ECCR_ECC},                    0, 32)              dnl ECC result

dnl ******************************************************************************
dnl
dnl                          SD host Interface
dnl
dnl ******************************************************************************

dnl ******************  Bit definition for SDIO_POWER register  ******************
defmask({SDIO_POWER_PWRCTRL},               0, 2)               dnl PWRCTRL[1:0] bits (Power supply control bits)

dnl ******************  Bit definition for SDIO_CLKCR register  ******************
defmask({SDIO_CLKCR_CLKDIV},                0, 8)               dnl Clock divide factor
defsym({SDIO_CLKCR_CLKEN},                  0x0100)             dnl Clock enable bit
defsym({SDIO_CLKCR_PWRSAV},                 0x0200)             dnl Power saving configuration bit
defsym({SDIO_CLKCR_BYPASS},                 0x0400)             dnl Clock divider bypass enable bit
defmask({SDIO_CLKCR_WIDBUS},                11, 2)              dnl WIDBUS[1:0] bits (Wide bus mode enable bit)
defsym({SDIO_CLKCR_NEGEDGE},                0x2000)             dnl SDIO_CK dephasing selection bit
defsym({SDIO_CLKCR_HWFC_EN},                0x4000)             dnl HW Flow Control enable

dnl *******************  Bit definition for SDIO_ARG register  *******************
defmask({SDIO_ARG_CMDARG},                  0, 32)              dnl Command argument

dnl *******************  Bit definition for SDIO_CMD register  *******************
defsym({SDIO_CMD_CMDINDEX},                 0x003F)             dnl Command Index
defmask({SDIO_CMD_WAITRESP},                6, 2)               dnl WAITRESP[1:0] bits (Wait for response bits)
defsym({SDIO_CMD_WAITINT},                  0x0100)             dnl CPSM Waits for Interrupt Request
defsym({SDIO_CMD_WAITPEND},                 0x0200)             dnl CPSM Waits for ends of data transfer (CmdPend internal signal)
defsym({SDIO_CMD_CPSMEN},                   0x0400)             dnl Command path state machine (CPSM) Enable bit
defsym({SDIO_CMD_SDIOSUSPEND},              0x0800)             dnl SD I/O suspend command
defsym({SDIO_CMD_ENCMDCOMPL},               0x1000)             dnl Enable CMD completion
defsym({SDIO_CMD_NIEN},                     0x2000)             dnl Not Interrupt Enable
defsym({SDIO_CMD_CEATACMD},                 0x4000)             dnl CE-ATA command

dnl *****************  Bit definition for SDIO_RESPCMD register  *****************
defsym({SDIO_RESPCMD_RESPCMD},              0x3F)               dnl Response command index

dnl ******************  Bit definition for SDIO_RESP0 register  ******************
defmask({SDIO_RESP0_CARDSTATUS0},           0, 32)              dnl Card Status

dnl ******************  Bit definition for SDIO_RESP1 register  ******************
defmask({SDIO_RESP1_CARDSTATUS1},           0, 32)              dnl Card Status

dnl ******************  Bit definition for SDIO_RESP2 register  ******************
defmask({SDIO_RESP2_CARDSTATUS2},           0, 32)              dnl Card Status

dnl ******************  Bit definition for SDIO_RESP3 register  ******************
defmask({SDIO_RESP3_CARDSTATUS3},           0, 32)              dnl Card Status

dnl ******************  Bit definition for SDIO_RESP4 register  ******************
defmask({SDIO_RESP4_CARDSTATUS4},           0, 32)              dnl Card Status

dnl ******************  Bit definition for SDIO_DTIMER register  *****************
defmask({SDIO_DTIMER_DATATIME},             0, 32)              dnl Data timeout period.

dnl ******************  Bit definition for SDIO_DLEN register  *******************
defmask({SDIO_DLEN_DATALENGTH},             0, 25)              dnl Data length value

dnl ******************  Bit definition for SDIO_DCTRL register  ******************
defsym({SDIO_DCTRL_DTEN},                   0x0001)             dnl Data transfer enabled bit
defsym({SDIO_DCTRL_DTDIR},                  0x0002)             dnl Data transfer direction selection
defsym({SDIO_DCTRL_DTMODE},                 0x0004)             dnl Data transfer mode selection
defsym({SDIO_DCTRL_DMAEN},                  0x0008)             dnl DMA enabled bit

defmask({SDIO_DCTRL_DBLOCKSIZE},            4, 4)               dnl DBLOCKSIZE[3:0] bits (Data block size)

defsym({SDIO_DCTRL_RWSTART},                0x0100)             dnl Read wait start
defsym({SDIO_DCTRL_RWSTOP},                 0x0200)             dnl Read wait stop
defsym({SDIO_DCTRL_RWMOD},                  0x0400)             dnl Read wait mode
defsym({SDIO_DCTRL_SDIOEN},                 0x0800)             dnl SD I/O enable functions

dnl ******************  Bit definition for SDIO_DCOUNT register  *****************
defmask({SDIO_DCOUNT_DATACOUNT},            0, 25)              dnl Data count value

dnl ******************  Bit definition for SDIO_STA register  ********************
defsym({SDIO_STA_CCRCFAIL},                 0x00000001)         dnl Command response received (CRC check failed)
defsym({SDIO_STA_DCRCFAIL},                 0x00000002)         dnl Data block sent/received (CRC check failed)
defsym({SDIO_STA_CTIMEOUT},                 0x00000004)         dnl Command response timeout
defsym({SDIO_STA_DTIMEOUT},                 0x00000008)         dnl Data timeout
defsym({SDIO_STA_TXUNDERR},                 0x00000010)         dnl Transmit FIFO underrun error
defsym({SDIO_STA_RXOVERR},                  0x00000020)         dnl Received FIFO overrun error
defsym({SDIO_STA_CMDREND},                  0x00000040)         dnl Command response received (CRC check passed)
defsym({SDIO_STA_CMDSENT},                  0x00000080)         dnl Command sent (no response required)
defsym({SDIO_STA_DATAEND},                  0x00000100)         dnl Data end (data counter, SDIDCOUNT, is zero)
defsym({SDIO_STA_STBITERR},                 0x00000200)         dnl Start bit not detected on all data signals in wide bus mode
defsym({SDIO_STA_DBCKEND},                  0x00000400)         dnl Data block sent/received (CRC check passed)
defsym({SDIO_STA_CMDACT},                   0x00000800)         dnl Command transfer in progress
defsym({SDIO_STA_TXACT},                    0x00001000)         dnl Data transmit in progress
defsym({SDIO_STA_RXACT},                    0x00002000)         dnl Data receive in progress
defsym({SDIO_STA_TXFIFOHE},                 0x00004000)         dnl Transmit FIFO Half Empty: at least 8 words can be written into the FIFO
defsym({SDIO_STA_RXFIFOHF},                 0x00008000)         dnl Receive FIFO Half Full: there are at least 8 words in the FIFO
defsym({SDIO_STA_TXFIFOF},                  0x00010000)         dnl Transmit FIFO full
defsym({SDIO_STA_RXFIFOF},                  0x00020000)         dnl Receive FIFO full
defsym({SDIO_STA_TXFIFOE},                  0x00040000)         dnl Transmit FIFO empty
defsym({SDIO_STA_RXFIFOE},                  0x00080000)         dnl Receive FIFO empty
defsym({SDIO_STA_TXDAVL},                   0x00100000)         dnl Data available in transmit FIFO
defsym({SDIO_STA_RXDAVL},                   0x00200000)         dnl Data available in receive FIFO
defsym({SDIO_STA_SDIOIT},                   0x00400000)         dnl SDIO interrupt received
defsym({SDIO_STA_CEATAEND},                 0x00800000)         dnl CE-ATA command completion signal received for CMD61

dnl *******************  Bit definition for SDIO_ICR register  *******************
defsym({SDIO_ICR_CCRCFAILC},                0x00000001)         dnl CCRCFAIL flag clear bit
defsym({SDIO_ICR_DCRCFAILC},                0x00000002)         dnl DCRCFAIL flag clear bit
defsym({SDIO_ICR_CTIMEOUTC},                0x00000004)         dnl CTIMEOUT flag clear bit
defsym({SDIO_ICR_DTIMEOUTC},                0x00000008)         dnl DTIMEOUT flag clear bit
defsym({SDIO_ICR_TXUNDERRC},                0x00000010)         dnl TXUNDERR flag clear bit
defsym({SDIO_ICR_RXOVERRC},                 0x00000020)         dnl RXOVERR flag clear bit
defsym({SDIO_ICR_CMDRENDC},                 0x00000040)         dnl CMDREND flag clear bit
defsym({SDIO_ICR_CMDSENTC},                 0x00000080)         dnl CMDSENT flag clear bit
defsym({SDIO_ICR_DATAENDC},                 0x00000100)         dnl DATAEND flag clear bit
defsym({SDIO_ICR_STBITERRC},                0x00000200)         dnl STBITERR flag clear bit
defsym({SDIO_ICR_DBCKENDC},                 0x00000400)         dnl DBCKEND flag clear bit
defsym({SDIO_ICR_SDIOITC},                  0x00400000)         dnl SDIOIT flag clear bit
defsym({SDIO_ICR_CEATAENDC},                0x00800000)         dnl CEATAEND flag clear bit

dnl ******************  Bit definition for SDIO_MASK register  *******************
defsym({SDIO_MASK_CCRCFAILIE},              0x00000001)         dnl Command CRC Fail Interrupt Enable
defsym({SDIO_MASK_DCRCFAILIE},              0x00000002)         dnl Data CRC Fail Interrupt Enable
defsym({SDIO_MASK_CTIMEOUTIE},              0x00000004)         dnl Command TimeOut Interrupt Enable
defsym({SDIO_MASK_DTIMEOUTIE},              0x00000008)         dnl Data TimeOut Interrupt Enable
defsym({SDIO_MASK_TXUNDERRIE},              0x00000010)         dnl Tx FIFO UnderRun Error Interrupt Enable
defsym({SDIO_MASK_RXOVERRIE},               0x00000020)         dnl Rx FIFO OverRun Error Interrupt Enable
defsym({SDIO_MASK_CMDRENDIE},               0x00000040)         dnl Command Response Received Interrupt Enable
defsym({SDIO_MASK_CMDSENTIE},               0x00000080)         dnl Command Sent Interrupt Enable
defsym({SDIO_MASK_DATAENDIE},               0x00000100)         dnl Data End Interrupt Enable
defsym({SDIO_MASK_STBITERRIE},              0x00000200)         dnl Start Bit Error Interrupt Enable
defsym({SDIO_MASK_DBCKENDIE},               0x00000400)         dnl Data Block End Interrupt Enable
defsym({SDIO_MASK_CMDACTIE},                0x00000800)         dnl Command Acting Interrupt Enable
defsym({SDIO_MASK_TXACTIE},                 0x00001000)         dnl Data Transmit Acting Interrupt Enable
defsym({SDIO_MASK_RXACTIE},                 0x00002000)         dnl Data receive acting interrupt enabled
defsym({SDIO_MASK_TXFIFOHEIE},              0x00004000)         dnl Tx FIFO Half Empty interrupt Enable
defsym({SDIO_MASK_RXFIFOHFIE},              0x00008000)         dnl Rx FIFO Half Full interrupt Enable
defsym({SDIO_MASK_TXFIFOFIE},               0x00010000)         dnl Tx FIFO Full interrupt Enable
defsym({SDIO_MASK_RXFIFOFIE},               0x00020000)         dnl Rx FIFO Full interrupt Enable
defsym({SDIO_MASK_TXFIFOEIE},               0x00040000)         dnl Tx FIFO Empty interrupt Enable
defsym({SDIO_MASK_RXFIFOEIE},               0x00080000)         dnl Rx FIFO Empty interrupt Enable
defsym({SDIO_MASK_TXDAVLIE},                0x00100000)         dnl Data available in Tx FIFO interrupt Enable
defsym({SDIO_MASK_RXDAVLIE},                0x00200000)         dnl Data available in Rx FIFO interrupt Enable
defsym({SDIO_MASK_SDIOITIE},                0x00400000)         dnl SDIO Mode Interrupt Received interrupt Enable
defsym({SDIO_MASK_CEATAENDIE},              0x00800000)         dnl CE-ATA command completion signal received Interrupt Enable

dnl *****************  Bit definition for SDIO_FIFOCNT register  *****************
defmask({SDIO_FIFOCNT_FIFOCOUNT},           0, 24)              dnl Remaining number of words to be written to or read from the FIFO

dnl ******************  Bit definition for SDIO_FIFO register  *******************
defmask({SDIO_FIFO_FIFODATA},               0, 32)              dnl Receive and transmit FIFO data

dnl ******************************************************************************
dnl
dnl                                   USB Device FS
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for USB_EPnR register  *******************
defmask({USB_EPR_EA},                       0, 4)               dnl Endpoint Address
defmask({USB_EPR_STAT_TX},                  4, 2)               dnl STAT_TX[1:0] bits (Status bits, for transmission transfers)
defsym({USB_EPR_EP_TX_DIS},                 0x0000)             dnl Disabled
defsym({USB_EPR_EP_TX_STALL},               0x0010)             dnl Stalled
defsym({USB_EPR_EP_TX_NAK},                 0x0020)             dnl NAKed
defsym({USB_EPR_EP_TX_VALID},               0x0030)             dnl Valid
defsym({USB_EPR_DTOG_TX},                   0x0040)             dnl Data Toggle, for transmission transfers
defsym({USB_EPR_CTR_TX},                    0x0080)             dnl Correct Transfer for transmission
defsym({USB_EPR_EP_KIND},                   0x0100)             dnl Endpoint Kind
defsym({USB_EPR_EP_DBL_BUF},                0x0100)             dnl Double Buffer for Bulk Endpoint
defsym({USB_EPR_EP_STATUS_OUT},             0x0100)             dnl Status Out for Control Endpoint
defmask({USB_EPR_EP_TYPE},                  9, 2)               dnl EP_TYPE[1:0] bits (Endpoint type)
defsym({USB_EPR_EP_BULK},                   0x0000)             dnl BULK EndPoint
defsym({USB_EPR_EP_CONTROL},                0x0200)             dnl CONTROL EndPoint
defsym({USB_EPR_EP_ISOCHRONOUS},            0x0400)             dnl ISOCHRONOUS EndPoint
defsym({USB_EPR_EP_INTERRUPT},              0x0600)             dnl INTERRUPT EndPoint
defsym({USB_EPR_SETUP},                     0x0800)             dnl Setup transaction completed
defmask({USB_EPR_STAT_RX},                  12, 2)              dnl STAT_RX[1:0] bits (Status bits, for reception transfers)
defsym({USB_EPR_EP_RX_DIS},                 0x0000)             dnl Disabled
defsym({USB_EPR_EP_RX_STALL},               0x1000)             dnl Stalled
defsym({USB_EPR_EP_RX_NAK},                 0x2000)             dnl NAKed
defsym({USB_EPR_EP_RX_VALID},               0x3000)             dnl Valid
defsym({USB_EPR_DTOG_RX},                   0x4000)             dnl Data Toggle, for reception transfers
defsym({USB_EPR_CTR_RX},                    0x8000)             dnl Correct Transfer for reception

dnl Common registers
dnl *******************  Bit definition for USB_CNTR register  *******************
defsym({USB_CNTR_FRES},                     0x0001)             dnl Force USB Reset
defsym({USB_CNTR_PDWN},                     0x0002)             dnl Power down
defsym({USB_CNTR_LP_MODE},                  0x0004)             dnl Low-power mode
defsym({USB_CNTR_FSUSP},                    0x0008)             dnl Force suspend
defsym({USB_CNTR_RESUME},                   0x0010)             dnl Resume request
defsym({USB_CNTR_ESOFM},                    0x0100)             dnl Expected Start Of Frame Interrupt Mask
defsym({USB_CNTR_SOFM},                     0x0200)             dnl Start Of Frame Interrupt Mask
defsym({USB_CNTR_RESETM},                   0x0400)             dnl RESET Interrupt Mask
defsym({USB_CNTR_SUSPM},                    0x0800)             dnl Suspend mode Interrupt Mask
defsym({USB_CNTR_WKUPM},                    0x1000)             dnl Wakeup Interrupt Mask
defsym({USB_CNTR_ERRM},                     0x2000)             dnl Error Interrupt Mask
defsym({USB_CNTR_PMAOVRM},                  0x4000)             dnl Packet Memory Area Over / Underrun Interrupt Mask
defsym({USB_CNTR_CTRM},                     0x8000)             dnl Correct Transfer Interrupt Mask

dnl *******************  Bit definition for USB_ISTR register  *******************
defmask({USB_ISTR_EP_ID},                   0, 4)               dnl Endpoint Identifier
defsym({USB_ISTR_DIR},                      0x0010)             dnl Direction of transaction
defsym({USB_ISTR_ESOF},                     0x0100)             dnl Expected Start Of Frame
defsym({USB_ISTR_SOF},                      0x0200)             dnl Start Of Frame
defsym({USB_ISTR_RESET},                    0x0400)             dnl USB RESET request
defsym({USB_ISTR_SUSP},                     0x0800)             dnl Suspend mode request
defsym({USB_ISTR_WKUP},                     0x1000)             dnl Wake up
defsym({USB_ISTR_ERR},                      0x2000)             dnl Error
defsym({USB_ISTR_PMAOVR},                   0x4000)             dnl Packet Memory Area Over / Underrun
defsym({USB_ISTR_CTR},                      0x8000)             dnl Correct Transfer

dnl *******************  Bit definition for USB_FNR register  ********************
defmask({USB_FNR_FN},                       0, 11)              dnl Frame Number
defmask({USB_FNR_LSOF},                     11, 2)              dnl Lost SOF
defsym({USB_FNR_LCK},                       0x2000)             dnl Locked
defsym({USB_FNR_RXDM},                      0x4000)             dnl Receive Data - Line Status
defsym({USB_FNR_RXDP},                      0x8000)             dnl Receive Data + Line Status

dnl ******************  Bit definition for USB_DADDR register  *******************
defmask({USB_DADDR_ADD},                    0, 7)               dnl ADD[6:0] bits (Device Address)
defsym({USB_DADDR_EF},                      0x80)               dnl Enable Function

dnl USB Buffer Descriptor Table
defsym({USB_ADDR_TX},                       0 * 4)
defsym({USB_COUNT_TX},                      1 * 4)
defsym({USB_ADDR_RX},                       2 * 4)
defsym({USB_COUNT_RX},                      3 * 4)
defmask({USB_COUNT_RX_COUNT},               0, 10)              dnl Reception Byte Count
defmask({USB_COUNT_RX_NUM_BLOCK},           10, 5)              dnl NUM_BLOCK[4:0] bits (Number of blocks)
defsym({USB_COUNT_RX_BLSIZE},               0x8000)             dnl BLock SIZE


dnl ******************************************************************************
dnl
dnl                         Controller Area Network
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for CAN_MCR register  ********************
defsym({CAN_MCR_INRQ},                      0x0001)             dnl Initialization Request
defsym({CAN_MCR_SLEEP},                     0x0002)             dnl Sleep Mode Request
defsym({CAN_MCR_TXFP},                      0x0004)             dnl Transmit FIFO Priority
defsym({CAN_MCR_RFLM},                      0x0008)             dnl Receive FIFO Locked Mode
defsym({CAN_MCR_NART},                      0x0010)             dnl No Automatic Retransmission
defsym({CAN_MCR_AWUM},                      0x0020)             dnl Automatic Wakeup Mode
defsym({CAN_MCR_ABOM},                      0x0040)             dnl Automatic Bus-Off Management
defsym({CAN_MCR_TTCM},                      0x0080)             dnl Time Triggered Communication Mode
defsym({CAN_MCR_RESET},                     0x8000)             dnl CAN software master reset

dnl *******************  Bit definition for CAN_MSR register  ********************
defsym({CAN_MSR_INAK},                      0x0001)             dnl Initialization Acknowledge
defsym({CAN_MSR_SLAK},                      0x0002)             dnl Sleep Acknowledge
defsym({CAN_MSR_ERRI},                      0x0004)             dnl Error Interrupt
defsym({CAN_MSR_WKUI},                      0x0008)             dnl Wakeup Interrupt
defsym({CAN_MSR_SLAKI},                     0x0010)             dnl Sleep Acknowledge Interrupt
defsym({CAN_MSR_TXM},                       0x0100)             dnl Transmit Mode
defsym({CAN_MSR_RXM},                       0x0200)             dnl Receive Mode
defsym({CAN_MSR_SAMP},                      0x0400)             dnl Last Sample Point
defsym({CAN_MSR_RX},                        0x0800)             dnl CAN Rx Signal

dnl *******************  Bit definition for CAN_TSR register  ********************
defsym({CAN_TSR_RQCP0},                     0x00000001)         dnl Request Completed Mailbox0
defsym({CAN_TSR_TXOK0},                     0x00000002)         dnl Transmission OK of Mailbox0
defsym({CAN_TSR_ALST0},                     0x00000004)         dnl Arbitration Lost for Mailbox0
defsym({CAN_TSR_TERR0},                     0x00000008)         dnl Transmission Error of Mailbox0
defsym({CAN_TSR_ABRQ0},                     0x00000080)         dnl Abort Request for Mailbox0
defsym({CAN_TSR_RQCP1},                     0x00000100)         dnl Request Completed Mailbox1
defsym({CAN_TSR_TXOK1},                     0x00000200)         dnl Transmission OK of Mailbox1
defsym({CAN_TSR_ALST1},                     0x00000400)         dnl Arbitration Lost for Mailbox1
defsym({CAN_TSR_TERR1},                     0x00000800)         dnl Transmission Error of Mailbox1
defsym({CAN_TSR_ABRQ1},                     0x00008000)         dnl Abort Request for Mailbox 1
defsym({CAN_TSR_RQCP2},                     0x00010000)         dnl Request Completed Mailbox2
defsym({CAN_TSR_TXOK2},                     0x00020000)         dnl Transmission OK of Mailbox 2
defsym({CAN_TSR_ALST2},                     0x00040000)         dnl Arbitration Lost for mailbox 2
defsym({CAN_TSR_TERR2},                     0x00080000)         dnl Transmission Error of Mailbox 2
defsym({CAN_TSR_ABRQ2},                     0x00800000)         dnl Abort Request for Mailbox 2
defsym({CAN_TSR_CODE},                      0x03000000)         dnl Mailbox Code
defmask({CAN_TSR_TME},                      26, 3)              dnl TME[2:0] bits
defmask({CAN_TSR_LOW},                      29, 3)              dnl LOW[2:0] bits

dnl *******************  Bit definition for CAN_RFnR register  *******************
defsym({CAN_RFR_FMP},                       0x03)               dnl FIFO Message Pending
defsym({CAN_RFR_FULL},                      0x08)               dnl FIFO Full
defsym({CAN_RFR_FOVR},                      0x10)               dnl FIFO Overrun
defsym({CAN_RFR_RFOM},                      0x20)               dnl Release FIFO Output Mailbox

dnl INNENTOL

dnl ********************  Bit definition for CAN_IER register  *******************
defsym({CAN_IER_TMEIE},                     0x00000001)         dnl Transmit Mailbox Empty Interrupt Enable
defsym({CAN_IER_FMPIE0},                    0x00000002)         dnl FIFO Message Pending Interrupt Enable
defsym({CAN_IER_FFIE0},                     0x00000004)         dnl FIFO Full Interrupt Enable
defsym({CAN_IER_FOVIE0},                    0x00000008)         dnl FIFO Overrun Interrupt Enable
defsym({CAN_IER_FMPIE1},                    0x00000010)         dnl FIFO Message Pending Interrupt Enable
defsym({CAN_IER_FFIE1},                     0x00000020)         dnl FIFO Full Interrupt Enable
defsym({CAN_IER_FOVIE1},                    0x00000040)         dnl FIFO Overrun Interrupt Enable
defsym({CAN_IER_EWGIE},                     0x00000100)         dnl Error Warning Interrupt Enable
defsym({CAN_IER_EPVIE},                     0x00000200)         dnl Error Passive Interrupt Enable
defsym({CAN_IER_BOFIE},                     0x00000400)         dnl Bus-Off Interrupt Enable
defsym({CAN_IER_LECIE},                     0x00000800)         dnl Last Error Code Interrupt Enable
defsym({CAN_IER_ERRIE},                     0x00008000)         dnl Error Interrupt Enable
defsym({CAN_IER_WKUIE},                     0x00010000)         dnl Wakeup Interrupt Enable
defsym({CAN_IER_SLKIE},                     0x00020000)         dnl Sleep Interrupt Enable

dnl ********************  Bit definition for CAN_ESR register  *******************
defsym({CAN_ESR_EWGF},                      0x00000001)         dnl Error Warning Flag
defsym({CAN_ESR_EPVF},                      0x00000002)         dnl Error Passive Flag
defsym({CAN_ESR_BOFF},                      0x00000004)         dnl Bus-Off Flag
defmask({CAN_ESR_LEC},                      4, 3)               dnl LEC[2:0] bits (Last Error Code)
defmask({CAN_ESR_TEC},                      16, 8)              dnl Least significant byte of the 9-bit Transmit Error Counter
defmask({CAN_ESR_REC},                      24, 8)              dnl Receive Error Counter

dnl *******************  Bit definition for CAN_BTR register  ********************
defmask({CAN_BTR_BRP},                      0, 10)              dnl Baud Rate Prescaler
defmask({CAN_BTR_TS1},                      16, 4)              dnl Time Segment 1
defmask({CAN_BTR_TS2},                      20, 3)              dnl Time Segment 2
defsym({CAN_BTR_SJW},                       0x03000000)         dnl Resynchronization Jump Width
defsym({CAN_BTR_LBKM},                      0x40000000)         dnl Loop Back Mode (Debug)
defsym({CAN_BTR_SILM},                      0x80000000)         dnl Silent Mode

dnl Mailbox registers
dnl ******************  Bit definition for CAN_[TR]InR register  ********************
defsym({CAN_IR_TXRQ},                       0x00000001)         dnl Transmit Mailbox Request
defsym({CAN_IR_RTR},                        0x00000002)         dnl Remote Transmission Request
defsym({CAN_IR_IDE},                        0x00000004)         dnl Identifier Extension
defmask({CAN_IR_EXID},                      3, 18)              dnl Extended Identifier
defmask({CAN_IR_STID},                      21, 11)             dnl Standard Identifier or Extended Identifier

dnl ******************  Bit definition for CAN_TDTnR register  *******************
defmask({CAN_TDTR_DLC},                     0, 4)               dnl Data Length Code
defsym({CAN_TDTR_TGT},                      0x00000100)         dnl Transmit Global Time
defmask({CAN_TDTR_TIME},                    16, 16)             dnl Message Time Stamp

dnl *******************  Bit definition for CAN_RDTnR register  ******************
defmask({CAN_RDTR_DLC},                     0, 4)               dnl Data Length Code
defmask({CAN_RDTR_FMI},                     8, 8)               dnl Filter Match Index
defmask({CAN_RDTR_TIME},                    16, 16)             dnl Message Time Stamp

dnl *******************  Bit definition for CAN_FMR register  ********************
defsym({CAN_FMR_FINIT},                     0x01)               dnl Filter Init Mode

dnl *******************  Bit definition for CAN_FM1R register  *******************
defmask({CAN_FM1R_FBM},                     0, 14)              dnl Filter Mode

dnl *******************  Bit definition for CAN_FS1R register  *******************
defmask({CAN_FS1R_FSC},                     0, 14)              dnl Filter Scale Configuration

dnl ******************  Bit definition for CAN_FFA1R register  *******************
defmask({CAN_FFA1R_FFA},                    0, 14)              dnl Filter FIFO Assignment

dnl *******************  Bit definition for CAN_FA1R register  *******************
defmask({CAN_FA1R_FACT},                    0, 14)              dnl Filter Active



dnl ******************************************************************************
dnl
dnl                        Serial Peripheral Interface
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for SPI_CR1 register  ********************
defsym({SPI_CR1_CPHA},                      0x0001)             dnl Clock Phase
defsym({SPI_CR1_CPOL},                      0x0002)             dnl Clock Polarity
defsym({SPI_CR1_MSTR},                      0x0004)             dnl Master Selection
defmask({SPI_CR1_BR},                       3, 3)               dnl BR[2:0] bits (Baud Rate Control)
defsym({SPI_CR1_SPE},                       0x0040)             dnl SPI Enable
defsym({SPI_CR1_LSBFIRST},                  0x0080)             dnl Frame Format
defsym({SPI_CR1_SSI},                       0x0100)             dnl Internal slave select
defsym({SPI_CR1_SSM},                       0x0200)             dnl Software slave management
defsym({SPI_CR1_RXONLY},                    0x0400)             dnl Receive only
defsym({SPI_CR1_DFF},                       0x0800)             dnl Data Frame Format
defsym({SPI_CR1_CRCNEXT},                   0x1000)             dnl Transmit CRC next
defsym({SPI_CR1_CRCEN},                     0x2000)             dnl Hardware CRC calculation enable
defsym({SPI_CR1_BIDIOE},                    0x4000)             dnl Output enable in bidirectional mode
defsym({SPI_CR1_BIDIMODE},                  0x8000)             dnl Bidirectional data mode enable

dnl *******************  Bit definition for SPI_CR2 register  ********************
defsym({SPI_CR2_RXDMAEN},                   0x01)               dnl Rx Buffer DMA Enable
defsym({SPI_CR2_TXDMAEN},                   0x02)               dnl Tx Buffer DMA Enable
defsym({SPI_CR2_SSOE},                      0x04)               dnl SS Output Enable
defsym({SPI_CR2_ERRIE},                     0x20)               dnl Error Interrupt Enable
defsym({SPI_CR2_RXNEIE},                    0x40)               dnl RX buffer Not Empty Interrupt Enable
defsym({SPI_CR2_TXEIE},                     0x80)               dnl Tx buffer Empty Interrupt Enable

dnl ********************  Bit definition for SPI_SR register  ********************
defsym({SPI_SR_RXNE},                       0x01)               dnl Receive buffer Not Empty
defsym({SPI_SR_TXE},                        0x02)               dnl Transmit buffer Empty
defsym({SPI_SR_CHSIDE},                     0x04)               dnl Channel side
defsym({SPI_SR_UDR},                        0x08)               dnl Underrun flag
defsym({SPI_SR_CRCERR},                     0x10)               dnl CRC Error flag
defsym({SPI_SR_MODF},                       0x20)               dnl Mode fault
defsym({SPI_SR_OVR},                        0x40)               dnl Overrun flag
defsym({SPI_SR_BSY},                        0x80)               dnl Busy flag

dnl ********************  Bit definition for SPI_DR register  ********************
defmask({SPI_DR_DR},                        0, 16)              dnl Data Register

dnl *******************  Bit definition for SPI_CRCPR register  ******************
defmask({SPI_CRCPR_CRCPOLY},                0, 16)              dnl CRC polynomial register

dnl ******************  Bit definition for SPI_RXCRCR register  ******************
defmask({SPI_RXCRCR_RXCRC},                 0, 16)              dnl Rx CRC Register

dnl ******************  Bit definition for SPI_TXCRCR register  ******************
defmask({SPI_TXCRCR_TXCRC},                 0, 16)              dnl Tx CRC Register

dnl ******************  Bit definition for SPI_I2SCFGR register  *****************
defsym({SPI_I2SCFGR_CHLEN},                 0x0001)             dnl Channel length (number of bits per audio channel)
defmask({SPI_I2SCFGR_DATLEN},               1, 2)               dnl DATLEN[1:0] bits (Data length to be transferred)
defmask({SPI_I2SCFGR_DATLEN},               1, 2)               dnl DATLEN[1:0] bits (Data length to be transferred)
defsym({SPI_I2SCFGR_CKPOL},                 0x0008)             dnl steady state clock polarity
defmask({SPI_I2SCFGR_I2SSTD},               4, 2)               dnl I2SSTD[1:0] bits (I2S standard selection)
defmask({SPI_I2SCFGR_I2SSTD},               4, 2)               dnl I2SSTD[1:0] bits (I2S standard selection)
defsym({SPI_I2SCFGR_PCMSYNC},               0x0080)             dnl PCM frame synchronization
defmask({SPI_I2SCFGR_I2SCFG},               8, 2)               dnl I2SCFG[1:0] bits (I2S configuration mode)
defmask({SPI_I2SCFGR_I2SCFG},               8, 2)               dnl I2SCFG[1:0] bits (I2S configuration mode)
defsym({SPI_I2SCFGR_I2SE},                  0x0400)             dnl I2S Enable
defsym({SPI_I2SCFGR_I2SMOD},                0x0800)             dnl I2S mode selection

dnl ******************  Bit definition for SPI_I2SPR register  *******************
defmask({SPI_I2SPR_I2SDIV},                 0, 8)               dnl I2S Linear prescaler
defsym({SPI_I2SPR_ODD},                     0x0100)             dnl Odd factor for the prescaler
defsym({SPI_I2SPR_MCKOE},                   0x0200)             dnl Master Clock Output Enable

dnl ******************************************************************************
dnl
dnl                      Inter-integrated Circuit Interface
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for I2C_CR1 register  ********************
defsym({I2C_CR1_PE},                        0x0001)             dnl Peripheral Enable
defsym({I2C_CR1_SMBUS},                     0x0002)             dnl SMBus Mode
defsym({I2C_CR1_SMBTYPE},                   0x0008)             dnl SMBus Type
defsym({I2C_CR1_ENARP},                     0x0010)             dnl ARP Enable
defsym({I2C_CR1_ENPEC},                     0x0020)             dnl PEC Enable
defsym({I2C_CR1_ENGC},                      0x0040)             dnl General Call Enable
defsym({I2C_CR1_NOSTRETCH},                 0x0080)             dnl Clock Stretching Disable (Slave mode)
defsym({I2C_CR1_START},                     0x0100)             dnl Start Generation
defsym({I2C_CR1_STOP},                      0x0200)             dnl Stop Generation
defsym({I2C_CR1_ACK},                       0x0400)             dnl Acknowledge Enable
defsym({I2C_CR1_POS},                       0x0800)             dnl Acknowledge/PEC Position (for data reception)
defsym({I2C_CR1_PEC},                       0x1000)             dnl Packet Error Checking
defsym({I2C_CR1_ALERT},                     0x2000)             dnl SMBus Alert
defsym({I2C_CR1_SWRST},                     0x8000)             dnl Software Reset

dnl *******************  Bit definition for I2C_CR2 register  ********************
defmask({I2C_CR2_FREQ},                     0, 6)               dnl FREQ[5:0] bits (Peripheral Clock Frequency)
defmask({I2C_CR2_FREQ},                     0, 6)               dnl FREQ[5:0] bits (Peripheral Clock Frequency)
defsym({I2C_CR2_ITERREN},                   0x0100)             dnl Error Interrupt Enable
defsym({I2C_CR2_ITEVTEN},                   0x0200)             dnl Event Interrupt Enable
defsym({I2C_CR2_ITBUFEN},                   0x0400)             dnl Buffer Interrupt Enable
defsym({I2C_CR2_DMAEN},                     0x0800)             dnl DMA Requests Enable
defsym({I2C_CR2_LAST},                      0x1000)             dnl DMA Last Transfer

dnl *******************  Bit definition for I2C_OAR1 register  *******************
defmask({I2C_OAR1_ADD},                     0, 9)               dnl Interface Address
defsym({I2C_OAR1_ADDMODE},                  0x8000)             dnl Addressing Mode (Slave mode)

dnl *******************  Bit definition for I2C_OAR2 register  *******************
defsym({I2C_OAR2_ENDUAL},                   0x01)               dnl Dual addressing mode enable
defmask({I2C_OAR2_ADD2},                    1, 7)               dnl Interface address

dnl ********************  Bit definition for I2C_DR register  ********************
defmask({I2C_DR_DR},                        0, 8)               dnl 8-bit Data Register

dnl *******************  Bit definition for I2C_SR1 register  ********************
defsym({I2C_SR1_SB},                        0x0001)             dnl Start Bit (Master mode)
defsym({I2C_SR1_ADDR},                      0x0002)             dnl Address sent (master mode)/matched (slave mode)
defsym({I2C_SR1_BTF},                       0x0004)             dnl Byte Transfer Finished
defsym({I2C_SR1_ADD10},                     0x0008)             dnl 10-bit header sent (Master mode)
defsym({I2C_SR1_STOPF},                     0x0010)             dnl Stop detection (Slave mode)
defsym({I2C_SR1_RXNE},                      0x0040)             dnl Data Register not Empty (receivers)
defsym({I2C_SR1_TXE},                       0x0080)             dnl Data Register Empty (transmitters)
defsym({I2C_SR1_BERR},                      0x0100)             dnl Bus Error
defsym({I2C_SR1_ARLO},                      0x0200)             dnl Arbitration Lost (master mode)
defsym({I2C_SR1_AF},                        0x0400)             dnl Acknowledge Failure
defsym({I2C_SR1_OVR},                       0x0800)             dnl Overrun/Underrun
defsym({I2C_SR1_PECERR},                    0x1000)             dnl PEC Error in reception
defsym({I2C_SR1_TIMEOUT},                   0x4000)             dnl Timeout or Tlow Error
defsym({I2C_SR1_SMBALERT},                  0x8000)             dnl SMBus Alert

dnl *******************  Bit definition for I2C_SR2 register  ********************
defsym({I2C_SR2_MSL},                       0x0001)             dnl Master/Slave
defsym({I2C_SR2_BUSY},                      0x0002)             dnl Bus Busy
defsym({I2C_SR2_TRA},                       0x0004)             dnl Transmitter/Receiver
defsym({I2C_SR2_GENCALL},                   0x0010)             dnl General Call Address (Slave mode)
defsym({I2C_SR2_SMBDEFAULT},                0x0020)             dnl SMBus Device Default Address (Slave mode)
defsym({I2C_SR2_SMBHOST},                   0x0040)             dnl SMBus Host Header (Slave mode)
defsym({I2C_SR2_DUALF},                     0x0080)             dnl Dual Flag (Slave mode)
defmask({I2C_SR2_PEC},                      8, 8)               dnl Packet Error Checking Register

dnl *******************  Bit definition for I2C_CCR register  ********************
defmask({I2C_CCR_CCR},                      0, 12)              dnl Clock Control Register in Fast/Standard mode (Master mode)
defsym({I2C_CCR_DUTY},                      0x4000)             dnl Fast Mode Duty Cycle
defsym({I2C_CCR_FS},                        0x8000)             dnl I2C Master Mode Selection

dnl ******************  Bit definition for I2C_TRISE register  *******************
defsym({I2C_TRISE_TRISE},                   0x3F)               dnl Maximum Rise Time in Fast/Standard mode (Master mode)

dnl ******************************************************************************
dnl
dnl         Universal Synchronous Asynchronous Receiver Transmitter
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for USART_SR register  *******************
defsym({USART_SR_PE},                       0x0001)             dnl Parity Error
defsym({USART_SR_FE},                       0x0002)             dnl Framing Error
defsym({USART_SR_NE},                       0x0004)             dnl Noise Error Flag
defsym({USART_SR_ORE},                      0x0008)             dnl OverRun Error
defsym({USART_SR_IDLE},                     0x0010)             dnl IDLE line detected
defsym({USART_SR_RXNE},                     0x0020)             dnl Read Data Register Not Empty
defsym({USART_SR_TC},                       0x0040)             dnl Transmission Complete
defsym({USART_SR_TXE},                      0x0080)             dnl Transmit Data Register Empty
defsym({USART_SR_LBD},                      0x0100)             dnl LIN Break Detection Flag
defsym({USART_SR_CTS},                      0x0200)             dnl CTS Flag

dnl *******************  Bit definition for USART_DR register  *******************
defmask({USART_DR_DR},                      0, 9)               dnl Data value

dnl ******************  Bit definition for USART_BRR register  *******************
defmask({USART_BRR_DIV_Fraction},           0, 4)               dnl Fraction of USARTDIV
defmask({USART_BRR_DIV_Mantissa},           4, 12)              dnl Mantissa of USARTDIV

dnl ******************  Bit definition for USART_CR1 register  *******************
defsym({USART_CR1_SBK},                     0x0001)             dnl Send Break
defsym({USART_CR1_RWU},                     0x0002)             dnl Receiver wakeup
defsym({USART_CR1_RE},                      0x0004)             dnl Receiver Enable
defsym({USART_CR1_TE},                      0x0008)             dnl Transmitter Enable
defsym({USART_CR1_IDLEIE},                  0x0010)             dnl IDLE Interrupt Enable
defsym({USART_CR1_RXNEIE},                  0x0020)             dnl RXNE Interrupt Enable
defsym({USART_CR1_TCIE},                    0x0040)             dnl Transmission Complete Interrupt Enable
defsym({USART_CR1_TXEIE},                   0x0080)             dnl PE Interrupt Enable
defsym({USART_CR1_PEIE},                    0x0100)             dnl PE Interrupt Enable
defsym({USART_CR1_PS},                      0x0200)             dnl Parity Selection
defsym({USART_CR1_PCE},                     0x0400)             dnl Parity Control Enable
defsym({USART_CR1_WAKE},                    0x0800)             dnl Wakeup method
defsym({USART_CR1_M},                       0x1000)             dnl Word length
defsym({USART_CR1_UE},                      0x2000)             dnl USART Enable
defsym({USART_CR1_OVER8},                   0x8000)             dnl USART Oversampling 8-bits

dnl ******************  Bit definition for USART_CR2 register  *******************
defmask({USART_CR2_ADD},                    0, 4)               dnl Address of the USART node
defsym({USART_CR2_LBDL},                    0x0020)             dnl LIN Break Detection Length
defsym({USART_CR2_LBDIE},                   0x0040)             dnl LIN Break Detection Interrupt Enable
defsym({USART_CR2_LBCL},                    0x0100)             dnl Last Bit Clock pulse
defsym({USART_CR2_CPHA},                    0x0200)             dnl Clock Phase
defsym({USART_CR2_CPOL},                    0x0400)             dnl Clock Polarity
defsym({USART_CR2_CLKEN},                   0x0800)             dnl Clock Enable

defmask({USART_CR2_STOP},                   12, 2)              dnl STOP[1:0] bits (STOP bits)
defsym({USART_CR2_LINEN},                   0x4000)             dnl LIN mode enable

dnl ******************  Bit definition for USART_CR3 register  *******************
defsym({USART_CR3_EIE},                     0x0001)             dnl Error Interrupt Enable
defsym({USART_CR3_IREN},                    0x0002)             dnl IrDA mode Enable
defsym({USART_CR3_IRLP},                    0x0004)             dnl IrDA Low-Power
defsym({USART_CR3_HDSEL},                   0x0008)             dnl Half-Duplex Selection
defsym({USART_CR3_NACK},                    0x0010)             dnl Smartcard NACK enable
defsym({USART_CR3_SCEN},                    0x0020)             dnl Smartcard mode enable
defsym({USART_CR3_DMAR},                    0x0040)             dnl DMA Enable Receiver
defsym({USART_CR3_DMAT},                    0x0080)             dnl DMA Enable Transmitter
defsym({USART_CR3_RTSE},                    0x0100)             dnl RTS Enable
defsym({USART_CR3_CTSE},                    0x0200)             dnl CTS Enable
defsym({USART_CR3_CTSIE},                   0x0400)             dnl CTS Interrupt Enable
defsym({USART_CR3_ONEBIT},                  0x0800)             dnl One Bit method

dnl ******************  Bit definition for USART_GTPR register  ******************
defmask({USART_GTPR_PSC},                   0, 8)               dnl PSC[7:0] bits (Prescaler value)
defmask({USART_GTPR_GT},                    8, 8)               dnl Guard time value

dnl ******************************************************************************
dnl
dnl                                 Debug MCU
dnl
dnl ******************************************************************************

dnl ****************  Bit definition for DBGMCU_IDCODE register  *****************
defmask({DBGMCU_IDCODE_DEV_ID},             0, 24)              dnl Device Identifier
defmask({DBGMCU_IDCODE_REV_ID},             16, 16)             dnl REV_ID[15:0] bits (Revision Identifier)

dnl ******************  Bit definition for DBGMCU_CR register  *******************
defsym({DBGMCU_CR_DBG_SLEEP},               0x00000001)         dnl Debug Sleep Mode
defsym({DBGMCU_CR_DBG_STOP},                0x00000002)         dnl Debug Stop Mode
defsym({DBGMCU_CR_DBG_STANDBY},             0x00000004)         dnl Debug Standby mode
defsym({DBGMCU_CR_TRACE_IOEN},              0x00000020)         dnl Trace Pin Assignment Control

defmask({DBGMCU_CR_TRACE_MODE},             6, 2)               dnl TRACE_MODE[1:0] bits (Trace Pin Assignment Control)

defsym({DBGMCU_CR_DBG_IWDG_STOP},           0x00000100)         dnl Debug Independent Watchdog stopped when Core is halted
defsym({DBGMCU_CR_DBG_WWDG_STOP},           0x00000200)         dnl Debug Window Watchdog stopped when Core is halted
defsym({DBGMCU_CR_DBG_TIM1_STOP},           0x00000400)         dnl TIM1 counter stopped when core is halted
defsym({DBGMCU_CR_DBG_TIM2_STOP},           0x00000800)         dnl TIM2 counter stopped when core is halted
defsym({DBGMCU_CR_DBG_TIM3_STOP},           0x00001000)         dnl TIM3 counter stopped when core is halted
defsym({DBGMCU_CR_DBG_TIM4_STOP},           0x00002000)         dnl TIM4 counter stopped when core is halted
defsym({DBGMCU_CR_DBG_CAN1_STOP},           0x00004000)         dnl Debug CAN1 stopped when Core is halted
defsym({DBGMCU_CR_DBG_I2C1_SMBUS_TIMEOUT},  0x00008000)         dnl SMBUS timeout mode stopped when Core is halted
defsym({DBGMCU_CR_DBG_I2C2_SMBUS_TIMEOUT},  0x00010000)         dnl SMBUS timeout mode stopped when Core is halted
defsym({DBGMCU_CR_DBG_TIM8_STOP},           0x00020000)         dnl TIM8 counter stopped when core is halted
defsym({DBGMCU_CR_DBG_TIM5_STOP},           0x00040000)         dnl TIM5 counter stopped when core is halted
defsym({DBGMCU_CR_DBG_TIM6_STOP},           0x00080000)         dnl TIM6 counter stopped when core is halted
defsym({DBGMCU_CR_DBG_TIM7_STOP},           0x00100000)         dnl TIM7 counter stopped when core is halted
defsym({DBGMCU_CR_DBG_CAN2_STOP},           0x00200000)         dnl Debug CAN2 stopped when Core is halted
defsym({DBGMCU_CR_DBG_TIM15_STOP},          0x00400000)         dnl Debug TIM15 stopped when Core is halted
defsym({DBGMCU_CR_DBG_TIM16_STOP},          0x00800000)         dnl Debug TIM16 stopped when Core is halted
defsym({DBGMCU_CR_DBG_TIM17_STOP},          0x01000000)         dnl Debug TIM17 stopped when Core is halted
defsym({DBGMCU_CR_DBG_TIM12_STOP},          0x02000000)         dnl Debug TIM12 stopped when Core is halted
defsym({DBGMCU_CR_DBG_TIM13_STOP},          0x04000000)         dnl Debug TIM13 stopped when Core is halted
defsym({DBGMCU_CR_DBG_TIM14_STOP},          0x08000000)         dnl Debug TIM14 stopped when Core is halted
defsym({DBGMCU_CR_DBG_TIM9_STOP},           0x10000000)         dnl Debug TIM9 stopped when Core is halted
defsym({DBGMCU_CR_DBG_TIM10_STOP},          0x20000000)         dnl Debug TIM10 stopped when Core is halted
defsym({DBGMCU_CR_DBG_TIM11_STOP},          0x40000000)         dnl Debug TIM11 stopped when Core is halted

dnl ******************************************************************************
dnl
dnl                      FLASH and Option Bytes Registers
dnl
dnl ******************************************************************************

dnl *******************  Bit definition for FLASH_ACR register  ******************
defmask({FLASH_ACR_LATENCY},                0, 3)               dnl LATENCY[2:0] bits (Latency)
defsym({FLASH_ACR_HLFCYA},                  0x08)               dnl Flash Half Cycle Access Enable
defsym({FLASH_ACR_PRFTBE},                  0x10)               dnl Prefetch Buffer Enable
defsym({FLASH_ACR_PRFTBS},                  0x20)               dnl Prefetch Buffer Status

dnl ******************  Bit definition for FLASH_KEYR register  ******************
defmask({FLASH_KEYR_FKEYR},                 0, 32)              dnl FPEC Key

dnl *****************  Bit definition for FLASH_OPTKEYR register  ****************
defmask({FLASH_OPTKEYR_OPTKEYR},            0, 32)              dnl Option Byte Key

dnl ******************  Bit definition for FLASH_SR register  *******************
defsym({FLASH_SR_BSY},                      0x01)               dnl Busy
defsym({FLASH_SR_PGERR},                    0x04)               dnl Programming Error
defsym({FLASH_SR_WRPRTERR},                 0x10)               dnl Write Protection Error
defsym({FLASH_SR_EOP},                      0x20)               dnl End of operation

dnl *******************  Bit definition for FLASH_CR register  *******************
defsym({FLASH_CR_PG},                       0x0001)             dnl Programming
defsym({FLASH_CR_PER},                      0x0002)             dnl Page Erase
defsym({FLASH_CR_MER},                      0x0004)             dnl Mass Erase
defsym({FLASH_CR_OPTPG},                    0x0010)             dnl Option Byte Programming
defsym({FLASH_CR_OPTER},                    0x0020)             dnl Option Byte Erase
defsym({FLASH_CR_STRT},                     0x0040)             dnl Start
defsym({FLASH_CR_LOCK},                     0x0080)             dnl Lock
defsym({FLASH_CR_OPTWRE},                   0x0200)             dnl Option Bytes Write Enable
defsym({FLASH_CR_ERRIE},                    0x0400)             dnl Error Interrupt Enable
defsym({FLASH_CR_EOPIE},                    0x1000)             dnl End of operation interrupt enable

dnl *******************  Bit definition for FLASH_AR register  *******************
defmask({FLASH_AR_FAR},                     0, 32)              dnl Flash Address

dnl ******************  Bit definition for FLASH_OBR register  *******************
defsym({FLASH_OBR_OPTERR},                  0x0001)             dnl Option Byte Error
defsym({FLASH_OBR_RDPRT},                   0x0002)             dnl Read protection

defsym({FLASH_OBR_USER},                    0x03FC)             dnl User Option Bytes
defsym({FLASH_OBR_WDG_SW},                  0x0004)             dnl WDG_SW
defsym({FLASH_OBR_nRST_STOP},               0x0008)             dnl nRST_STOP
defsym({FLASH_OBR_nRST_STDBY},              0x0010)             dnl nRST_STDBY
defsym({FLASH_OBR_BFB2},                    0x0020)             dnl BFB2

dnl ******************  Bit definition for FLASH_WRPR register  ******************
defmask({FLASH_WRPR_WRP},                   0, 32)              dnl Write Protect

dnl ******************  Bit definition for FLASH_RDP register  *******************
defmask({FLASH_RDP_RDP},                    0, 8)               dnl Read protection option byte
defmask({FLASH_RDP_nRDP},                   8, 8)               dnl Read protection complemented option byte

dnl ******************  Bit definition for FLASH_USER register  ******************
defmask({FLASH_USER_USER},                  16, 8)              dnl User option byte
defmask({FLASH_USER_nUSER},                 24, 8)              dnl User complemented option byte

dnl ******************  Bit definition for FLASH_Data0 register  *****************
defmask({FLASH_Data0_Data0},                0, 8)               dnl User data storage option byte
defmask({FLASH_Data0_nData0},               8, 8)               dnl User data storage complemented option byte

dnl ******************  Bit definition for FLASH_Data1 register  *****************
defmask({FLASH_Data1_Data1},                16, 8)              dnl User data storage option byte
defmask({FLASH_Data1_nData1},               24, 8)              dnl User data storage complemented option byte

dnl ******************  Bit definition for FLASH_WRP0 register  ******************
defmask({FLASH_WRP0_WRP0},                  0, 8)               dnl Flash memory write protection option bytes
defmask({FLASH_WRP0_nWRP0},                 8, 8)               dnl Flash memory write protection complemented option bytes

dnl ******************  Bit definition for FLASH_WRP1 register  ******************
defmask({FLASH_WRP1_WRP1},                  16, 8)              dnl Flash memory write protection option bytes
defmask({FLASH_WRP1_nWRP1},                 24, 8)              dnl Flash memory write protection complemented option bytes

dnl ******************  Bit definition for FLASH_WRP2 register  ******************
defmask({FLASH_WRP2_WRP2},                  0, 8)               dnl Flash memory write protection option bytes
defmask({FLASH_WRP2_nWRP2},                 8, 8)               dnl Flash memory write protection complemented option bytes

dnl ******************  Bit definition for FLASH_WRP3 register  ******************
defmask({FLASH_WRP3_WRP3},                  16, 8)              dnl Flash memory write protection option bytes
defmask({FLASH_WRP3_nWRP3},                 24, 8)              dnl Flash memory write protection complemented option bytes

dnl ******************************************************************************
dnl                Ethernet MAC Registers bits definitions
dnl ******************************************************************************
dnl Bit definition for Ethernet MAC Control Register register
defsym({ETH_MACCR_WD},                      0x00800000)         dnl Watchdog disable
defsym({ETH_MACCR_JD},                      0x00400000)         dnl Jabber disable
defsym({ETH_MACCR_IFG},                     0x000E0000)         dnl Inter-frame gap
defsym({ETH_MACCR_IFG_96Bit},               0x00000000)         dnl Minimum IFG between frames during transmission is 96Bit
defsym({ETH_MACCR_IFG_88Bit},               0x00020000)         dnl Minimum IFG between frames during transmission is 88Bit
defsym({ETH_MACCR_IFG_80Bit},               0x00040000)         dnl Minimum IFG between frames during transmission is 80Bit
defsym({ETH_MACCR_IFG_72Bit},               0x00060000)         dnl Minimum IFG between frames during transmission is 72Bit
defsym({ETH_MACCR_IFG_64Bit},               0x00080000)         dnl Minimum IFG between frames during transmission is 64Bit
defsym({ETH_MACCR_IFG_56Bit},               0x000A0000)         dnl Minimum IFG between frames during transmission is 56Bit
defsym({ETH_MACCR_IFG_48Bit},               0x000C0000)         dnl Minimum IFG between frames during transmission is 48Bit
defsym({ETH_MACCR_IFG_40Bit},               0x000E0000)         dnl Minimum IFG between frames during transmission is 40Bit
defsym({ETH_MACCR_CSD},                     0x00010000)         dnl Carrier sense disable (during transmission)
defsym({ETH_MACCR_FES},                     0x00004000)         dnl Fast ethernet speed
defsym({ETH_MACCR_ROD},                     0x00002000)         dnl Receive own disable
defsym({ETH_MACCR_LM},                      0x00001000)         dnl loopback mode
defsym({ETH_MACCR_DM},                      0x00000800)         dnl Duplex mode
defsym({ETH_MACCR_IPCO},                    0x00000400)         dnl IP Checksum offload
defsym({ETH_MACCR_RD},                      0x00000200)         dnl Retry disable
defsym({ETH_MACCR_APCS},                    0x00000080)         dnl Automatic Pad/CRC stripping
defsym({ETH_MACCR_BL},                      0x00000060)         dnl Back-off limit: random integer number (r) of slot time delays before rescheduling a transmission attempt during retries after a collision: 0 =< r <2^k
defsym({ETH_MACCR_BL_10},                   0x00000000)         dnl k = min (n, 10)
defsym({ETH_MACCR_BL_8},                    0x00000020)         dnl k = min (n, 8)
defsym({ETH_MACCR_BL_4},                    0x00000040)         dnl k = min (n, 4)
defsym({ETH_MACCR_BL_1},                    0x00000060)         dnl k = min (n, 1)
defsym({ETH_MACCR_DC},                      0x00000010)         dnl Defferal check
defsym({ETH_MACCR_TE},                      0x00000008)         dnl Transmitter enable
defsym({ETH_MACCR_RE},                      0x00000004)         dnl Receiver enable

dnl Bit definition for Ethernet MAC Frame Filter Register
defsym({ETH_MACFFR_RA},                     0x80000000)         dnl Receive all
defsym({ETH_MACFFR_HPF},                    0x00000400)         dnl Hash or perfect filter
defsym({ETH_MACFFR_SAF},                    0x00000200)         dnl Source address filter enable
defsym({ETH_MACFFR_SAIF},                   0x00000100)         dnl SA inverse filtering
defmask({ETH_MACFFR_PCF},                   6, 2)               dnl Pass control frames: 3 cases
defsym({ETH_MACFFR_PCF_BlockAll},           0x00000040)         dnl MAC filters all control frames from reaching the application
defsym({ETH_MACFFR_PCF_ForwardAll},         0x00000080)         dnl MAC forwards all control frames to application even if they fail the Address Filter
defsym({ETH_MACFFR_PCF_ForwardPassedAddrFilter},                                        0x000000C0)             dnl MAC forwards control frames that pass the Address Filter.
defsym({ETH_MACFFR_BFD},                    0x00000020)         dnl Broadcast frame disable
defsym({ETH_MACFFR_PAM},                    0x00000010)         dnl Pass all mutlicast
defsym({ETH_MACFFR_DAIF},                   0x00000008)         dnl DA Inverse filtering
defsym({ETH_MACFFR_HM},                     0x00000004)         dnl Hash multicast
defsym({ETH_MACFFR_HU},                     0x00000002)         dnl Hash unicast
defsym({ETH_MACFFR_PM},                     0x00000001)         dnl Promiscuous mode

dnl Bit definition for Ethernet MAC Hash Table High Register
defmask({ETH_MACHTHR_HTH},                  0, 32)              dnl Hash table high

dnl Bit definition for Ethernet MAC Hash Table Low Register
defmask({ETH_MACHTLR_HTL},                  0, 32)              dnl Hash table low

dnl Bit definition for Ethernet MAC MII Address Register
defmask({ETH_MACMIIAR_PA},                  11, 5)              dnl Physical layer address
defmask({ETH_MACMIIAR_MR},                  6, 5)               dnl MII register in the selected PHY
defmask({ETH_MACMIIAR_CR},                  2, 3)               dnl CR clock range: 6 cases
defsym({ETH_MACMIIAR_CR_Div42},             0x00000000)         dnl HCLK:60-72 MHz; MDC clock= HCLK/42
defsym({ETH_MACMIIAR_CR_Div16},             0x00000008)         dnl HCLK:20-35 MHz; MDC clock= HCLK/16
defsym({ETH_MACMIIAR_CR_Div26},             0x0000000C)         dnl HCLK:35-60 MHz; MDC clock= HCLK/26
defsym({ETH_MACMIIAR_MW},                   0x00000002)         dnl MII write
defsym({ETH_MACMIIAR_MB},                   0x00000001)         dnl MII busy

dnl Bit definition for Ethernet MAC MII Data Register
defmask({ETH_MACMIIDR_MD},                  0, 16)              dnl MII data: read/write data from/to PHY

dnl Bit definition for Ethernet MAC Flow Control Register
defmask({ETH_MACFCR_PT},                    16, 16)             dnl Pause time
defsym({ETH_MACFCR_ZQPD},                   0x00000080)         dnl Zero-quanta pause disable
defmask({ETH_MACFCR_PLT},                   4, 2)               dnl Pause low threshold: 4 cases
defsym({ETH_MACFCR_PLT_Minus4},             0x00000000)         dnl Pause time minus 4 slot times
defsym({ETH_MACFCR_PLT_Minus28},            0x00000010)         dnl Pause time minus 28 slot times
defsym({ETH_MACFCR_PLT_Minus144},           0x00000020)         dnl Pause time minus 144 slot times
defsym({ETH_MACFCR_PLT_Minus256},           0x00000030)         dnl Pause time minus 256 slot times
defsym({ETH_MACFCR_UPFD},                   0x00000008)         dnl Unicast pause frame detect
defsym({ETH_MACFCR_RFCE},                   0x00000004)         dnl Receive flow control enable
defsym({ETH_MACFCR_TFCE},                   0x00000002)         dnl Transmit flow control enable
defsym({ETH_MACFCR_FCBBPA},                 0x00000001)         dnl Flow control busy/backpressure activate

dnl Bit definition for Ethernet MAC VLAN Tag Register
defsym({ETH_MACVLANTR_VLANTC},              0x00010000)         dnl 12-bit VLAN tag comparison
defmask({ETH_MACVLANTR_VLANTI},             0, 16)              dnl VLAN tag identifier (for receive frames)

dnl Bit definition for Ethernet MAC Remote Wake-UpFrame Filter Register
defmask({ETH_MACRWUFFR_D},                  0, 32)              dnl Wake-up frame filter register data
dnl Eight sequential Writes to this address (offset 0x28) will write all Wake-UpFrame Filter Registers.
dnl Eight sequential Reads from this address (offset 0x28) will read all Wake-UpFrame Filter Registers.
dnl Wake-UpFrame Filter Reg0 : Filter 0 Byte Mask
dnl Wake-UpFrame Filter Reg1 : Filter 1 Byte Mask
dnl Wake-UpFrame Filter Reg2 : Filter 2 Byte Mask
dnl Wake-UpFrame Filter Reg3 : Filter 3 Byte Mask
dnl Wake-UpFrame Filter Reg4 : RSVD - Filter3 Command - RSVD - Filter2 Command -
dnl                            RSVD - Filter1 Command - RSVD - Filter0 Command
dnl Wake-UpFrame Filter Re5 : Filter3 Offset - Filter2 Offset - Filter1 Offset - Filter0 Offset
dnl Wake-UpFrame Filter Re6 : Filter1 CRC16 - Filter0 CRC16
dnl Wake-UpFrame Filter Re7 : Filter3 CRC16 - Filter2 CRC16

dnl Bit definition for Ethernet MAC PMT Control and Status Register
defsym({ETH_MACPMTCSR_WFFRPR},              0x80000000)         dnl Wake-Up Frame Filter Register Pointer Reset
defsym({ETH_MACPMTCSR_GU},                  0x00000200)         dnl Global Unicast
defsym({ETH_MACPMTCSR_WFR},                 0x00000040)         dnl Wake-Up Frame Received
defsym({ETH_MACPMTCSR_MPR},                 0x00000020)         dnl Magic Packet Received
defsym({ETH_MACPMTCSR_WFE},                 0x00000004)         dnl Wake-Up Frame Enable
defsym({ETH_MACPMTCSR_MPE},                 0x00000002)         dnl Magic Packet Enable
defsym({ETH_MACPMTCSR_PD},                  0x00000001)         dnl Power Down

dnl Bit definition for Ethernet MAC Status Register
defsym({ETH_MACSR_TSTS},                    0x00000200)         dnl Time stamp trigger status
defsym({ETH_MACSR_MMCTS},                   0x00000040)         dnl MMC transmit status
defsym({ETH_MACSR_MMMCRS},                  0x00000020)         dnl MMC receive status
defsym({ETH_MACSR_MMCS},                    0x00000010)         dnl MMC status
defsym({ETH_MACSR_PMTS},                    0x00000008)         dnl PMT status

dnl Bit definition for Ethernet MAC Interrupt Mask Register
defsym({ETH_MACIMR_TSTIM},                  0x00000200)         dnl Time stamp trigger interrupt mask
defsym({ETH_MACIMR_PMTIM},                  0x00000008)         dnl PMT interrupt mask

dnl Bit definition for Ethernet MAC Address0 High Register
defmask({ETH_MACA0HR_MACA0H},               0, 16)              dnl MAC address0 high

dnl Bit definition for Ethernet MAC Address0 Low Register
defmask({ETH_MACA0LR_MACA0L},               0, 32)              dnl MAC address0 low

dnl Bit definition for Ethernet MAC Address1 High Register
defsym({ETH_MACA1HR_AE},                    0x80000000)         dnl Address enable
defsym({ETH_MACA1HR_SA},                    0x40000000)         dnl Source address
defmask({ETH_MACA1HR_MBC},                  24, 6)              dnl Mask byte control: bits to mask for comparison of the MAC Address bytes
defmask({ETH_MACA1HR_MBC},                  24, 6)              dnl Mask byte control: bits to mask for comparison of the MAC Address bytes
defsym({ETH_MACA1HR_MBC_HBits15_8},         0x20000000)         dnl Mask MAC Address high reg bits [15:8]
defsym({ETH_MACA1HR_MBC_HBits7_0},          0x10000000)         dnl Mask MAC Address high reg bits [7:0]
defsym({ETH_MACA1HR_MBC_LBits31_24},        0x08000000)         dnl Mask MAC Address low reg bits [31:24]
defsym({ETH_MACA1HR_MBC_LBits23_16},        0x04000000)         dnl Mask MAC Address low reg bits [23:16]
defsym({ETH_MACA1HR_MBC_LBits15_8},         0x02000000)         dnl Mask MAC Address low reg bits [15:8]
defsym({ETH_MACA1HR_MBC_LBits7_0},          0x01000000)         dnl Mask MAC Address low reg bits [7:0]
defmask({ETH_MACA1HR_MACA1H},               0, 16)              dnl MAC address1 high

dnl Bit definition for Ethernet MAC Address1 Low Register
defmask({ETH_MACA1LR_MACA1L},               0, 32)              dnl MAC address1 low

dnl Bit definition for Ethernet MAC Address2 High Register
defsym({ETH_MACA2HR_AE},                    0x80000000)         dnl Address enable
defsym({ETH_MACA2HR_SA},                    0x40000000)         dnl Source address
defsym({ETH_MACA2HR_MBC},                   0x3F000000)         dnl Mask byte control
defsym({ETH_MACA2HR_MBC_HBits15_8},         0x20000000)         dnl Mask MAC Address high reg bits [15:8]
defsym({ETH_MACA2HR_MBC_HBits7_0},          0x10000000)         dnl Mask MAC Address high reg bits [7:0]
defsym({ETH_MACA2HR_MBC_LBits31_24},        0x08000000)         dnl Mask MAC Address low reg bits [31:24]
defsym({ETH_MACA2HR_MBC_LBits23_16},        0x04000000)         dnl Mask MAC Address low reg bits [23:16]
defsym({ETH_MACA2HR_MBC_LBits15_8},         0x02000000)         dnl Mask MAC Address low reg bits [15:8]
defsym({ETH_MACA2HR_MBC_LBits7_0},          0x01000000)         dnl Mask MAC Address low reg bits [70]
defmask({ETH_MACA2HR_MACA2H},               0, 16)              dnl MAC address1 high

dnl Bit definition for Ethernet MAC Address2 Low Register
defmask({ETH_MACA2LR_MACA2L},               0, 32)              dnl MAC address2 low

dnl Bit definition for Ethernet MAC Address3 High Register
defsym({ETH_MACA3HR_AE},                    0x80000000)         dnl Address enable
defsym({ETH_MACA3HR_SA},                    0x40000000)         dnl Source address
defsym({ETH_MACA3HR_MBC},                   0x3F000000)         dnl Mask byte control
defsym({ETH_MACA3HR_MBC_HBits15_8},         0x20000000)         dnl Mask MAC Address high reg bits [15:8]
defsym({ETH_MACA3HR_MBC_HBits7_0},          0x10000000)         dnl Mask MAC Address high reg bits [7:0]
defsym({ETH_MACA3HR_MBC_LBits31_24},        0x08000000)         dnl Mask MAC Address low reg bits [31:24]
defsym({ETH_MACA3HR_MBC_LBits23_16},        0x04000000)         dnl Mask MAC Address low reg bits [23:16]
defsym({ETH_MACA3HR_MBC_LBits15_8},         0x02000000)         dnl Mask MAC Address low reg bits [15:8]
defsym({ETH_MACA3HR_MBC_LBits7_0},          0x01000000)         dnl Mask MAC Address low reg bits [70]
defmask({ETH_MACA3HR_MACA3H},               0, 16)              dnl MAC address3 high

dnl Bit definition for Ethernet MAC Address3 Low Register
defmask({ETH_MACA3LR_MACA3L},               0, 32)              dnl MAC address3 low

dnl ******************************************************************************
dnl                Ethernet MMC Registers bits definition
dnl ******************************************************************************

dnl Bit definition for Ethernet MMC Contol Register
defsym({ETH_MMCCR_MCF},                     0x00000008)         dnl MMC Counter Freeze
defsym({ETH_MMCCR_ROR},                     0x00000004)         dnl Reset on Read
defsym({ETH_MMCCR_CSR},                     0x00000002)         dnl Counter Stop Rollover
defsym({ETH_MMCCR_CR},                      0x00000001)         dnl Counters Reset

dnl Bit definition for Ethernet MMC Receive Interrupt Register
defsym({ETH_MMCRIR_RGUFS},                  0x00020000)         dnl Set when Rx good unicast frames counter reaches half the maximum value
defsym({ETH_MMCRIR_RFAES},                  0x00000040)         dnl Set when Rx alignment error counter reaches half the maximum value
defsym({ETH_MMCRIR_RFCES},                  0x00000020)         dnl Set when Rx crc error counter reaches half the maximum value

dnl Bit definition for Ethernet MMC Transmit Interrupt Register
defsym({ETH_MMCTIR_TGFS},                   0x00200000)         dnl Set when Tx good frame count counter reaches half the maximum value
defsym({ETH_MMCTIR_TGFMSCS},                0x00008000)         dnl Set when Tx good multi col counter reaches half the maximum value
defsym({ETH_MMCTIR_TGFSCS},                 0x00004000)         dnl Set when Tx good single col counter reaches half the maximum value

dnl Bit definition for Ethernet MMC Receive Interrupt Mask Register
defsym({ETH_MMCRIMR_RGUFM},                 0x00020000)         dnl Mask the interrupt when Rx good unicast frames counter reaches half the maximum value
defsym({ETH_MMCRIMR_RFAEM},                 0x00000040)         dnl Mask the interrupt when when Rx alignment error counter reaches half the maximum value
defsym({ETH_MMCRIMR_RFCEM},                 0x00000020)         dnl Mask the interrupt when Rx crc error counter reaches half the maximum value

dnl Bit definition for Ethernet MMC Transmit Interrupt Mask Register
defsym({ETH_MMCTIMR_TGFM},                  0x00200000)         dnl Mask the interrupt when Tx good frame count counter reaches half the maximum value
defsym({ETH_MMCTIMR_TGFMSCM},               0x00008000)         dnl Mask the interrupt when Tx good multi col counter reaches half the maximum value
defsym({ETH_MMCTIMR_TGFSCM},                0x00004000)         dnl Mask the interrupt when Tx good single col counter reaches half the maximum value

dnl Bit definition for Ethernet MMC Transmitted Good Frames after Single Collision Counter Register
defmask({ETH_MMCTGFSCCR_TGFSCC},            0, 32)              dnl Number of successfully transmitted frames after a single collision in Half-duplex mode.

dnl Bit definition for Ethernet MMC Transmitted Good Frames after More than a Single Collision Counter Register
defmask({ETH_MMCTGFMSCCR_TGFMSCC},          0, 32)              dnl Number of successfully transmitted frames after more than a single collision in Half-duplex mode.

dnl Bit definition for Ethernet MMC Transmitted Good Frames Counter Register
defmask({ETH_MMCTGFCR_TGFC},                0, 32)              dnl Number of good frames transmitted.

dnl Bit definition for Ethernet MMC Received Frames with CRC Error Counter Register
defmask({ETH_MMCRFCECR_RFCEC},              0, 32)              dnl Number of frames received with CRC error.

dnl Bit definition for Ethernet MMC Received Frames with Alignement Error Counter Register
defmask({ETH_MMCRFAECR_RFAEC},              0, 32)              dnl Number of frames received with alignment (dribble) error

dnl Bit definition for Ethernet MMC Received Good Unicast Frames Counter Register
defmask({ETH_MMCRGUFCR_RGUFC},              0, 32)              dnl Number of good unicast frames received.

dnl ******************************************************************************
dnl               Ethernet PTP Registers bits definition
dnl ******************************************************************************

dnl Bit definition for Ethernet PTP Time Stamp Contol Register
defsym({ETH_PTPTSCR_TSARU},                 0x00000020)         dnl Addend register update
defsym({ETH_PTPTSCR_TSITE},                 0x00000010)         dnl Time stamp interrupt trigger enable
defsym({ETH_PTPTSCR_TSSTU},                 0x00000008)         dnl Time stamp update
defsym({ETH_PTPTSCR_TSSTI},                 0x00000004)         dnl Time stamp initialize
defsym({ETH_PTPTSCR_TSFCU},                 0x00000002)         dnl Time stamp fine or coarse update
defsym({ETH_PTPTSCR_TSE},                   0x00000001)         dnl Time stamp enable

dnl Bit definition for Ethernet PTP Sub-Second Increment Register
defmask({ETH_PTPSSIR_STSSI},                0, 8)               dnl System time Sub-second increment value

dnl Bit definition for Ethernet PTP Time Stamp High Register
defmask({ETH_PTPTSHR_STS},                  0, 32)              dnl System Time second

dnl Bit definition for Ethernet PTP Time Stamp Low Register
defsym({ETH_PTPTSLR_STPNS},                 0x80000000)         dnl System Time Positive or negative time
defmask({ETH_PTPTSLR_STSS},                 0, 31)              dnl System Time sub-seconds

dnl Bit definition for Ethernet PTP Time Stamp High Update Register
defmask({ETH_PTPTSHUR_TSUS},                0, 32)              dnl Time stamp update seconds

dnl Bit definition for Ethernet PTP Time Stamp Low Update Register
defsym({ETH_PTPTSLUR_TSUPNS},               0x80000000)         dnl Time stamp update Positive or negative time
defsym({ETH_PTPTSLUR_TSUSS},                0x31)               dnl Time stamp update sub-seconds

dnl Bit definition for Ethernet PTP Time Stamp Addend Register
defmask({ETH_PTPTSAR_TSA},                  0, 32)              dnl Time stamp addend

dnl Bit definition for Ethernet PTP Target Time High Register
defmask({ETH_PTPTTHR_TTSH},                 0, 32)              dnl Target time stamp high

dnl Bit definition for Ethernet PTP Target Time Low Register
defmask({ETH_PTPTTLR_TTSL},                 0, 32)              dnl Target time stamp low

dnl ******************************************************************************
dnl                 Ethernet DMA Registers bits definition
dnl ******************************************************************************

dnl Bit definition for Ethernet DMA Bus Mode Register
defsym({ETH_DMABMR_AAB},                    0x02000000)         dnl Address-Aligned beats
defsym({ETH_DMABMR_FPM},                    0x01000000)         dnl 4xPBL mode
defsym({ETH_DMABMR_USP},                    0x00800000)         dnl Use separate PBL
defmask({ETH_DMABMR_RDP},                   17, 6)              dnl RxDMA PBL
defsym({ETH_DMABMR_RDP_1Beat},              0x00020000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 1
defsym({ETH_DMABMR_RDP_2Beat},              0x00040000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 2
defsym({ETH_DMABMR_RDP_4Beat},              0x00080000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 4
defsym({ETH_DMABMR_RDP_8Beat},              0x00100000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 8
defsym({ETH_DMABMR_RDP_16Beat},             0x00200000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 16
defsym({ETH_DMABMR_RDP_32Beat},             0x00400000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 32
defsym({ETH_DMABMR_RDP_4xPBL_4Beat},        0x01020000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 4
defsym({ETH_DMABMR_RDP_4xPBL_8Beat},        0x01040000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 8
defsym({ETH_DMABMR_RDP_4xPBL_16Beat},       0x01080000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 16
defsym({ETH_DMABMR_RDP_4xPBL_32Beat},       0x01100000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 32
defsym({ETH_DMABMR_RDP_4xPBL_64Beat},       0x01200000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 64
defsym({ETH_DMABMR_RDP_4xPBL_128Beat},      0x01400000)         dnl maximum number of beats to be transferred in one RxDMA transaction is 128
defsym({ETH_DMABMR_FB},                     0x00010000)         dnl Fixed Burst
defmask({ETH_DMABMR_RTPR},                  14, 2)              dnl Rx Tx priority ratio
defsym({ETH_DMABMR_RTPR_1_1},               0x00000000)         dnl Rx Tx priority ratio
defsym({ETH_DMABMR_RTPR_2_1},               0x00004000)         dnl Rx Tx priority ratio
defsym({ETH_DMABMR_RTPR_3_1},               0x00008000)         dnl Rx Tx priority ratio
defsym({ETH_DMABMR_RTPR_4_1},               0x0000C000)         dnl Rx Tx priority ratio
defmask({ETH_DMABMR_PBL},                   8, 6)               dnl Programmable burst length
defsym({ETH_DMABMR_PBL_1Beat},              0x00000100)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 1
defsym({ETH_DMABMR_PBL_2Beat},              0x00000200)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 2
defsym({ETH_DMABMR_PBL_4Beat},              0x00000400)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 4
defsym({ETH_DMABMR_PBL_8Beat},              0x00000800)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 8
defsym({ETH_DMABMR_PBL_16Beat},             0x00001000)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 16
defsym({ETH_DMABMR_PBL_32Beat},             0x00002000)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 32
defsym({ETH_DMABMR_PBL_4xPBL_4Beat},        0x01000100)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 4
defsym({ETH_DMABMR_PBL_4xPBL_8Beat},        0x01000200)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 8
defsym({ETH_DMABMR_PBL_4xPBL_16Beat},       0x01000400)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 16
defsym({ETH_DMABMR_PBL_4xPBL_32Beat},       0x01000800)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 32
defsym({ETH_DMABMR_PBL_4xPBL_64Beat},       0x01001000)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 64
defsym({ETH_DMABMR_PBL_4xPBL_128Beat},      0x01002000)         dnl maximum number of beats to be transferred in one TxDMA (or both) transaction is 128
defmask({ETH_DMABMR_DSL},                   2, 5)               dnl Descriptor Skip Length
defsym({ETH_DMABMR_DA},                     0x00000002)         dnl DMA arbitration scheme
defsym({ETH_DMABMR_SR},                     0x00000001)         dnl Software reset

dnl Bit definition for Ethernet DMA Transmit Poll Demand Register
defmask({ETH_DMATPDR_TPD},                  0, 32)              dnl Transmit poll demand

dnl Bit definition for Ethernet DMA Receive Poll Demand Register
defmask({ETH_DMARPDR_RPD},                  0, 32)              dnl Receive poll demand

dnl Bit definition for Ethernet DMA Receive Descriptor List Address Register
defmask({ETH_DMARDLAR_SRL},                 0, 32)              dnl Start of receive list

dnl Bit definition for Ethernet DMA Transmit Descriptor List Address Register
defmask({ETH_DMATDLAR_STL},                 0, 32)              dnl Start of transmit list

dnl Bit definition for Ethernet DMA Status Register
defsym({ETH_DMASR_TSTS},                    0x20000000)         dnl Time-stamp trigger status
defsym({ETH_DMASR_PMTS},                    0x10000000)         dnl PMT status
defsym({ETH_DMASR_MMCS},                    0x08000000)         dnl MMC status
defmask({ETH_DMASR_EBS},                    23, 3)              dnl Error bits status
dnl combination with EBS[2:0] for GetFlagStatus function
defsym({ETH_DMASR_EBS_DescAccess},          0x02000000)         dnl Error bits 0-data buffer, 1-desc. access
defsym({ETH_DMASR_EBS_ReadTransf},          0x01000000)         dnl Error bits 0-write trnsf, 1-read transfr
defsym({ETH_DMASR_EBS_DataTransfTx},        0x00800000)         dnl Error bits 0-Rx DMA, 1-Tx DMA
defmask({ETH_DMASR_TPS},                    20, 3)              dnl Transmit process state
defsym({ETH_DMASR_TPS_Stopped},             0x00000000)         dnl Stopped - Reset or Stop Tx Command issued
defsym({ETH_DMASR_TPS_Fetching},            0x00100000)         dnl Running - fetching the Tx descriptor
defsym({ETH_DMASR_TPS_Waiting},             0x00200000)         dnl Running - waiting for status
defsym({ETH_DMASR_TPS_Reading},             0x00300000)         dnl Running - reading the data from host memory
defsym({ETH_DMASR_TPS_Suspended},           0x00600000)         dnl Suspended - Tx Descriptor unavailabe
defsym({ETH_DMASR_TPS_Closing},             0x00700000)         dnl Running - closing Rx descriptor
defmask({ETH_DMASR_RPS},                    17, 3)              dnl Receive process state
defsym({ETH_DMASR_RPS_Stopped},             0x00000000)         dnl Stopped - Reset or Stop Rx Command issued
defsym({ETH_DMASR_RPS_Fetching},            0x00020000)         dnl Running - fetching the Rx descriptor
defsym({ETH_DMASR_RPS_Waiting},             0x00060000)         dnl Running - waiting for packet
defsym({ETH_DMASR_RPS_Suspended},           0x00080000)         dnl Suspended - Rx Descriptor unavailable
defsym({ETH_DMASR_RPS_Closing},             0x000A0000)         dnl Running - closing descriptor
defsym({ETH_DMASR_RPS_Queuing},             0x000E0000)         dnl Running - queuing the recieve frame into host memory
defsym({ETH_DMASR_NIS},                     0x00010000)         dnl Normal interrupt summary
defsym({ETH_DMASR_AIS},                     0x00008000)         dnl Abnormal interrupt summary
defsym({ETH_DMASR_ERS},                     0x00004000)         dnl Early receive status
defsym({ETH_DMASR_FBES},                    0x00002000)         dnl Fatal bus error status
defsym({ETH_DMASR_ETS},                     0x00000400)         dnl Early transmit status
defsym({ETH_DMASR_RWTS},                    0x00000200)         dnl Receive watchdog timeout status
defsym({ETH_DMASR_RPSS},                    0x00000100)         dnl Receive process stopped status
defsym({ETH_DMASR_RBUS},                    0x00000080)         dnl Receive buffer unavailable status
defsym({ETH_DMASR_RS},                      0x00000040)         dnl Receive status
defsym({ETH_DMASR_TUS},                     0x00000020)         dnl Transmit underflow status
defsym({ETH_DMASR_ROS},                     0x00000010)         dnl Receive overflow status
defsym({ETH_DMASR_TJTS},                    0x00000008)         dnl Transmit jabber timeout status
defsym({ETH_DMASR_TBUS},                    0x00000004)         dnl Transmit buffer unavailable status
defsym({ETH_DMASR_TPSS},                    0x00000002)         dnl Transmit process stopped status
defsym({ETH_DMASR_TS},                      0x00000001)         dnl Transmit status

dnl Bit definition for Ethernet DMA Operation Mode Register
defsym({ETH_DMAOMR_DTCEFD},                 0x04000000)         dnl Disable Dropping of TCP/IP checksum error frames
defsym({ETH_DMAOMR_RSF},                    0x02000000)         dnl Receive store and forward
defsym({ETH_DMAOMR_DFRF},                   0x01000000)         dnl Disable flushing of received frames
defsym({ETH_DMAOMR_TSF},                    0x00200000)         dnl Transmit store and forward
defsym({ETH_DMAOMR_FTF},                    0x00100000)         dnl Flush transmit FIFO
defmask({ETH_DMAOMR_TTC},                   14, 3)              dnl Transmit threshold control
defsym({ETH_DMAOMR_TTC_64Bytes},            0x00000000)         dnl threshold level of the MTL Transmit FIFO is 64 Bytes
defsym({ETH_DMAOMR_TTC_128Bytes},           0x00004000)         dnl threshold level of the MTL Transmit FIFO is 128 Bytes
defsym({ETH_DMAOMR_TTC_192Bytes},           0x00008000)         dnl threshold level of the MTL Transmit FIFO is 192 Bytes
defsym({ETH_DMAOMR_TTC_256Bytes},           0x0000C000)         dnl threshold level of the MTL Transmit FIFO is 256 Bytes
defsym({ETH_DMAOMR_TTC_40Bytes},            0x00010000)         dnl threshold level of the MTL Transmit FIFO is 40 Bytes
defsym({ETH_DMAOMR_TTC_32Bytes},            0x00014000)         dnl threshold level of the MTL Transmit FIFO is 32 Bytes
defsym({ETH_DMAOMR_TTC_24Bytes},            0x00018000)         dnl threshold level of the MTL Transmit FIFO is 24 Bytes
defsym({ETH_DMAOMR_TTC_16Bytes},            0x0001C000)         dnl threshold level of the MTL Transmit FIFO is 16 Bytes
defsym({ETH_DMAOMR_ST},                     0x00002000)         dnl Start/stop transmission command
defsym({ETH_DMAOMR_FEF},                    0x00000080)         dnl Forward error frames
defsym({ETH_DMAOMR_FUGF},                   0x00000040)         dnl Forward undersized good frames
defmask({ETH_DMAOMR_RTC},                   3, 2)               dnl receive threshold control
defsym({ETH_DMAOMR_RTC_64Bytes},            0x00000000)         dnl threshold level of the MTL Receive FIFO is 64 Bytes
defsym({ETH_DMAOMR_RTC_32Bytes},            0x00000008)         dnl threshold level of the MTL Receive FIFO is 32 Bytes
defsym({ETH_DMAOMR_RTC_96Bytes},            0x00000010)         dnl threshold level of the MTL Receive FIFO is 96 Bytes
defsym({ETH_DMAOMR_RTC_128Bytes},           0x00000018)         dnl threshold level of the MTL Receive FIFO is 128 Bytes
defsym({ETH_DMAOMR_OSF},                    0x00000004)         dnl operate on second frame
defsym({ETH_DMAOMR_SR},                     0x00000002)         dnl Start/stop receive

dnl Bit definition for Ethernet DMA Interrupt Enable Register
defsym({ETH_DMAIER_NISE},                   0x00010000)         dnl Normal interrupt summary enable
defsym({ETH_DMAIER_AISE},                   0x00008000)         dnl Abnormal interrupt summary enable
defsym({ETH_DMAIER_ERIE},                   0x00004000)         dnl Early receive interrupt enable
defsym({ETH_DMAIER_FBEIE},                  0x00002000)         dnl Fatal bus error interrupt enable
defsym({ETH_DMAIER_ETIE},                   0x00000400)         dnl Early transmit interrupt enable
defsym({ETH_DMAIER_RWTIE},                  0x00000200)         dnl Receive watchdog timeout interrupt enable
defsym({ETH_DMAIER_RPSIE},                  0x00000100)         dnl Receive process stopped interrupt enable
defsym({ETH_DMAIER_RBUIE},                  0x00000080)         dnl Receive buffer unavailable interrupt enable
defsym({ETH_DMAIER_RIE},                    0x00000040)         dnl Receive interrupt enable
defsym({ETH_DMAIER_TUIE},                   0x00000020)         dnl Transmit Underflow interrupt enable
defsym({ETH_DMAIER_ROIE},                   0x00000010)         dnl Receive Overflow interrupt enable
defsym({ETH_DMAIER_TJTIE},                  0x00000008)         dnl Transmit jabber timeout interrupt enable
defsym({ETH_DMAIER_TBUIE},                  0x00000004)         dnl Transmit buffer unavailable interrupt enable
defsym({ETH_DMAIER_TPSIE},                  0x00000002)         dnl Transmit process stopped interrupt enable
defsym({ETH_DMAIER_TIE},                    0x00000001)         dnl Transmit interrupt enable

dnl Bit definition for Ethernet DMA Missed Frame and Buffer Overflow Counter Register
defsym({ETH_DMAMFBOCR_OFOC},                0x10000000)         dnl Overflow bit for FIFO overflow counter
defmask({ETH_DMAMFBOCR_MFA},                17, 11)             dnl Number of frames missed by the application
defsym({ETH_DMAMFBOCR_OMFC},                0x00010000)         dnl Overflow bit for missed frame counter
defmask({ETH_DMAMFBOCR_MFC},                0, 16)              dnl Number of frames missed by the controller

dnl Bit definition for Ethernet DMA Current Host Transmit Descriptor Register
defmask({ETH_DMACHTDR_HTDAP},               0, 32)              dnl Host transmit descriptor address pointer

dnl Bit definition for Ethernet DMA Current Host Receive Descriptor Register
defmask({ETH_DMACHRDR_HRDAP},               0, 32)              dnl Host receive descriptor address pointer

dnl Bit definition for Ethernet DMA Current Host Transmit Buffer Address Register
defmask({ETH_DMACHTBAR_HTBAP},              0, 32)              dnl Host transmit buffer address pointer

dnl Bit definition for Ethernet DMA Current Host Receive Buffer Address Register
defmask({ETH_DMACHRBAR_HRBAP},              0, 32)              dnl Host receive buffer address pointer

dnl vim: set sw=4 ts=4 et:
