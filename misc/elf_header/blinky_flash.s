.cpu cortex-m3
.thumb
.syntax unified

include(stm32f10x.m4)

/* -------------------------------------------------------------------------- */
.section .isr_vector
.global isr_vector_table

isr_vector_table:
    .word Initial_SP
    .word Reset_Handler
    .word NonMaskableInt_Handler
    .word HardFault_Handler
    .word MemoryManagement_Handler
    .word BusFault_Handler
    .word UsageFault_Handler
    .word 0
    .word 0
    .word 0
    .word 0
    .word SVCall_Handler
    .word DebugMonitor_Handler
    .word 0
    .word PendSV_Handler
    .word SysTick_Handler
    .word WWDG_Handler
    .word PVD_Handler
    .word TAMPER_Handler
    .word RTC_Handler
    .word FLASH_Handler
    .word RCC_Handler
    .word EXTI0_Handler
    .word EXTI1_Handler
    .word EXTI2_Handler
    .word EXTI3_Handler
    .word EXTI4_Handler
    .word DMA1_Channel1_Handler
    .word DMA1_Channel2_Handler
    .word DMA1_Channel3_Handler
    .word DMA1_Channel4_Handler
    .word DMA1_Channel5_Handler
    .word DMA1_Channel6_Handler
    .word DMA1_Channel7_Handler
    .word ADC1_2_Handler
    .word USB_HP_CAN1_TX_Handler
    .word USB_LP_CAN1_RX0_Handler
    .word CAN1_RX1_Handler
    .word CAN1_SCE_Handler
    .word EXTI9_5_Handler
    .word TIM1_BRK_Handler
    .word TIM1_UP_Handler
    .word TIM1_TRG_COM_Handler
    .word TIM1_CC_Handler
    .word TIM2_Handler
    .word TIM3_Handler
    .word TIM4_Handler
    .word I2C1_EV_Handler
    .word I2C1_ER_Handler
    .word I2C2_EV_Handler
    .word I2C2_ER_Handler
    .word SPI1_Handler
    .word SPI2_Handler
    .word USART1_Handler
    .word USART2_Handler
    .word USART3_Handler
    .word EXTI15_10_Handler
    .word RTCAlarm_Handler
    .word USBWakeUp_Handler
    .word TIM8_BRK_Handler
    .word TIM8_UP_Handler
    .word TIM8_TRG_COM_Handler
    .word TIM8_CC_Handler
    .word ADC3_Handler
    .word FSMC_Handler
    .word SDIO_Handler
    .word TIM5_Handler
    .word SPI3_Handler
    .word UART4_Handler
    .word UART5_Handler
    .word TIM7_Handler
    .word DMA2_Channel1_Handler
    .word DMA2_Channel2_Handler
    .word DMA2_Channel3_Handler
    .word TIM6_Handler
    .word DMA2_Channel4_5_Handler

FUNCTION(Trampoline_main)
 130:   f8df d00c       ldr.w   sp, [pc, #12]   ; 0x140 = Initial_SP
 134:   f000 f818       bl      exec_main_functors

main_5:
 138:   4800            ldr     r0, [pc, #0]    ; (0x13c) = main
 13a:   4700            bx      r0

 13c:   .word main
 140:   .word Initial_SP
ENDFUNC ; Trampoline_main

FUNCTION(Reset_Handler)
 144:   4806            ldr     r0, [pc, #24]   ; (0x160) = setup_RCC_SCB
 146:   4780            blx     r0
 148:   4806            ldr     r0, [pc, #24]   ; (0x164) = Trampoline_main
 14a:   4700            bx      r0
ENDFUNC ; Reset_Handler

 14c:   e7fe            b.n     0x14c
 14e:   e7fe            b.n     0x14e
 150:   e7fe            b.n     0x150
 152:   e7fe            b.n     0x152
 154:   e7fe            b.n     0x154
 156:   e7fe            b.n     0x156
 158:   e7fe            b.n     0x158
 15a:   e7fe            b.n     0x15a
 15c:   e7fe            b.n     0x15c

FUNCTION(Dummy_Handler)
  LOC(FOREVER):
 15e:   e7fe            b.n     LOC(FOREVER)
ENDFUNC ; Dummy_Handler

 160:   .word setup_RCC_SCB
 164:   .word Trampoline_main


FUNCTION(exec_main_functors)
 168:   4c06            ldr     r4, [pc, #24]   ; (0x184)
 16a:   4d07            ldr     r5, [pc, #28]   ; (0x188)
 16c:   e006            b.n     LOC(CHECK_COND) ; 0x17c

 16e:   68e0            ldr     r0, [r4, #12]	; address to call
 170:   f040 0301       orr.w   r3, r0, #1
 174:   e894 0007       ldmia.w r4, {r0, r1, r2}
 178:   4798            blx     r3
 17a:   3410            adds    r4, #16

  LOC(CHECK_COND):
 17c:   42ac            cmp     r4, r5
 17e:   d3f6            bcc.n   0x16e
 180:   f7ff ffda       bl      main_5
 184:   .word main_functors_start ; 0x080004bc
 188:   .word main_functors_end ;0x080004cc
ENDFUNC ; exec_main_functors


FUNCTION(BusFault_Handler)
 18c:   bf00            nop
  LOC(FOREVER):
 18e:   e7fe            b.n     LOC(FOREVER)
ENDFUNC ; BusFault_Handler


FUNCTION(DebugMonitor_Handler)
 190:   4770            bx      lr
ENDFUNC ; DebugMonitor_Handler

FUNCTION(BusyLoop)
 192:   e000            b.n     LOC(CHECK_COND) ; 0x196
  LOC(LOOP):
 194:   1e40            subs    r0, r0, #1
  LOC(CHECK_COND):
 196:   2800            cmp     r0, #0
 198:   d1fc            bne.n   LOC(LOOP) ; 0x194
 19a:   4770            bx      lr
ENDFUNC ; BusyLoop

FUNCTION(Setup_GPIOC)
 19c:   b508            push    {r3, lr}
 19e:   2101            movs    r1, #1
 1a0:   2010            movs    r0, #16
 1a2:   f000 f8a3       bl      Change_APB2ENR_bit ; 0x2ec
 1a6:   f44f 5000       mov.w   r0, #8192       ; 0x2000
 1aa:   f8ad 0000       strh.w  r0, [sp]
 1ae:   2003            movs    r0, #3
 1b0:   f88d 0002       strb.w  r0, [sp, #2]
 1b4:   2010            movs    r0, #16
 1b6:   f88d 0003       strb.w  r0, [sp, #3]
 1ba:   4669            mov     r1, sp
 1bc:   4801            ldr     r0, [pc, #4]    ; (0x1c4) = GPIOC_BASE
 1be:   f000 f803       bl      Something_1c8 ; 0x1c8
 1c2:   bd08            pop     {r3, pc}

 1c4:   .word GPIOC_BASE ; 0x40011000
ENDFUNC ; Setup_GPIOC

FUNCTION(Something_1c8)
 1c8:   e92d 41f0       stmdb   sp!, {r4, r5, r6, r7, r8, lr}
 1cc:   4602            mov     r2, r0
 1ce:   2500            movs    r5, #0
 1d0:   2600            movs    r6, #0
 1d2:   2000            movs    r0, #0
 1d4:   2300            movs    r3, #0
 1d6:   2400            movs    r4, #0
 1d8:   2700            movs    r7, #0
 1da:   f891 c003       ldrb.w  r12, [r1, #3]
 1de:   f00c 050f       and.w   r5, r12, #15
 1e2:   f891 c003       ldrb.w  r12, [r1, #3]
 1e6:   f00c 0c10       and.w   r12, r12, #16
 1ea:   f1bc 0f00       cmp.w   r12, #0
 1ee:   d003            beq.n   0x1f8
 1f0:   f891 c002       ldrb.w  r12, [r1, #2]
 1f4:   ea4c 0505       orr.w   r5, r12, r5
 1f8:   f891 c000       ldrb.w  r12, [r1]
 1fc:   f1bc 0f00       cmp.w   r12, #0
 200:   d031            beq.n   0x266
 202:   6814            ldr     r4, [r2, #0]
 204:   2000            movs    r0, #0
 206:   e02b            b.n     LOC(CHECK_COND) ; 0x260

   LOC(LOOP):
 208:   f04f 0c01       mov.w   r12, #1
 20c:   fa0c f300       lsl.w   r3, r12, r0
 210:   f8b1 c000       ldrh.w  r12, [r1]
 214:   ea0c 0603       and.w   r6, r12, r3
 218:   429e            cmp     r6, r3
 21a:   d120            bne.n   0x25e
 21c:   0083            lsls    r3, r0, #2
 21e:   f04f 0c0f       mov.w   r12, #15
 222:   fa0c f703       lsl.w   r7, r12, r3
 226:   43bc            bics    r4, r7
 228:   fa05 fc03       lsl.w   r12, r5, r3
 22c:   ea4c 0404       orr.w   r4, r12, r4
 230:   f891 c003       ldrb.w  r12, [r1, #3]
 234:   f1bc 0f28       cmp.w   r12, #40        ; 0x28
 238:   d106            bne.n   0x248
 23a:   f04f 0c01       mov.w   r12, #1
 23e:   fa0c fc00       lsl.w   r12, r12, r0
 242:   f8c2 c014       str.w   r12, [r2, #20]
 246:   e00a            b.n     0x25e
 248:   f891 c003       ldrb.w  r12, [r1, #3]
 24c:   f1bc 0f48       cmp.w   r12, #72        ; 0x48
 250:   d105            bne.n   0x25e
 252:   f04f 0c01       mov.w   r12, #1
 256:   fa0c fc00       lsl.w   r12, r12, r0
 25a:   f8c2 c010       str.w   r12, [r2, #16]
 25e:   1c40            adds    r0, r0, #1
   LOC(CHECK_COND):
 260:   2808            cmp     r0, #8
 262:   d3d1            bcc.n   LOC(LOOP) ; 0x208

 264:   6014            str     r4, [r2, #0]
 266:   f8b1 c000       ldrh.w  r12, [r1]
 26a:   f1bc 0fff       cmp.w   r12, #255       ; 0xff
 26e:   dd34            ble.n   0x2da
 270:   6854            ldr     r4, [r2, #4]
 272:   2000            movs    r0, #0
 274:   e02e            b.n     0x2d4
 276:   f100 0c08       add.w   r12, r0, #8
 27a:   f04f 0801       mov.w   r8, #1
 27e:   fa08 f30c       lsl.w   r3, r8, r12
 282:   f8b1 c000       ldrh.w  r12, [r1]
 286:   ea0c 0603       and.w   r6, r12, r3
 28a:   429e            cmp     r6, r3
 28c:   d121            bne.n   0x2d2
 28e:   0083            lsls    r3, r0, #2
 290:   f04f 0c0f       mov.w   r12, #15
 294:   fa0c f703       lsl.w   r7, r12, r3
 298:   43bc            bics    r4, r7
 29a:   fa05 fc03       lsl.w   r12, r5, r3
 29e:   ea4c 0404       orr.w   r4, r12, r4
 2a2:   f891 c003       ldrb.w  r12, [r1, #3]
 2a6:   f1bc 0f28       cmp.w   r12, #40        ; 0x28
 2aa:   d105            bne.n   0x2b8
 2ac:   f100 0c08       add.w   r12, r0, #8
 2b0:   fa08 f80c       lsl.w   r8, r8, r12
 2b4:   f8c2 8014       str.w   r8, [r2, #20]
 2b8:   f891 c003       ldrb.w  r12, [r1, #3]
 2bc:   f1bc 0f48       cmp.w   r12, #72        ; 0x48
 2c0:   d107            bne.n   0x2d2
 2c2:   f100 0c08       add.w   r12, r0, #8
 2c6:   f04f 0801       mov.w   r8, #1
 2ca:   fa08 f80c       lsl.w   r8, r8, r12
 2ce:   f8c2 8010       str.w   r8, [r2, #16]
 2d2:   1c40            adds    r0, r0, #1
 2d4:   2808            cmp     r0, #8
 2d6:   d3ce            bcc.n   0x276
 2d8:   6054            str     r4, [r2, #4]
 2da:   e8bd 81f0       ldmia.w sp!, {r4, r5, r6, r7, r8, pc}
ENDFUNC ; Something_1c8

FUNCTION(HardFault_Handler)
 2de:   bf00            nop
  LOC(FOREVER):
 2e0:   e7fe            b.n     LOC(FOREVER)
ENDFUNC

FUNCTION(MemoryManagement_Handler)
 2e2:   bf00            nop
  LOC(FOREVER):
 2e4:   e7fe            b.n     LOC(FOREVER)
ENDFUNC

FUNCTION(NonMaskableInt_Handler)
 2e6:   4770            bx      lr
ENDFUNC ; NonMaskableInt_Handler

FUNCTION(PendSV_Handler)
 2e8:   4770            bx      lr
ENDFUNC ; PendSV_Handler

 2ea:   .word 0	; alignment

FUNCTION(Change_APB2ENR_bit)
	; In:	r0 = bit mask to change in RCC_APB2ENR
	;	    r1 = new value
 2ec:   b129            cbz     r1, LOC(ARG_IS_ZERO) ; 0x2fa
 2ee:   4a06            ldr     r2, [pc, #24]   ; (0x308) = RCC_BASE
 2f0:   6992            ldr     r2, [r2, #24]
 2f2:   4302            orrs    r2, r0
 2f4:   4b04            ldr     r3, [pc, #16]   ; (0x308) = RCC_BASE
 2f6:   619a            str     r2, [r3, #24]	; [RCC_APB2ENR] |= r0
 2f8:   e004            b.n     LOC(DONE) ; 0x304

  LOC(ARG_IS_ZERO):
 2fa:   4a03            ldr     r2, [pc, #12]   ; (0x308) = RCC_BASE
 2fc:   6992            ldr     r2, [r2, #24]
 2fe:   4382            bics    r2, r0
 300:   4b01            ldr     r3, [pc, #4]    ; (0x308) = RCC_BASE
 302:   619a            str     r2, [r3, #24]	; [RCC_APB2ENR] &= ~r0
  LOC(DONE):
 304:   4770            bx      lr

 306:   .word 0 ; alignment
 308:   .word RCC_BASE ; 0x40021000
ENDFUNC ; Change_APB2ENR_bit


FUNCTION(SVCall_Handler)
 30c:   4770            bx      lr
ENDFUNC ; SVCall_Handler

FUNCTION(Trampoline_Setup_Flash_RCC)
 30e:   b510            push    {r4, lr}
 310:   f000 f802       bl      Setup_Flash_RCC        ; 0x318
 314:   bd10            pop     {r4, pc}
ENDFUNC ; Trampoline_Setup_Flash_RCC

 316:   0000            movs    r0, r0

FUNCTION(Setup_Flash_RCC)
 318:   b50c            push    {r2, r3, lr}
 31a:   2000            movs    r0, #0
 31c:   9001            str     r0, [sp, #4]    ; [sp+4] === loop_counter
 31e:   9000            str     r0, [sp, #0]
 320:   4833            ldr     r0, [pc, #204]  ; (0x3f0) = RCC_BASE
 322:   6800            ldr     r0, [r0, #0]
 324:   f440 3080       orr.w   r0, r0, #65536  ; 0x10000
 328:   4931            ldr     r1, [pc, #196]  ; (0x3f0) = RCC_BASE
 32a:   6008            str     r0, [r1, #0]    ; [RCC_CR] |= RCC_CR_HSEON
 32c:   bf00            nop
  LOC(WAIT_HSE):
 32e:   4830            ldr     r0, [pc, #192]  ; (0x3f0) = RCC_BASE
 330:   6800            ldr     r0, [r0, #0]
 332:   f400 3000       and.w   r0, r0, #131072 ; 0x20000
 336:   9000            str     r0, [sp, #0]    ; [sp+0] = [RCC_CR] & RCC_CR_HSERDY
 338:   9801            ldr     r0, [sp, #4]
 33a:   1c40            adds    r0, r0, #1
 33c:   9001            str     r0, [sp, #4]    ; [sp+4] ++
 33e:   9800            ldr     r0, [sp, #0]
 340:   b918            cbnz    r0, LOC(HSE_READY) ;0x34a
 342:   9801            ldr     r0, [sp, #4]
 344:   f5b0 6fa0       cmp.w   r0, #1280       ; 0x500
 348:   d1f1            bne.n   LOC(WAIT_HSE)   ; 0x32e
  LOC(HSE_READY):
 34a:   4829            ldr     r0, [pc, #164]  ; (0x3f0) = RCC_BASE
 34c:   6800            ldr     r0, [r0, #0]
 34e:   f400 3000       and.w   r0, r0, #131072 ; 0x20000
 352:   b110            cbz     r0, LOC(HSE_NOT_READY) ; 0x35a       ; if (!([RCC_CR] & RCC_CR_HSERDY)) ...
 354:   2001            movs    r0, #1
 356:   9000            str     r0, [sp, #0]    ; [sp+0] = 1 === 'success'
 358:   e001            b.n     LOC(CHECK_THAT_FCKIN_RESULT_THE_NTH_TIME) ; 0x35e
  LOC(HSE_NOT_READY):
 35a:   2000            movs    r0, #0
 35c:   9000            str     r0, [sp, #0]    ; [sp+0] = 0 === 'failure'

  LOC(CHECK_THAT_FCKIN_RESULT_THE_NTH_TIME):
 35e:   9800            ldr     r0, [sp, #0]    ; '1=success' / '0=failure'
 360:   2801            cmp     r0, #1
 362:   d143            bne.n   LOC(DONE)       ; 0x3ec

 364:   4823            ldr     r0, [pc, #140]  ; (0x3f4) = FLASH_REG_BASE
 366:   6800            ldr     r0, [r0, #0]
 368:   f040 0010       orr.w   r0, r0, #16
 36c:   4921            ldr     r1, [pc, #132]  ; (0x3f4) = FLASH_REG_BASE
 36e:   6008            str     r0, [r1, #0]    ; [FLASH_REG_ACR] |= FLASH_ACR_PRFTBE
 370:   4608            mov     r0, r1
 372:   6800            ldr     r0, [r0, #0]
 374:   f020 0003       bic.w   r0, r0, #3
 378:   6008            str     r0, [r1, #0]    ; [FLASH_REG_ACR] &= ~MASK(FLASH_ACR_LATENCY)
 37a:   4608            mov     r0, r1
 37c:   6800            ldr     r0, [r0, #0]
 37e:   f040 0002       orr.w   r0, r0, #2
 382:   6008            str     r0, [r1, #0]    ; [FLASH_REG_ACR] |= 0x02
 384:   481a            ldr     r0, [pc, #104]  ; (0x3f0) = RCC_BASE
 386:   6840            ldr     r0, [r0, #4]
 388:   4919            ldr     r1, [pc, #100]  ; (0x3f0) = RCC_BASE
 38a:   6048            str     r0, [r1, #4]    ; [RCC_CFGR] = [RCC_CFGR] ???
 38c:   4608            mov     r0, r1
 38e:   6840            ldr     r0, [r0, #4]
 390:   6048            str     r0, [r1, #4]    ; [RCC_CFGR] = [RCC_CFGR] ???
 392:   4608            mov     r0, r1
 394:   6840            ldr     r0, [r0, #4]
 396:   f440 6080       orr.w   r0, r0, #1024   ; 0x400
 39a:   6048            str     r0, [r1, #4]    ; [RCC_CFGR] |= RCC_CFGR_PPRE1_DIV2
 39c:   4608            mov     r0, r1
 39e:   6840            ldr     r0, [r0, #4]
 3a0:   f420 107c       bic.w   r0, r0, #4128768        ; 0x3f0000
 3a4:   6048            str     r0, [r1, #4]	; [RCC_CFGR] &= ~(RCC_CFGR_PLLMULL, RCC_CFGR_PLLXTPRE, RCC_CFGR_PLLSRC)
 3a6:   4608            mov     r0, r1
 3a8:   6840            ldr     r0, [r0, #4]
 3aa:   f440 10e8       orr.w   r0, r0, #1900544        ; 0x1d0000
 3ae:   6048            str     r0, [r1, #4]	; [RCC_CFGR] |= RCC_CFGR_PLLMULL9 | RCC_CFGR_PLLSRC
 3b0:   4608            mov     r0, r1
 3b2:   6800            ldr     r0, [r0, #0]
 3b4:   f040 7080       orr.w   r0, r0, #16777216       ; 0x1000000
 3b8:   6008            str     r0, [r1, #0]	; [RCC_CR] |= RCC_CR_PLLON
 3ba:   bf00            nop
  LOC(WAIT_PLL):
 3bc:   480c            ldr     r0, [pc, #48]   ; (0x3f0) = RCC_BASE
 3be:   6800            ldr     r0, [r0, #0]
 3c0:   f000 7000       and.w   r0, r0, #33554432       ; 0x2000000
 3c4:   2800            cmp     r0, #0
 3c6:   d0f9            beq.n   LOC(WAIT_PLL)   ; 0x3bc ; while ![RCC_CR] & RCC_CR_PLLRDY

 3c8:   4809            ldr     r0, [pc, #36]   ; (0x3f0) = RCC_BASE
 3ca:   6840            ldr     r0, [r0, #4]
 3cc:   f020 0003       bic.w   r0, r0, #3
 3d0:   4907            ldr     r1, [pc, #28]   ; (0x3f0) = RCC_BASE
 3d2:   6048            str     r0, [r1, #4]	; [RCC_CFGR] &= ~RCC_CFGR_SW -> RCC_CFGR_SW_HSI
 3d4:   4608            mov     r0, r1
 3d6:   6840            ldr     r0, [r0, #4]
 3d8:   f040 0002       orr.w   r0, r0, #2
 3dc:   6048            str     r0, [r1, #4]	; [RCC_CFGR] |= RCC_CFGR_SW_PLL
 3de:   bf00            nop
  LOC(NOT_YET_SWITCHED_TO_PLL):
 3e0:   4803            ldr     r0, [pc, #12]   ; (0x3f0) = RCC_BASE
 3e2:   6840            ldr     r0, [r0, #4]
 3e4:   f000 000c       and.w   r0, r0, #12	; [RCC_CFGR] & (RCC_CFGR_SWS_PLL | RCC_CFGR_SWS_HSE)
 3e8:   2808            cmp     r0, #8		; RCC_CFGR_SWS_PLL
 3ea:   d1f9            bne.n   LOC(NOT_YET_SWITCHED_TO_PLL)        ; 0x3e0
  LOC(DONE):
 3ec:   bd0c            pop     {r2, r3, pc}

 3ee:   .word 0         ; alignment
 3f0:   .word RCC_BASE  ; 0x40021000
 3f4:   .word FLASH_REG_BASE ; 0x40022000
ENDFUNC ; Setup_Flash_RCC

FUNCTION(SysTick_Handler)
 3f8:   4770            bx      lr
ENDFUNC ; SysTick_Handler

 3fa:   0000            movs    r0, r0

FUNCTION(setup_RCC_SCB)
 3fc:   b510            push    {r4, lr}
 3fe:   4813            ldr     r0, [pc, #76]   ; (0x44c) => r0 = RCC_BASE
 400:   6800            ldr     r0, [r0, #0]    ; r0 = [RCC_CR]
 402:   f040 0001       orr.w   r0, r0, #1      ; r0 |= RCC_CR_HSION
 406:   4911            ldr     r1, [pc, #68]   ; (0x44c) = RCC_BASE
 408:   6008            str     r0, [r1, #0]    ; ==> [RCC_CR] |= RCC_CR_HSION
 40a:   4608            mov     r0, r1
 40c:   6840            ldr     r0, [r0, #4]	; r0 = [RCC_CFGR]
 40e:   4910            ldr     r1, [pc, #64]   ; (0x450)
 410:   4008            ands    r0, r1z
 412:   490e            ldr     r1, [pc, #56]	; (0x44c) = RCC_BASE
 414:   6048            str     r0, [r1, #4]    ; => [RCC_CFGR] &= 0xf8ff0000 = ~(RCC_CFGR_PLLSRC, RCC_CFGR_PLLXTPRE, RCC_CFGR_PLLMULL, RCC_CFGR_MCO)
 416:   4608            mov     r0, r1
 418:   6800            ldr     r0, [r0, #0]
 41a:   490e            ldr     r1, [pc, #56]   ; (0x454)
 41c:   4008            ands    r0, r1
 41e:   490b            ldr     r1, [pc, #44]   ; (0x44c)
 420:   6008            str     r0, [r1, #0]    ; => [RCC_CR] &= ~_BV(RCC_CR_PLLON, RCC_CR_CSSON, RCC_CR_HSEON)
 422:   4608            mov     r0, r1
 424:   6800            ldr     r0, [r0, #0]
 426:   f420 2080       bic.w   r0, r0, #262144 ; 0x40000
 42a:   6008            str     r0, [r1, #0]    ; => [RCC_CR] &= ~_BV(RCC_CR_PLL2ON)
 42c:   4608            mov     r0, r1
 42e:   6840            ldr     r0, [r0, #4]
 430:   f420 00fe       bic.w   r0, r0, #8323072 ; 0x7f0000
 434:   6048            str     r0, [r1, #4]    ; [RCC_CFGR] &= ~0x7f0000
 436:   f44f 001f       mov.w   r0, #10420224   ; 0x9f0000
 43a:   6088            str     r0, [r1, #8]    ; [RCC_CIR] = 0x9f0000 = RCC_CIR_LSIRDYC | RCC_CIR_LSERDYC | RCC_CIR_HSIRDYC | RCC_CIR_HSERDYC | RCC_CIR_PLLRDYC | RCC_CIR_CSSC
 43c:   f7ff ff67       bl      Trampoline_Setup_Flash_RCC  ; 0x30e
 440:   f04f 6000       mov.w   r0, #134217728  ; 0x8000000 = FLASH_BASE
 444:   4904            ldr     r1, [pc, #16]   ; (0x458)
 446:   6008            str     r0, [r1, #0]    ; [SCB_BASE + SCB_VTOR] = FLASH_BASE => vector table in Flash
 448:   bd10            pop     {r4, pc}

 44a:   .word 0         ; alignment
 44c:   .word RCC_BASE  ; 0x40021000
 450:   .word 0xf8ff0000
 454:   .word 0xfef6ffff
 458:   .word SCB_BASE + SCB_VTOR ; 0xe000ed08
ENDFUNC ; setup_RCC_SCB


FUNCTION(UsageFault_Handler)
 45c:   bf00            nop
 45e:   e7fe            b.n     0x45e
ENDFUNC ; UsageFault_Handler

 460:   e002            b.n     0x468
 462:   c808            ldmia   r0!, {r3}
 464:   1f12            subs    r2, r2, #4
 466:   c108            stmia   r1!, {r3}
 468:   2a00            cmp     r2, #0
 46a:   d1fa            bne.n   0x462
 46c:   4770            bx      lr

 46e:   4770            bx      lr

FUNCTION(bzero)
	; In:	r1 = address
	;	r2 = count
 470:   2000            movs    r0, #0
 472:   e001            b.n     LOC(CHECK_COND) ; 0x478
 474:   c101            stmia   r1!, {r0}
 476:   1f12            subs    r2, r2, #4
  LOC(CHECK_COND):
 478:   2a00            cmp     r2, #0
 47a:   d1fb            bne.n   0x474
 47c:   4770            bx      lr
ENDFUNC ; bzero


 47e:   0000            movs    r0, r0

FUNCTION(main)
 480:   f7ff fe8c       bl      Setup_GPIOC ; 0x19c
 484:   e012            b.n     LOC(BACK_TO_FOREVER) ; 0x4ac

  LOC(FOREVER):
 486:   2001            movs    r0, #1
 488:   4909            ldr     r1, [pc, #36]   ; (0x4b0) = BB_GPIOC_ODR_13
 48a:   6008            str     r0, [r1, #0]	; [BB_GPIOC_ODR_13] = 1
 48c:   4809            ldr     r0, [pc, #36]   ; (0x4b4)
 48e:   f7ff fe80       bl      BusyLoop ; 0x192
 492:   4808            ldr     r0, [pc, #32]   ; (0x4b4)
 494:   f7ff fe7d       bl      BusyLoop ; 0x192
 498:   2000            movs    r0, #0
 49a:   4907            ldr     r1, [pc, #28]   ; (0x4b8) = BB_GPIOC
 49c:   f8c1 01b4       str.w   r0, [r1, #436]  ; 0x1b4 -> BB_GPIOC_ODR_13 = 0
 4a0:   4804            ldr     r0, [pc, #16]   ; (0x4b4)
 4a2:   f7ff fe76       bl      BusyLoop ; 0x192
 4a6:   4803            ldr     r0, [pc, #12]   ; (0x4b4)
 4a8:   f7ff fe73       bl      BusyLoop ; 0x192
  LOOP(BACK_TO_FOREVER): 
 4ac:   e7eb            b.n     LOC(FOREVER) ; 0x486

 4ae:   .word 0		; alignment

 4b0:   .word BB_GPIOC_ODR_13	; 0x422201b4 = bit 5 of 0x40000000 + (0x2201a0 >> 5) = 0x4001100d bit 5 = GPIOC_BASE + 0x0d bit 5 = GPIOC_BASE + GPIO_ODR bit 13
 4b4:   .word 0x000fffff
 4b8:   .word BB_GPIOC		; 0x42220000
ENDFUNC ; main

main_functors_start:
 4bc:   .word 0x080004cc	; r0 === end of flashcode
 4c0:   .word 0x20000000	; r1 === start of ram
 4c4:   .word 0x00000400	; r2 === stack size?
 4c8:   .word bzero  ; 0x08000470 ; address to call
main_functors_end:
