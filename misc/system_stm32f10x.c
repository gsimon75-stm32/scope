#include "stm32f10x.h"


void SystemInit (void)
{
    // After each device reset the HSI is used as System clock source.

    /*
    // Reset the RCC clock configuration to the default reset state(for debug purpose)
    // Set HSION bit
    RCC->CR |= (uint32_t)0x00000001;
    // Reset SW, HPRE, PPRE1, PPRE2, ADCPRE and MCO bits
    RCC->CFGR &= (uint32_t)0xF0FF0000;
    // Reset HSEON, CSSON and PLLON bits
    RCC->CR &= (uint32_t)0xFEF6FFFF;
    // Reset HSEBYP bit
    RCC->CR &= (uint32_t)0xFFFBFFFF;
    // Reset PLLSRC, PLLXTPRE, PLLMUL and USBPRE/OTGFSPRE bits
    RCC->CFGR &= (uint32_t)0xFF80FFFF;
    */

    // Configure the Flash Latency cycles and enable prefetch buffer
    FLASH->ACR |= FLASH_ACR_PRFTBE; // Enable Prefetch Buffer
    // Flash 2 wait state
    FLASH->ACR &= (uint32_t)((uint32_t)~FLASH_ACR_LATENCY);
    FLASH->ACR |= (uint32_t)FLASH_ACR_LATENCY_2;    

    // Disable all interrupts and clear pending bits
    RCC->CIR = 0x009F0000;

    //  Sets System clock frequency to 72MHz and configure HCLK, PCLK2 and PCLK1 prescalers. 
    // Enable HSE
    RCC->CR |= ((uint32_t)RCC_CR_HSEON);

    // Wait till HSE is ready
    while ((RCC->CR & RCC_CR_HSERDY) == 0)
        ;

    /*
    if ((RCC->CR & RCC_CR_HSERDY) == RESET)
    {
        // If HSE fails to start-up, the application will have wrong clock configuration. User can add here some code to deal with this error
        return;
    }
    */

    // HCLK = SYSCLK
    RCC->CFGR |= (uint32_t)RCC_CFGR_HPRE_DIV1;

    // PCLK2 = HCLK
    RCC->CFGR |= (uint32_t)RCC_CFGR_PPRE2_DIV1;

    // PCLK1 = HCLK
    RCC->CFGR |= (uint32_t)RCC_CFGR_PPRE1_DIV2;

    //  PLL configuration: PLLCLK = HSE * 9 = 72 MHz
    RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_PLLSRC | RCC_CFGR_PLLXTPRE | RCC_CFGR_PLLMULL));
    RCC->CFGR |= (uint32_t)(RCC_CFGR_PLLSRC_HSE | RCC_CFGR_PLLMULL9);

    // Enable PLL
    RCC->CR |= RCC_CR_PLLON;

    /* Wait till PLL is ready */
    while((RCC->CR & RCC_CR_PLLRDY) == 0)
        ;

    // Select PLL as system clock source
    RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
    RCC->CFGR |= (uint32_t)RCC_CFGR_SW_PLL;    

    // Wait till PLL is used as system clock source
    while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS) != (uint32_t)0x08)
        ;

    SCB->VTOR = SRAM_BASE; // Vector Table Relocation in Internal SRAM.
    //SCB->VTOR = FLASH_BASE; // Vector Table Relocation in Internal FLASH.
}
