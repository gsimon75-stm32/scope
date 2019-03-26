#include <stm32f2xx.h>
#include <system_stm32f2xx.h>

InitialSP,               0,                  ARM7: Initial SP
Reset,                   1,                  ARM7: Reset
NonMaskableInt,          2,                  ARM7: Non Maskable Interrupt
HardFault,               3,                  ARM7: Hard Fault
MemoryManagement,        4,                  Cortex-M3 Memory Management Interrupt
BusFault,                5,                  Cortex-M3 Bus Fault Interrupt
UsageFault,              6,                  Cortex-M3 Usage Fault Interrupt
Reserved,                7,                  Cortex-M3 Reserved
Reserved,                8,                  Cortex-M3 Reserved
Reserved,                9,                  Cortex-M3 Reserved
Reserved,                10,                 Cortex-M3 Reserved
SVCall,                  11,                 Cortex-M3 SV Call Interrupt
DebugMonitor,            12,                 Cortex-M3 Debug Monitor Interrupt
Reserved,                13,                 Cortex-M3 Reserved
PendSV,                  14,                 Cortex-M3 Pend SV Interrupt
SysTick,                 15,                 Cortex-M3 System Tick Interrupt
WWDG,                    16,                 Window WatchDog Interrupt
PVD,                     17,                 PVD through EXTI Line detection Interrupt
TAMPER,                  18,                 Tamper Interrupt
RTC,                     19,                 RTC global Interrupt
FLASH,                   20,                 FLASH global Interrupt
RCC,                     21,                 RCC global Interrupt
EXTI0,                   22,                 EXTI Line0 Interrupt
EXTI1,                   23,                 EXTI Line1 Interrupt
EXTI2,                   24,                 EXTI Line2 Interrupt
EXTI3,                   25,                 EXTI Line3 Interrupt
EXTI4,                   26,                 EXTI Line4 Interrupt
DMA1_Channel1,           27,                 DMA1 Channel 1 global Interrupt
DMA1_Channel2,           28,                 DMA1 Channel 2 global Interrupt
DMA1_Channel3,           29,                 DMA1 Channel 3 global Interrupt
DMA1_Channel4,           30,                 DMA1 Channel 4 global Interrupt
DMA1_Channel5,           31,                 DMA1 Channel 5 global Interrupt
DMA1_Channel6,           32,                 DMA1 Channel 6 global Interrupt
DMA1_Channel7,           33,                 DMA1 Channel 7 global Interrupt
ADC1_2,                  34,                 ADC1 and ADC2 global Interrupt
USB_HP_CAN1_TX,          35,                 USB Device High Priority or CAN1 TX Interrupts
USB_LP_CAN1_RX0,         36,                 USB Device Low Priority or CAN1 RX0 Interrupts
CAN1_RX1,                37,                 CAN1 RX1 Interrupt
CAN1_SCE,                38,                 CAN1 SCE Interrupt
EXTI9_5,                 39,                 External Line[9:5] Interrupts
TIM1_BRK,                40,                 TIM1 Break Interrupt
TIM1_UP,                 41,                 TIM1 Update Interrupt
TIM1_TRG_COM,            42,                 TIM1 Trigger and Commutation Interrupt
TIM1_CC,                 43,                 TIM1 Capture Compare Interrupt
TIM2,                    44,                 TIM2 global Interrupt
TIM3,                    45,                 TIM3 global Interrupt
TIM4,                    46,                 TIM4 global Interrupt
I2C1_EV,                 47,                 I2C1 Event Interrupt
I2C1_ER,                 48,                 I2C1 Error Interrupt
I2C2_EV,                 49,                 I2C2 Event Interrupt
I2C2_ER,                 50,                 I2C2 Error Interrupt
SPI1,                    51,                 SPI1 global Interrupt
SPI2,                    52,                 SPI2 global Interrupt
USART1,                  53,                 USART1 global Interrupt
USART2,                  54,                 USART2 global Interrupt
USART3,                  55,                 USART3 global Interrupt
EXTI15_10,               56,                 External Line[15:10] Interrupts
RTCAlarm,                57,                 RTC Alarm through EXTI Line Interrupt
USBWakeUp,               58,                 USB Device WakeUp from suspend through EXTI Line Interrupt
TIM8_BRK,                59,                 TIM8 Break Interrupt
TIM8_UP,                 60,                 TIM8 Update Interrupt
TIM8_TRG_COM,            61,                 TIM8 Trigger and Commutation Interrupt
TIM8_CC,                 62,                 TIM8 Capture Compare Interrupt
ADC3,                    63,                 ADC3 global Interrupt
FSMC,                    64,                 FSMC global Interrupt
SDIO,                    65,                 SDIO global Interrupt
TIM5,                    66,                 TIM5 global Interrupt
SPI3,                    67,                 SPI3 global Interrupt
UART4,                   68,                 UART4 global Interrupt
UART5,                   69,                 UART5 global Interrupt
TIM7,                    71,                 TIM7 global Interrupt
DMA2_Channel1,           72,                 DMA2 Channel 1 global Interrupt
DMA2_Channel2,           73,                 DMA2 Channel 2 global Interrupt
DMA2_Channel3,           74,                 DMA2 Channel 3 global Interrupt
TIM6,                    70,                 TIM6 global Interrupt
DMA2_Channel4_5,         75,                 DMA2 Channel 4 and Channel 5 global Interrupt

/*
 * Special event handlers
 */
extern char _begin_data, _end_data, _end_text, _begin_bss, _end_bss, _begin_stack, _end_stack, _begin_rodata, _end_rodata;

__attribute__((interrupt)) void Reset_Handler(void);
void Reset_Handler(void) {
	while (1) {
		__asm volatile (
				"ldr r0,=_end_stack\n"
				"mov sp,r0\n"
				);
        {
            char *src, *dst;

            dst = &_begin_data;
            src = &_end_rodata;
            while (dst < &_end_data)
                *(dst++) = *(src++);

            dst = &_begin_bss;
            while (dst < &_end_bss)
                *(dst++) = 0;
        }
		SystemInit();
		main();
	}
}

__attribute__((interrupt,naked)) void DummyHandler(void);
void
DummyHandler(void) {
    __asm volatile (
            "bx lr\n"
            );
}

__attribute__((interrupt,naked)) void nakedHardFault_Handler(void);
void
nakedHardFault_Handler(void) {
    __asm volatile (
            "mov r0,sp\n"
            "ldr r1,=_end_stack\n"
            "mov sp,r1\n"
            "bl HardFault_Handler\n"
            "b Reset_Handler\n"
            );
}

__attribute__ ((section(".isr_vector"))) void (*isr_vector_table[])(void) = {
    (void(*)(void))&_end_stack,     //  0
    Reset_Handler,                  //  1
    NMI_Handler,                    //  2
    nakedHardFault_Handler,         //  3
    MemManage_Handler,              //  4
    BusFault_Handler,               //  5
    UsageFault_Handler,             //  6
    0,                              //  7
    0,                              //  8
    0,                              //  9
    0,                              //  0
    SVC_Handler,                    // 11
    DebugMon_Handler,               // 12
    0,                              // 13
    PendSV_Handler,                 // 14
    SysTick_Handler,                // 15
    WWDG_IRQHandler,                // 16
    PVD_IRQHandler,                 // 17
    TAMPER_IRQHandler,              // 18
    RTC_IRQHandler,                 // 19
    FLASH_IRQHandler,               // 20
    RCC_IRQHandler,                 // 21
    EXTI0_IRQHandler,               // 22
    EXTI1_IRQHandler,               // 23
    EXTI2_IRQHandler,               // 24
    EXTI3_IRQHandler,               // 25
    EXTI4_IRQHandler,               // 26
    DMA1_Channel0_IRQHandler,       // 27
    DMA1_Channel1_IRQHandler,       // 28
    DMA1_Channel2_IRQHandler,       // 29
    DMA1_Channel3_IRQHandler,       // 30
    DMA1_Channel4_IRQHandler,       // 31
    DMA1_Channel5_IRQHandler,       // 32
    DMA1_Channel6_IRQHandler,       // 33
    ADC1_2_IRQHandler,              // 34
    USB_HP_CAN1_TX_IRQHandler,      // 35
    USB_LP_CAN1_RX0_IRQHandler,     // 36
    CAN1_RX1_IRQHandler,            // 37
    CAN1_SCE_IRQHandler,            // 38
    EXTI9_5_IRQHandler,             // 39
    TIM1_BRK_IRQHandler,            // 40
    TIM1_UP_TIM10_IRQHandler,       // 41
    TIM1_TRG_COM_TIM11_IRQHandler,  // 42
    TIM1_CC_IRQHandler,             // 43
    TIM2_IRQHandler,                // 44
    TIM3_IRQHandler,                // 45
    TIM4_IRQHandler,                // 46
    I2C1_EV_IRQHandler,             // 47
    I2C1_ER_IRQHandler,             // 48
    I2C2_EV_IRQHandler,             // 49
    I2C2_ER_IRQHandler,             // 50
    SPI1_IRQHandler,                // 51
    SPI2_IRQHandler,                // 52
    USART1_IRQHandler,              // 53
    USART2_IRQHandler,              // 54
    USART3_IRQHandler,              // 55
    EXTI15_10_IRQHandler,           // 56
    RTCAlarm_IRQHandler,            // 57
    OTG_FS_WKUP_IRQHandler,         // 58
    TIM8_BRK_TIM12_IRQHandler,      // 59
    TIM8_UP_TIM13_IRQHandler,       // 60
    TIM8_TRG_COM_TIM14_IRQHandler,  // 61
    TIM8_CC_IRQHandler,             // 62
    DMA1_Channel7_IRQHandler,       // 63
    FSMC_IRQHandler,                // 64
    SDIO_IRQHandler,                // 65
    TIM5_IRQHandler,                // 66
    SPI3_IRQHandler,                // 67
    UART4_IRQHandler,               // 68
    UART5_IRQHandler,               // 69
    TIM6_DAC_IRQHandler,            // 70
    TIM7_IRQHandler,                // 71
    DMA2_Channel0_IRQHandler,       // 72
    DMA2_Channel1_IRQHandler,       // 73
    DMA2_Channel2_IRQHandler,       // 74
    DMA2_Channel3_IRQHandler,       // 75
    DMA2_Channel4_IRQHandler,       // 76
    ETH_IRQHandler,                 // 77
    ETH_WKUP_IRQHandler,            // 78
    CAN2_TX_IRQHandler,             // 79
    CAN2_RX0_IRQHandler,            // 80
    CAN2_RX1_IRQHandler,            // 81
    CAN2_SCE_IRQHandler,            // 82
    OTG_FS_IRQHandler,              // 83
    DMA2_Channel5_IRQHandler,       // 84
    DMA2_Channel6_IRQHandler,       // 85
    DMA2_Channel7_IRQHandler,       // 86
    USART6_IRQHandler,              // 87
    I2C3_EV_IRQHandler,             // 88
    I2C3_ER_IRQHandler,             // 89
    OTG_HS_EP1_OUT_IRQHandler,      // 90
    OTG_HS_EP1_IN_IRQHandler,       // 91
    OTG_HS_WKUP_IRQHandler,         // 92
    OTG_HS_IRQHandler,              // 93
    DCMI_IRQHandler,                // 94
    CRYP_IRQHandler,                // 95
    HASH_RNG_IRQHandler             // 96
};

// __attribute__((interrupt,noreturn,nothrow))

