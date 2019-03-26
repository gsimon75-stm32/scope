OUTPUT_FORMAT(elf32-littlearm)
SEARCH_DIR("=");

STACK_SIZE = 1024;

MEMORY
{
	ALIAS_FLASH(IRX)	: ORIGIN = 0x00000000, LENGTH = 0x00100000
	ALIAS_SYSTEM(IRX)	: ORIGIN = 0x00000000, LENGTH = 0x00007800
	ALIAS_SRAM(IRWX)	: ORIGIN = 0x00000000, LENGTH = 0x0001c000
	FLASH(IRX)		: ORIGIN = 0x08000000, LENGTH = 0x00100000
	SYSTEM(IRX)		: ORIGIN = 0x1fff0000, LENGTH = 0x00007800
	OTP(IRX)		: ORIGIN = 0x1fff7800, LENGTH = 0x00000210
	OPTION_BYTES(IRX)	: ORIGIN = 0x1fffc000, LENGTH = 0x00000010
	SRAM1(ARWX)		: ORIGIN = 0x20000000, LENGTH = 0x0001c000
	SRAM2(ARWX)		: ORIGIN = 0x2001c000, LENGTH = 0x00004000
	BITBANDING(ARWX)	: ORIGIN = 0x22000000, LENGTH = 0x00004000
	PERIPHERALS(ARW)	: ORIGIN = 0x40000000, LENGTH = 0x20000000
	FSMC_NOR(ARW)		: ORIGIN = 0x60000000, LENGTH = 0x10000000
	FSMC_PSRAM1		: ORIGIN = 0x60000000, LENGTH = 0x04000000
	FSMC_PSRAM2		: ORIGIN = 0x64000000, LENGTH = 0x04000000
	FSMC_PSRAM3		: ORIGIN = 0x68000000, LENGTH = 0x04000000
	FSMC_PSRAM4		: ORIGIN = 0x6c000000, LENGTH = 0x04000000
	FSMC_NAND1(ARW)		: ORIGIN = 0x70000000, LENGTH = 0x10000000
	FSMC_NAND2(ARW)		: ORIGIN = 0x80000000, LENGTH = 0x10000000
	FSMC_PCCARD(ARW)	: ORIGIN = 0x90000000, LENGTH = 0x10000000
	FSMC_CONTROL(ARW)	: ORIGIN = 0xa0000000, LENGTH = 0x00001000
	CORTEX_INTERNAL(!RWX)	: ORIGIN = 0xe0000000, LENGTH = 0x10000000
}

SECTIONS
{
	.text : {			/* isr vector table, code, ro data, rw data with initialisers */
		_begin_isr_vector = .;
		*(.isr_vector)
		_end_isr_vector = .;

		_begin_text = .;
		*(.text)
		_end_text = .;

		/* All *_Handlers defaults to DummyHandler just in case you don't want to over-define them */
		HardFault_Handler = DEFINED(HardFault_Handler) ? HardFault_Handler : 1 | DummyHandler;
		NMI_Handler = DEFINED(NMI_Handler) ? NMI_Handler : 1 | DummyHandler;
		MemManage_Handler = DEFINED(MemManage_Handler) ? MemManage_Handler : 1 | DummyHandler;
		BusFault_Handler = DEFINED(BusFault_Handler) ? BusFault_Handler : 1 | DummyHandler;
		UsageFault_Handler = DEFINED(UsageFault_Handler) ? UsageFault_Handler : 1 | DummyHandler;
		SVC_Handler = DEFINED(SVC_Handler) ? SVC_Handler : 1 | DummyHandler;
		DebugMon_Handler = DEFINED(DebugMon_Handler) ? DebugMon_Handler : 1 | DummyHandler;
		PendSV_Handler = DEFINED(PendSV_Handler) ? PendSV_Handler : 1 | DummyHandler;
		SysTick_Handler = DEFINED(SysTick_Handler) ? SysTick_Handler : 1 | DummyHandler;
		WWDG_IRQHandler = DEFINED(WWDG_IRQHandler) ? WWDG_IRQHandler : 1 | DummyHandler;
		PVD_IRQHandler = DEFINED(PVD_IRQHandler) ? PVD_IRQHandler : 1 | DummyHandler;
		TAMP_STAMP_IRQHandler = DEFINED(TAMP_STAMP_IRQHandler) ? TAMP_STAMP_IRQHandler : 1 | DummyHandler;
		RTC_WKUP_IRQHandler = DEFINED(RTC_WKUP_IRQHandler) ? RTC_WKUP_IRQHandler : 1 | DummyHandler;
		FLASH_IRQHandler = DEFINED(FLASH_IRQHandler) ? FLASH_IRQHandler : 1 | DummyHandler;
		RCC_IRQHandler = DEFINED(RCC_IRQHandler) ? RCC_IRQHandler : 1 | DummyHandler;
		EXTI0_IRQHandler = DEFINED(EXTI0_IRQHandler) ? EXTI0_IRQHandler : 1 | DummyHandler;
		EXTI1_IRQHandler = DEFINED(EXTI1_IRQHandler) ? EXTI1_IRQHandler : 1 | DummyHandler;
		EXTI2_IRQHandler = DEFINED(EXTI2_IRQHandler) ? EXTI2_IRQHandler : 1 | DummyHandler;
		EXTI3_IRQHandler = DEFINED(EXTI3_IRQHandler) ? EXTI3_IRQHandler : 1 | DummyHandler;
		EXTI4_IRQHandler = DEFINED(EXTI4_IRQHandler) ? EXTI4_IRQHandler : 1 | DummyHandler;
		DMA1_Stream0_IRQHandler = DEFINED(DMA1_Stream0_IRQHandler) ? DMA1_Stream0_IRQHandler : 1 | DummyHandler;
		DMA1_Stream1_IRQHandler = DEFINED(DMA1_Stream1_IRQHandler) ? DMA1_Stream1_IRQHandler : 1 | DummyHandler;
		DMA1_Stream2_IRQHandler = DEFINED(DMA1_Stream2_IRQHandler) ? DMA1_Stream2_IRQHandler : 1 | DummyHandler;
		DMA1_Stream3_IRQHandler = DEFINED(DMA1_Stream3_IRQHandler) ? DMA1_Stream3_IRQHandler : 1 | DummyHandler;
		DMA1_Stream4_IRQHandler = DEFINED(DMA1_Stream4_IRQHandler) ? DMA1_Stream4_IRQHandler : 1 | DummyHandler;
		DMA1_Stream5_IRQHandler = DEFINED(DMA1_Stream5_IRQHandler) ? DMA1_Stream5_IRQHandler : 1 | DummyHandler;
		DMA1_Stream6_IRQHandler = DEFINED(DMA1_Stream6_IRQHandler) ? DMA1_Stream6_IRQHandler : 1 | DummyHandler;
		ADC_IRQHandler = DEFINED(ADC_IRQHandler) ? ADC_IRQHandler : 1 | DummyHandler;
		CAN1_TX_IRQHandler = DEFINED(CAN1_TX_IRQHandler) ? CAN1_TX_IRQHandler : 1 | DummyHandler;
		CAN1_RX0_IRQHandler = DEFINED(CAN1_RX0_IRQHandler) ? CAN1_RX0_IRQHandler : 1 | DummyHandler;
		CAN1_RX1_IRQHandler = DEFINED(CAN1_RX1_IRQHandler) ? CAN1_RX1_IRQHandler : 1 | DummyHandler;
		CAN1_SCE_IRQHandler = DEFINED(CAN1_SCE_IRQHandler) ? CAN1_SCE_IRQHandler : 1 | DummyHandler;
		EXTI9_5_IRQHandler = DEFINED(EXTI9_5_IRQHandler) ? EXTI9_5_IRQHandler : 1 | DummyHandler;
		TIM1_BRK_TIM9_IRQHandler = DEFINED(TIM1_BRK_TIM9_IRQHandler) ? TIM1_BRK_TIM9_IRQHandler : 1 | DummyHandler;
		TIM1_UP_TIM10_IRQHandler = DEFINED(TIM1_UP_TIM10_IRQHandler) ? TIM1_UP_TIM10_IRQHandler : 1 | DummyHandler;
		TIM1_TRG_COM_TIM11_IRQHandler = DEFINED(TIM1_TRG_COM_TIM11_IRQHandler) ? TIM1_TRG_COM_TIM11_IRQHandler : 1 | DummyHandler;
		TIM1_CC_IRQHandler = DEFINED(TIM1_CC_IRQHandler) ? TIM1_CC_IRQHandler : 1 | DummyHandler;
		TIM2_IRQHandler = DEFINED(TIM2_IRQHandler) ? TIM2_IRQHandler : 1 | DummyHandler;
		TIM3_IRQHandler = DEFINED(TIM3_IRQHandler) ? TIM3_IRQHandler : 1 | DummyHandler;
		TIM4_IRQHandler = DEFINED(TIM4_IRQHandler) ? TIM4_IRQHandler : 1 | DummyHandler;
		I2C1_EV_IRQHandler = DEFINED(I2C1_EV_IRQHandler) ? I2C1_EV_IRQHandler : 1 | DummyHandler;
		I2C1_ER_IRQHandler = DEFINED(I2C1_ER_IRQHandler) ? I2C1_ER_IRQHandler : 1 | DummyHandler;
		I2C2_EV_IRQHandler = DEFINED(I2C2_EV_IRQHandler) ? I2C2_EV_IRQHandler : 1 | DummyHandler;
		I2C2_ER_IRQHandler = DEFINED(I2C2_ER_IRQHandler) ? I2C2_ER_IRQHandler : 1 | DummyHandler;
		SPI1_IRQHandler = DEFINED(SPI1_IRQHandler) ? SPI1_IRQHandler : 1 | DummyHandler;
		SPI2_IRQHandler = DEFINED(SPI2_IRQHandler) ? SPI2_IRQHandler : 1 | DummyHandler;
		USART1_IRQHandler = DEFINED(USART1_IRQHandler) ? USART1_IRQHandler : 1 | DummyHandler;
		USART2_IRQHandler = DEFINED(USART2_IRQHandler) ? USART2_IRQHandler : 1 | DummyHandler;
		USART3_IRQHandler = DEFINED(USART3_IRQHandler) ? USART3_IRQHandler : 1 | DummyHandler;
		EXTI15_10_IRQHandler = DEFINED(EXTI15_10_IRQHandler) ? EXTI15_10_IRQHandler : 1 | DummyHandler;
		RTC_Alarm_IRQHandler = DEFINED(RTC_Alarm_IRQHandler) ? RTC_Alarm_IRQHandler : 1 | DummyHandler;
		OTG_FS_WKUP_IRQHandler = DEFINED(OTG_FS_WKUP_IRQHandler) ? OTG_FS_WKUP_IRQHandler : 1 | DummyHandler;
		TIM8_BRK_TIM12_IRQHandler = DEFINED(TIM8_BRK_TIM12_IRQHandler) ? TIM8_BRK_TIM12_IRQHandler : 1 | DummyHandler;
		TIM8_UP_TIM13_IRQHandler = DEFINED(TIM8_UP_TIM13_IRQHandler) ? TIM8_UP_TIM13_IRQHandler : 1 | DummyHandler;
		TIM8_TRG_COM_TIM14_IRQHandler = DEFINED(TIM8_TRG_COM_TIM14_IRQHandler) ? TIM8_TRG_COM_TIM14_IRQHandler : 1 | DummyHandler;
		TIM8_CC_IRQHandler = DEFINED(TIM8_CC_IRQHandler) ? TIM8_CC_IRQHandler : 1 | DummyHandler;
		DMA1_Stream7_IRQHandler = DEFINED(DMA1_Stream7_IRQHandler) ? DMA1_Stream7_IRQHandler : 1 | DummyHandler;
		FSMC_IRQHandler = DEFINED(FSMC_IRQHandler) ? FSMC_IRQHandler : 1 | DummyHandler;
		SDIO_IRQHandler = DEFINED(SDIO_IRQHandler) ? SDIO_IRQHandler : 1 | DummyHandler;
		TIM5_IRQHandler = DEFINED(TIM5_IRQHandler) ? TIM5_IRQHandler : 1 | DummyHandler;
		SPI3_IRQHandler = DEFINED(SPI3_IRQHandler) ? SPI3_IRQHandler : 1 | DummyHandler;
		UART4_IRQHandler = DEFINED(UART4_IRQHandler) ? UART4_IRQHandler : 1 | DummyHandler;
		UART5_IRQHandler = DEFINED(UART5_IRQHandler) ? UART5_IRQHandler : 1 | DummyHandler;
		TIM6_DAC_IRQHandler = DEFINED(TIM6_DAC_IRQHandler) ? TIM6_DAC_IRQHandler : 1 | DummyHandler;
		TIM7_IRQHandler = DEFINED(TIM7_IRQHandler) ? TIM7_IRQHandler : 1 | DummyHandler;
		DMA2_Stream0_IRQHandler = DEFINED(DMA2_Stream0_IRQHandler) ? DMA2_Stream0_IRQHandler : 1 | DummyHandler;
		DMA2_Stream1_IRQHandler = DEFINED(DMA2_Stream1_IRQHandler) ? DMA2_Stream1_IRQHandler : 1 | DummyHandler;
		DMA2_Stream2_IRQHandler = DEFINED(DMA2_Stream2_IRQHandler) ? DMA2_Stream2_IRQHandler : 1 | DummyHandler;
		DMA2_Stream3_IRQHandler = DEFINED(DMA2_Stream3_IRQHandler) ? DMA2_Stream3_IRQHandler : 1 | DummyHandler;
		DMA2_Stream4_IRQHandler = DEFINED(DMA2_Stream4_IRQHandler) ? DMA2_Stream4_IRQHandler : 1 | DummyHandler;
		ETH_IRQHandler = DEFINED(ETH_IRQHandler) ? ETH_IRQHandler : 1 | DummyHandler;
		ETH_WKUP_IRQHandler = DEFINED(ETH_WKUP_IRQHandler) ? ETH_WKUP_IRQHandler : 1 | DummyHandler;
		CAN2_TX_IRQHandler = DEFINED(CAN2_TX_IRQHandler) ? CAN2_TX_IRQHandler : 1 | DummyHandler;
		CAN2_RX0_IRQHandler = DEFINED(CAN2_RX0_IRQHandler) ? CAN2_RX0_IRQHandler : 1 | DummyHandler;
		CAN2_RX1_IRQHandler = DEFINED(CAN2_RX1_IRQHandler) ? CAN2_RX1_IRQHandler : 1 | DummyHandler;
		CAN2_SCE_IRQHandler = DEFINED(CAN2_SCE_IRQHandler) ? CAN2_SCE_IRQHandler : 1 | DummyHandler;
		OTG_FS_IRQHandler = DEFINED(OTG_FS_IRQHandler) ? OTG_FS_IRQHandler : 1 | DummyHandler;
		DMA2_Stream5_IRQHandler = DEFINED(DMA2_Stream5_IRQHandler) ? DMA2_Stream5_IRQHandler : 1 | DummyHandler;
		DMA2_Stream6_IRQHandler = DEFINED(DMA2_Stream6_IRQHandler) ? DMA2_Stream6_IRQHandler : 1 | DummyHandler;
		DMA2_Stream7_IRQHandler = DEFINED(DMA2_Stream7_IRQHandler) ? DMA2_Stream7_IRQHandler : 1 | DummyHandler;
		USART6_IRQHandler = DEFINED(USART6_IRQHandler) ? USART6_IRQHandler : 1 | DummyHandler;
		I2C3_EV_IRQHandler = DEFINED(I2C3_EV_IRQHandler) ? I2C3_EV_IRQHandler : 1 | DummyHandler;
		I2C3_ER_IRQHandler = DEFINED(I2C3_ER_IRQHandler) ? I2C3_ER_IRQHandler : 1 | DummyHandler;
		OTG_HS_EP1_OUT_IRQHandler = DEFINED(OTG_HS_EP1_OUT_IRQHandler) ? OTG_HS_EP1_OUT_IRQHandler : 1 | DummyHandler;
		OTG_HS_EP1_IN_IRQHandler = DEFINED(OTG_HS_EP1_IN_IRQHandler) ? OTG_HS_EP1_IN_IRQHandler : 1 | DummyHandler;
		OTG_HS_WKUP_IRQHandler = DEFINED(OTG_HS_WKUP_IRQHandler) ? OTG_HS_WKUP_IRQHandler : 1 | DummyHandler;
		OTG_HS_IRQHandler = DEFINED(OTG_HS_IRQHandler) ? OTG_HS_IRQHandler : 1 | DummyHandler;
		DCMI_IRQHandler = DEFINED(DCMI_IRQHandler) ? DCMI_IRQHandler : 1 | DummyHandler;
		CRYP_IRQHandler = DEFINED(CRYP_IRQHandler) ? CRYP_IRQHandler : 1 | DummyHandler;
		HASH_RNG_IRQHandler = DEFINED(HASH_RNG_IRQHandler) ? HASH_RNG_IRQHandler : 1 | DummyHandler;
		
		_begin_rodata = .;
		*(.rodata)
		_end_rodata = .;

	} >FLASH

	.stack : {
		_begin_stack = .;
		. = . + STACK_SIZE;
		. = ALIGN(8);
		_end_stack = .;
	} >SRAM1

	.data : AT(_end_rodata) {	/* init'd rw data */
		/* NOTE: the code must start with
		extern char begin_data, end_data, end_text, begin_bss, end_bss;
		memcpy(&begin_data, &end_text, &end_data - &begin_data);
		memset(&begin_bss, 0, &end_bss - &begin_bss); */
		_begin_data = .;
		*(.data)
		_end_data = .;
	} >SRAM1

	.bss : {			/* uninit'd rw data */
		_begin_bss = .;
		*(.bss) *(COMMON)
		_end_bss = .;
	} >SRAM1	

}

ENTRY(Reset_Handler)
