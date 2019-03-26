OUTPUT_FORMAT(elf32-littlearm)
SEARCH_DIR("=");

FLASH_START = 0x08000000;
FLASH_SIZE  = 0x20000;

SRAM_START  = 0x20000000;
SRAM_SIZE   = 0x5000;

STACK_SIZE = 1024;

MEMORY
{
    FLASH(IRX)              : ORIGIN = FLASH_START, LENGTH = FLASH_SIZE
    SYSTEM(IRX)             : ORIGIN = 0x1ffff000,  LENGTH = 0x00001000
    SRAM(ARWX)              : ORIGIN = SRAM_START,  LENGTH = SRAM_SIZE
    SRAM_BB(ARWX)           : ORIGIN = 0x22000000,  LENGTH = 0x02000000
    PERIPH(ARW)             : ORIGIN = 0x40000000,  LENGTH = 0x00100000
    USB_PMA(ARW)            : ORIGIN = 0x40006000,  LENGTH = 0x00000400
    PERIPH_BB(ARW)          : ORIGIN = 0x42000000,  LENGTH = 0x02000000
    EXTERNAL_RAM(ARW)       : ORIGIN = 0x60000000,  LENGTH = 0x40000000
    EXTERNAL_PERIPH(ARW)    : ORIGIN = 0xa0000000,  LENGTH = 0x40000000
    CORTEX_PERIPH(ARW)      : ORIGIN = 0xe0000000,  LENGTH = 0x00100000
    STM_PERIPH(ARW)         : ORIGIN = 0xe0100000,  LENGTH = 0x1ff00000
}

SECTIONS
{
    .flash : {
        Initial_SP                  = _end_stack;   /* makes no sense to over-define it from source code */

        _begin_isr_vectors = .;
        *(.isr_vectors)
        _end_isr_vectors = .;

        . = ALIGN(4);
        _begin_text = .;
        *(.text)
        _end_text = .;

        /* All Handlers defaults to Dummy_Handler just in case you don't want to over-define them */
        Reset_Handler               = DEFINED(Reset_Handler)            ? Reset_Handler             : Trap_Handler;
        NonMaskableInt_Handler      = DEFINED(NonMaskableInt_Handler)   ? NonMaskableInt_Handler    : Trap_Handler;
        HardFault_Handler           = DEFINED(HardFault_Handler)        ? HardFault_Handler         : Trap_Handler;
        MemoryManagement_Handler    = DEFINED(MemoryManagement_Handler) ? MemoryManagement_Handler  : Trap_Handler;
        BusFault_Handler            = DEFINED(BusFault_Handler)         ? BusFault_Handler          : Trap_Handler;
        UsageFault_Handler          = DEFINED(UsageFault_Handler)       ? UsageFault_Handler        : Trap_Handler;
        /*Reserved*/
        /*Reserved*/
        /*Reserved*/
        /*Reserved*/
        SVCall_Handler              = DEFINED(SVCall_Handler)           ? SVCall_Handler            : Dummy_Handler;
        DebugMonitor_Handler        = DEFINED(DebugMonitor_Handler)     ? DebugMonitor_Handler      : Dummy_Handler;
        /*Reserved*/
        PendSV_Handler              = DEFINED(PendSV_Handler)           ? PendSV_Handler            : Dummy_Handler;
        SysTick_Handler             = DEFINED(SysTick_Handler)          ? SysTick_Handler           : Dummy_Handler;
        WWDG_Handler                = DEFINED(WWDG_Handler)             ? WWDG_Handler              : Dummy_Handler;
        PVD_Handler                 = DEFINED(PVD_Handler)              ? PVD_Handler               : Dummy_Handler;
        TAMPER_Handler              = DEFINED(TAMPER_Handler)           ? TAMPER_Handler            : Dummy_Handler;
        RTC_Handler                 = DEFINED(RTC_Handler)              ? RTC_Handler               : Dummy_Handler;
        FLASH_Handler               = DEFINED(FLASH_Handler)            ? FLASH_Handler             : Dummy_Handler;
        RCC_Handler                 = DEFINED(RCC_Handler)              ? RCC_Handler               : Dummy_Handler;
        EXTI0_Handler               = DEFINED(EXTI0_Handler)            ? EXTI0_Handler             : Dummy_Handler;
        EXTI1_Handler               = DEFINED(EXTI1_Handler)            ? EXTI1_Handler             : Dummy_Handler;
        EXTI2_Handler               = DEFINED(EXTI2_Handler)            ? EXTI2_Handler             : Dummy_Handler;
        EXTI3_Handler               = DEFINED(EXTI3_Handler)            ? EXTI3_Handler             : Dummy_Handler;
        EXTI4_Handler               = DEFINED(EXTI4_Handler)            ? EXTI4_Handler             : Dummy_Handler;
        DMA1_Channel1_Handler       = DEFINED(DMA1_Channel1_Handler)    ? DMA1_Channel1_Handler     : Dummy_Handler;
        DMA1_Channel2_Handler       = DEFINED(DMA1_Channel2_Handler)    ? DMA1_Channel2_Handler     : Dummy_Handler;
        DMA1_Channel3_Handler       = DEFINED(DMA1_Channel3_Handler)    ? DMA1_Channel3_Handler     : Dummy_Handler;
        DMA1_Channel4_Handler       = DEFINED(DMA1_Channel4_Handler)    ? DMA1_Channel4_Handler     : Dummy_Handler;
        DMA1_Channel5_Handler       = DEFINED(DMA1_Channel5_Handler)    ? DMA1_Channel5_Handler     : Dummy_Handler;
        DMA1_Channel6_Handler       = DEFINED(DMA1_Channel6_Handler)    ? DMA1_Channel6_Handler     : Dummy_Handler;
        DMA1_Channel7_Handler       = DEFINED(DMA1_Channel7_Handler)    ? DMA1_Channel7_Handler     : Dummy_Handler;
        ADC1_2_Handler              = DEFINED(ADC1_2_Handler)           ? ADC1_2_Handler            : Dummy_Handler;
        USB_HP_CAN1_TX_Handler      = DEFINED(USB_HP_CAN1_TX_Handler)   ? USB_HP_CAN1_TX_Handler    : Dummy_Handler;
        USB_LP_CAN1_RX0_Handler     = DEFINED(USB_LP_CAN1_RX0_Handler)  ? USB_LP_CAN1_RX0_Handler   : Dummy_Handler;
        CAN1_RX1_Handler            = DEFINED(CAN1_RX1_Handler)         ? CAN1_RX1_Handler          : Dummy_Handler;
        CAN1_SCE_Handler            = DEFINED(CAN1_SCE_Handler)         ? CAN1_SCE_Handler          : Dummy_Handler;
        EXTI9_5_Handler             = DEFINED(EXTI9_5_Handler)          ? EXTI9_5_Handler           : Dummy_Handler;
        TIM1_BRK_Handler            = DEFINED(TIM1_BRK_Handler)         ? TIM1_BRK_Handler          : Dummy_Handler;
        TIM1_UP_Handler             = DEFINED(TIM1_UP_Handler)          ? TIM1_UP_Handler           : Dummy_Handler;
        TIM1_TRG_COM_Handler        = DEFINED(TIM1_TRG_COM_Handler)     ? TIM1_TRG_COM_Handler      : Dummy_Handler;
        TIM1_CC_Handler             = DEFINED(TIM1_CC_Handler)          ? TIM1_CC_Handler           : Dummy_Handler;
        TIM2_Handler                = DEFINED(TIM2_Handler)             ? TIM2_Handler              : Dummy_Handler;
        TIM3_Handler                = DEFINED(TIM3_Handler)             ? TIM3_Handler              : Dummy_Handler;
        TIM4_Handler                = DEFINED(TIM4_Handler)             ? TIM4_Handler              : Dummy_Handler;
        I2C1_EV_Handler             = DEFINED(I2C1_EV_Handler)          ? I2C1_EV_Handler           : Dummy_Handler;
        I2C1_ER_Handler             = DEFINED(I2C1_ER_Handler)          ? I2C1_ER_Handler           : Dummy_Handler;
        I2C2_EV_Handler             = DEFINED(I2C2_EV_Handler)          ? I2C2_EV_Handler           : Dummy_Handler;
        I2C2_ER_Handler             = DEFINED(I2C2_ER_Handler)          ? I2C2_ER_Handler           : Dummy_Handler;
        SPI1_Handler                = DEFINED(SPI1_Handler)             ? SPI1_Handler              : Dummy_Handler;
        SPI2_Handler                = DEFINED(SPI2_Handler)             ? SPI2_Handler              : Dummy_Handler;
        USART1_Handler              = DEFINED(USART1_Handler)           ? USART1_Handler            : Dummy_Handler;
        USART2_Handler              = DEFINED(USART2_Handler)           ? USART2_Handler            : Dummy_Handler;
        USART3_Handler              = DEFINED(USART3_Handler)           ? USART3_Handler            : Dummy_Handler;
        EXTI15_10_Handler           = DEFINED(EXTI15_10_Handler)        ? EXTI15_10_Handler         : Dummy_Handler;
        RTCAlarm_Handler            = DEFINED(RTCAlarm_Handler)         ? RTCAlarm_Handler          : Dummy_Handler;
        USBWakeUp_Handler           = DEFINED(USBWakeUp_Handler)        ? USBWakeUp_Handler         : Dummy_Handler;
        TIM8_BRK_Handler            = DEFINED(TIM8_BRK_Handler)         ? TIM8_BRK_Handler          : Dummy_Handler;
        TIM8_UP_Handler             = DEFINED(TIM8_UP_Handler)          ? TIM8_UP_Handler           : Dummy_Handler;
        TIM8_TRG_COM_Handler        = DEFINED(TIM8_TRG_COM_Handler)     ? TIM8_TRG_COM_Handler      : Dummy_Handler;
        TIM8_CC_Handler             = DEFINED(TIM8_CC_Handler)          ? TIM8_CC_Handler           : Dummy_Handler;
        ADC3_Handler                = DEFINED(ADC3_Handler)             ? ADC3_Handler              : Dummy_Handler;
        FSMC_Handler                = DEFINED(FSMC_Handler)             ? FSMC_Handler              : Dummy_Handler;
        SDIO_Handler                = DEFINED(SDIO_Handler)             ? SDIO_Handler              : Dummy_Handler;
        TIM5_Handler                = DEFINED(TIM5_Handler)             ? TIM5_Handler              : Dummy_Handler;
        SPI3_Handler                = DEFINED(SPI3_Handler)             ? SPI3_Handler              : Dummy_Handler;
        UART4_Handler               = DEFINED(UART4_Handler)            ? UART4_Handler             : Dummy_Handler;
        UART5_Handler               = DEFINED(UART5_Handler)            ? UART5_Handler             : Dummy_Handler;
        TIM7_Handler                = DEFINED(TIM7_Handler)             ? TIM7_Handler              : Dummy_Handler;
        DMA2_Channel1_Handler       = DEFINED(DMA2_Channel1_Handler)    ? DMA2_Channel1_Handler     : Dummy_Handler;
        DMA2_Channel2_Handler       = DEFINED(DMA2_Channel2_Handler)    ? DMA2_Channel2_Handler     : Dummy_Handler;
        DMA2_Channel3_Handler       = DEFINED(DMA2_Channel3_Handler)    ? DMA2_Channel3_Handler     : Dummy_Handler;
        TIM6_Handler                = DEFINED(TIM6_Handler)             ? TIM6_Handler              : Dummy_Handler;
        DMA2_Channel4_5_Handler     = DEFINED(DMA2_Channel4_5_Handler)  ? DMA2_Channel4_5_Handler   : Dummy_Handler;

        . = ALIGN(4);
        _begin_rodata = .;
        *(.rodata)
        _end_rodata = .;
    } >FLASH

    .stack SRAM_START (NOLOAD) : {
        _begin_stack = .;
        . = . + STACK_SIZE;
        _end_stack = .;
    } >SRAM

    .data : AT(_end_rodata) {   /* init'd rw data */
        . = ALIGN(4);
        _begin_data = .;
        *(.data)
        _end_data = .;
    } >SRAM

    .bss (NOLOAD) : {            /* uninit'd rw data */
        . = ALIGN(4);
        _begin_bss = .;
        *(.bss) *(COMMON)
        _end_bss = .;
    } >SRAM    

    .usb_pma (NOLOAD) : {
        _begin_usb_pma = .;
        *(.usb_pma)
        _end_usb_pma = .;
    } >USB_PMA

    .periph (NOLOAD) : {
    } >PERIPH

}

ENTRY(Reset_Handler)

/* vim: set sw=4 ts=4 et: */
