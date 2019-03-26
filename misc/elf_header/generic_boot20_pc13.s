.cpu cortex-m3
.thumb
.syntax unified

include(stm32f10x.m4)

InitialSP=0x20005000

.section .isr_vector
.global isr_vector_table

 . = 0x8000000
isr_vector_table:
 8000000:   .word InitialSP
 8000004:   .word Reset_Handler

 8000008:   .word DummyHandler // NonMaskableInt_Handler
 800000c:   .word DummyHandler // HardFault_Handler
 8000010:   .word DummyHandler // MemoryManagement_Handler
 8000014:   .word DummyHandler // BusFault_Handler
 8000018:   .word DummyHandler // UsageFault_Handler
 800001c:   .word 0
 8000020:   .word 0
 8000024:   .word 0
 8000028:   .word 0
 800002c:   .word DummyHandler // SVCall_Handler
 8000030:   .word DummyHandler // DebugMonitor_Handler
 8000034:   .word 0
 8000038:   .word DummyHandler // PendSV_Handler
 800003c:   .word DummyHandler // SysTick_Handler
 8000040:   .word DummyHandler // WWDG_Handler
 8000044:   .word DummyHandler // PVD_Handler
 8000048:   .word DummyHandler // TAMPER_Handler
 800004c:   .word DummyHandler // RTC_Handler
 8000050:   .word DummyHandler // FLASH_Handler         
 8000054:   .word DummyHandler // RCC_Handler           
 8000058:   .word DummyHandler // EXTI0_Handler         
 800005c:   .word DummyHandler // EXTI1_Handler         
 8000060:   .word DummyHandler // EXTI2_Handler         
 8000064:   .word DummyHandler // EXTI3_Handler         
 8000068:   .word DummyHandler // EXTI4_Handler         
 800006c:   .word DummyHandler // DMA1_Channel1_Handler 
 8000070:   .word DummyHandler // DMA1_Channel2_Handler 
 8000074:   .word DummyHandler // DMA1_Channel3_Handler 
 8000078:   .word DummyHandler // DMA1_Channel4_Handler 
 800007c:   .word DummyHandler // DMA1_Channel5_Handler 
 8000080:   .word DummyHandler // DMA1_Channel6_Handler 
 8000084:   .word DummyHandler // DMA1_Channel7_Handler 
 8000088:   .word DummyHandler // ADC1_2_Handler        
 800008c:   .word DummyHandler // USB_HP_CAN1_TX_Handler
 8000090:   .word USB_LP_CAN1_RX0_Handler
 8000094:   .word DummyHandler // CAN1_RX1_Handler    
 8000098:   .word DummyHandler // CAN1_SCE_Handler    
 800009c:   .word DummyHandler // EXTI9_5_Handler     
 80000a0:   .word DummyHandler // TIM1_BRK_Handler    
 80000a4:   .word DummyHandler // TIM1_UP_Handler     
 80000a8:   .word DummyHandler // TIM1_TRG_COM_Handler
 80000ac:   .word DummyHandler // TIM1_CC_Handler     
 80000b0:   .word DummyHandler // TIM2_Handler        
 80000b4:   .word DummyHandler // TIM3_Handler        
 80000b8:   .word DummyHandler // TIM4_Handler        
 80000bc:   .word DummyHandler // I2C1_EV_Handler     
 80000c0:   .word DummyHandler // I2C1_ER_Handler     
 80000c4:   .word DummyHandler // I2C2_EV_Handler     
 80000c8:   .word DummyHandler // I2C2_ER_Handler     
 80000cc:   .word DummyHandler // SPI1_Handler        
 80000d0:   .word DummyHandler // SPI2_Handler        
 80000d4:   .word DummyHandler // USART1_Handler      
 80000d8:   .word DummyHandler // USART2_Handler      
 80000dc:   .word DummyHandler // USART3_Handler      
 80000e0:   .word DummyHandler // EXTI15_10_Handler   
 80000e4:   .word DummyHandler // RTCAlarm_Handler    
 80000e8:   .word DummyHandler // USBWakeUp_Handler   
 80000ec:   f85f f108   ldr.w   pc, [pc, #-264] ; 0x7ffffe8

FUNCTION(Reset_Handler)
 80000f0:   2100        movs    r1, #0
 80000f2:   f000 b804   b.w 0x80000fe
 80000f6:   4b0b        ldr r3, [pc, #44]   ; (0x8000124)
 80000f8:   585b        ldr r3, [r3, r1]
 80000fa:   5043        str r3, [r0, r1]
 80000fc:   3104        adds    r1, #4
 80000fe:   480a        ldr r0, [pc, #40]   ; (0x8000128)
 8000100:   4b0a        ldr r3, [pc, #40]   ; (0x800012c)
 8000102:   1842        adds    r2, r0, r1
 8000104:   429a        cmp r2, r3
 8000106:   f4ff aff6   bcc.w   0x80000f6
 800010a:   4a09        ldr r2, [pc, #36]   ; (0x8000130)
 800010c:   f000 b803   b.w 0x8000116
 8000110:   2300        movs    r3, #0
 8000112:   f842 3b04   str.w   r3, [r2], #4
 8000116:   4b07        ldr r3, [pc, #28]   ; (0x8000134)
 8000118:   429a        cmp r2, r3
 800011a:   f4ff aff9   bcc.w   0x8000110
 800011e:   f000 fa45   bl  0x80005ac
 8000122:   4770        bx  lr

 8000124:   .word 0x08001930
 8000128:   .word 0x20000000
 800012c:   .word 0x200002c8
 8000130:   .word 0x200002c8
 8000134:   .word 0x2000030c
ENDFUNC // Reset_Handler

DummyHandler:
 8000138:   f7ff bffe   b.w 0x8000138

 800013c:   4770        bx  lr
 800013e:   4770        bx  lr
 8000140:   4770        bx  lr
 8000142:   2803        cmp r0, #3
 8000144:   bf8c        ite hi
 8000146:   2002        movhi   r0, #2
 8000148:   2000        movls   r0, #0
 800014a:   4770        bx  lr
 800014c:   4770        bx  lr
 800014e:   0000        movs    r0, r0
 8000150:   4b03        ldr r3, [pc, #12]   ; (0x8000160)
 8000152:   681b        ldr r3, [r3, #0]
 8000154:   7a9b        ldrb    r3, [r3, #10]
 8000156:   b113        cbz r3, 0x800015e
 8000158:   4b02        ldr r3, [pc, #8]    ; (0x8000164)
 800015a:   2205        movs    r2, #5
 800015c:   601a        str r2, [r3, #0]
 800015e:   4770        bx  lr
 8000160:   0304        lsls    r4, r0, #12
 8000162:   2000        movs    r0, #0
 8000164:   0310        lsls    r0, r2, #12
 8000166:   2000        movs    r0, #0
 8000168:   4770        bx  lr
 800016a:   4770        bx  lr
 800016c:   4770        bx  lr
 800016e:   4770        bx  lr
 8000170:   4770        bx  lr
 8000172:   4770        bx  lr

 8000174:   4b01        ldr r3, [pc, #4]    ; (0x800017c)
 8000176:   2204        movs    r2, #4
 8000178:   601a        str r2, [r3, #0]
 800017a:   4770        bx  lr
 800017c:   .word 0x20000310

FUNCTION(func_08000180)
 8000180:   b510        push    {r4, lr}
 8000182:   f000 fc87   bl  0x8000a94
 8000186:   4b21        ldr r3, LOC(SRAM_0304)  // [pc, #132]  ; (0x800020c)
 8000188:   4a21        ldr r2, LOC(SRAM_02B8)  // [pc, #132]  ; (0x8000210)
 800018a:   681b        ldr r3, [r3, #0]        // r3 = SRAM_0304
 800018c:   2400        movs    r4, #0          // r4 = 0
 800018e:   6812        ldr r2, [r2, #0]        // r2 = SRAM_02B8
 8000190:   729c        strb    r4, [r3, #10]   
 8000192:   79d2        ldrb    r2, [r2, #7]
 8000194:   4620        mov r0, r4
 8000196:   725a        strb    r2, [r3, #9]

 8000198:   4a1e        ldr r2, LOC({USB_BTABLE})   // [pc, #120]  ; (0x8000214)
 800019a:   4b1f        ldr r3, LOC({USB_BASE}) // [pc, #124]  ; (0x8000218)
 800019c:   6014        str r4, [r2, #0]        // USB_BTABLE = 0

 800019e:   6819        ldr r1, [r3, #0]        // r1 = [r3]
 80001a0:   f421 41ec   bic.w   r1, r1, #30208  ; 0x7600
 80001a4:   f021 0170   bic.w   r1, r1, #112    ; 0x70
 80001a8:   f441 7100   orr.w   r1, r1, #512    ; 0x200
 80001ac:   b289        uxth    r1, r1
 80001ae:   6019        str r1, [r3, #0]
 
 80001b0:   6819        ldr r1, [r3, #0]
 80001b2:   f421 41e0   bic.w   r1, r1, #28672  ; 0x7000
 80001b6:   f021 0140   bic.w   r1, r1, #64 ; 0x40
 80001ba:   b289        uxth    r1, r1
 80001bc:   f081 0110   eor.w   r1, r1, #16
 80001c0:   6019        str r1, [r3, #0]
 
 80001c2:   6811        ldr r1, [r2, #0]        // r1 = [USB_BTABLE + 0*0x10 + USB_ADDR_TX]
 80001c4:   4b15        ldr r3, LOC(SRAM_3004)  // [pc, #84]   ; (0x800021c)
 80001c6:   b289        uxth    r1, r1
 80001c8:   440b        add r3, r1
 80001ca:   005b        lsls    r3, r3, #1
 80001cc:   2140        movs    r1, #64 ; 0x40
 80001ce:   6019        str r1, [r3, #0]
 80001d0:   6813        ldr r3, [r2, #0]
 80001d2:   2280        movs    r2, #128    ; 0x80
 80001d4:   b29b        uxth    r3, r3
 80001d6:   f103 5300   add.w   r3, r3, #536870912  ; 0x20000000
 80001da:   f503 5340   add.w   r3, r3, #12288  ; 0x3000
 80001de:   005b        lsls    r3, r3, #1
 80001e0:   601a        str r2, [r3, #0]
 80001e2:   f000 fe37   bl  0x8000e54
 80001e6:   4b0e        ldr r3, LOC(SRAM_02DC) // [pc, #56]   ; (0x8000220)
 80001e8:   4620        mov r0, r4
 80001ea:   681b        ldr r3, [r3, #0]
 80001ec:   f893 1030   ldrb.w  r1, [r3, #48]   ; 0x30
 80001f0:   f000 fe88   bl  0x8000f04
 80001f4:   4620        mov r0, r4
 80001f6:   f000 fe1e   bl  0x8000e36
 80001fa:   4b0a        ldr r3, LOC(SRAM_0310) // [pc, #40]   ; (0x8000224)
 80001fc:   2201        movs    r2, #1
 80001fe:   4620        mov r0, r4
 8000200:   e8bd 4010   ldmia.w sp!, {r4, lr}
 8000204:   601a        str r2, [r3, #0]
 8000206:   f001 bb1f   b.w 0x8001848
 800020a:   bf00        nop
   LOC(SRAM_0304):      .word SRAM_0304 // 0x20000304
   LOC(SRAM_02B8):      .word SRAM_02B8 // 0x200002b8
   LOC({USB_BTABLE}):   .word USB_BASE + USB_BTABLE // 0x40005c50
   LOC({USB_BASE}):     .word USB_BASE // 0x40005c00
   LOC(SRAM_3004):      .word 0x20003004
   LOC(SRAM_02DC):      .word 0x200002dc
   LOC(SRAM_0310):      .word 0x20000310
ENDFUNC // func_08000180

 8000228:   b538        push    {r3, r4, r5, lr}
 800022a:   4b12        ldr r3, [pc, #72]   ; (0x8000274)
 800022c:   4605        mov r5, r0
 800022e:   681a        ldr r2, [r3, #0]
 8000230:   461c        mov r4, r3
 8000232:   7812        ldrb    r2, [r2, #0]
 8000234:   f002 027f   and.w   r2, r2, #127    ; 0x7f
 8000238:   2a21        cmp r2, #33 ; 0x21
 800023a:   d119        bne.n   0x8000270
 800023c:   f000 fcc0   bl  0x8000bc0
 8000240:   b1b0        cbz r0, 0x8000270
 8000242:   1e68        subs    r0, r5, #1
 8000244:   2804        cmp r0, #4
 8000246:   d813        bhi.n   0x8000270
 8000248:   e8df f000   tbb [pc, r0]
 800024c:   0503        lsls    r3, r0, #20
 800024e:   1207        asrs    r7, r0, #8
 8000250:   0009        movs    r1, r1
 8000252:   4b09        ldr r3, [pc, #36]   ; (0x8000278)
 8000254:   e004        b.n 0x8000260
 8000256:   4b09        ldr r3, [pc, #36]   ; (0x800027c)
 8000258:   e002        b.n 0x8000260
 800025a:   4b09        ldr r3, [pc, #36]   ; (0x8000280)
 800025c:   e000        b.n 0x8000260
 800025e:   4b09        ldr r3, [pc, #36]   ; (0x8000284)
 8000260:   6822        ldr r2, [r4, #0]
 8000262:   2400        movs    r4, #0
 8000264:   4620        mov r0, r4
 8000266:   6193        str r3, [r2, #24]
 8000268:   8254        strh    r4, [r2, #18]
 800026a:   4798        blx r3
 800026c:   4620        mov r0, r4
 800026e:   bd38        pop {r3, r4, r5, pc}
 8000270:   2002        movs    r0, #2
 8000272:   bd38        pop {r3, r4, r5, pc}
 8000274:   .word SRAM_0304 // 0x20000304
 8000278:  .word 0x0800 0b09        lsrs    r1, r1, #12
 800027a:   0800        lsrs    r0, r0, #32
 800027c:  .word 0x0800 0b31        lsrs    r1, r6, #12
 800027e:   0800        lsrs    r0, r0, #32
 8000280:  .word 0x0800 0af1        lsrs    r1, r6, #11
 8000282:   0800        lsrs    r0, r0, #32
 8000284:  .word 0x0800 0ad9        lsrs    r1, r3, #11
 8000286:   0800        lsrs    r0, r0, #32
 8000288:   4901        ldr r1, [pc, #4]    ; (0x8000290)
 800028a:   f001 b8dd   b.w 0x8001448
 800028e:   bf00        nop
 8000290:   0144        lsls    r4, r0, #5
 8000292:   2000        movs    r0, #0
 8000294:   4901        ldr r1, [pc, #4]    ; (0x800029c)
 8000296:   f001 b8d7   b.w 0x8001448
 800029a:   bf00        nop
 800029c:   02b8        lsls    r0, r7, #10
 800029e:   2000        movs    r0, #0
 80002a0:   4b05        ldr r3, [pc, #20]   ; (0x80002b8)
 80002a2:   681b        ldr r3, [r3, #0]
 80002a4:   789b        ldrb    r3, [r3, #2]
 80002a6:   2b07        cmp r3, #7
 80002a8:   d804        bhi.n   0x80002b4
 80002aa:   4904        ldr r1, [pc, #16]   ; (0x80002bc)
 80002ac:   eb01 01c3   add.w   r1, r1, r3, lsl #3
 80002b0:   f001 b8ca   b.w 0x8001448
 80002b4:   2000        movs    r0, #0
 80002b6:   4770        bx  lr
 80002b8:   0304        lsls    r4, r0, #12
 80002ba:   2000        movs    r0, #0
 80002bc:   0094        lsls    r4, r2, #2
 80002be:   2000        movs    r0, #0
 80002c0:   4901        ldr r1, [pc, #4]    ; (0x80002c8)
 80002c2:   f001 b8c1   b.w 0x8001448
 80002c6:   bf00        nop
 80002c8:   00e0        lsls    r0, r4, #3
 80002ca:   2000        movs    r0, #0
 80002cc:   b508        push    {r3, lr}
 80002ce:   4b08        ldr r3, [pc, #32]   ; (0x80002f0)
 80002d0:   681b        ldr r3, [r3, #0]
 80002d2:   781b        ldrb    r3, [r3, #0]
 80002d4:   f003 037f   and.w   r3, r3, #127    ; 0x7f
 80002d8:   2b21        cmp r3, #33 ; 0x21
 80002da:   d106        bne.n   0x80002ea
 80002dc:   f000 fc70   bl  0x8000bc0
 80002e0:   2800        cmp r0, #0
 80002e2:   bf0c        ite eq
 80002e4:   2002        moveq   r0, #2
 80002e6:   2000        movne   r0, #0
 80002e8:   bd08        pop {r3, pc}
 80002ea:   2002        movs    r0, #2
 80002ec:   bd08        pop {r3, pc}
 80002ee:   bf00        nop
 80002f0:   0304        lsls    r4, r0, #12
 80002f2:   2000        movs    r0, #0
 80002f4:   b537        push    {r0, r1, r2, r4, r5, lr}
 80002f6:   4c19        ldr r4, [pc, #100]  ; (0x800035c)
 80002f8:   200c        movs    r0, #12
 80002fa:   6825        ldr r5, [r4, #0]
 80002fc:   f000 fb7e   bl  0x80009fc
 8000300:   4028        ands    r0, r5
 8000302:   f440 3580   orr.w   r5, r0, #65536  ; 0x10000
 8000306:   6025        str r5, [r4, #0]
 8000308:   4815        ldr r0, [pc, #84]   ; (0x8000360)
 800030a:   210c        movs    r1, #12
 800030c:   2200        movs    r2, #0
 800030e:   f000 f9bb   bl  0x8000688
 8000312:   2300        movs    r3, #0
 8000314:   9301        str r3, [sp, #4]
 8000316:   9b01        ldr r3, [sp, #4]
 8000318:   f5b3 7f00   cmp.w   r3, #512    ; 0x200
 800031c:   d202        bcs.n   0x8000324
 800031e:   9b01        ldr r3, [sp, #4]
 8000320:   3301        adds    r3, #1
 8000322:   e7f7        b.n 0x8000314
 8000324:   200c        movs    r0, #12
 8000326:   6825        ldr r5, [r4, #0]
 8000328:   f000 fb68   bl  0x80009fc
 800032c:   4028        ands    r0, r5
 800032e:   f440 2580   orr.w   r5, r0, #262144 ; 0x40000
 8000332:   6025        str r5, [r4, #0]
 8000334:   f000 fb74   bl  0x8000a20
 8000338:   4b0a        ldr r3, [pc, #40]   ; (0x8000364)
 800033a:   b2c2        uxtb    r2, r0
 800033c:   6018        str r0, [r3, #0]
 800033e:   4b0a        ldr r3, [pc, #40]   ; (0x8000368)
 8000340:   f3c0 2007   ubfx    r0, r0, #8, #8
 8000344:   f883 2029   strb.w  r2, [r3, #41]   ; 0x29
 8000348:   f883 002a   strb.w  r0, [r3, #42]   ; 0x2a
 800034c:   4b07        ldr r3, [pc, #28]   ; (0x800036c)
 800034e:   715a        strb    r2, [r3, #5]
 8000350:   7198        strb    r0, [r3, #6]
 8000352:   f000 fea1   bl  0x8001098
 8000356:   b003        add sp, #12
 8000358:   bd30        pop {r4, r5, pc}
 800035a:   bf00        nop
 800035c:   0804        lsrs    r4, r0, #32
 800035e:   4001        ands    r1, r0
 8000360:   0800        lsrs    r0, r0, #32
 8000362:   4001        ands    r1, r0
 8000364:   02c8        lsls    r0, r1, #11
 8000366:   2000        movs    r0, #0
 8000368:   00ec        lsls    r4, r5, #3
 800036a:   2000        movs    r0, #0
 800036c:   0129        lsls    r1, r5, #4
 800036e:   2000        movs    r0, #0
 8000370:   4b04        ldr r3, [pc, #16]   ; (0x8000384)
 8000372:   681a        ldr r2, [r3, #0]
 8000374:   b292        uxth    r2, r2
 8000376:   f042 020c   orr.w   r2, r2, #12
 800037a:   601a        str r2, [r3, #0]
 800037c:   4b02        ldr r3, [pc, #8]    ; (0x8000388)
 800037e:   2203        movs    r2, #3
 8000380:   601a        str r2, [r3, #0]
 8000382:   4770        bx  lr
 8000384:   .word USB_BASE + USB_CNTR // 0x40005c40
 8000388:   0310        lsls    r0, r2, #12
 800038a:   2000        movs    r0, #0
 800038c:   4b04        ldr r3, [pc, #16]   ; (0x80003a0)
 800038e:   f64f 72fb   movw    r2, #65531  ; 0xfffb
 8000392:   6819        ldr r1, [r3, #0]
 8000394:   400a        ands    r2, r1
 8000396:   601a        str r2, [r3, #0]
 8000398:   f44f 423f   mov.w   r2, #48896  ; 0xbf00
 800039c:   601a        str r2, [r3, #0]
 800039e:   4770        bx  lr
 80003a0:   .word USB_BASE + USB_CNTR // 0x40005c40
 80003a4:   b510        push    {r4, lr}
 80003a6:   4c1e        ldr r4, [pc, #120]  ; (0x8000420)
 80003a8:   2807        cmp r0, #7
 80003aa:   bf18        it  ne
 80003ac:   7020        strbne  r0, [r4, #0]
 80003ae:   7823        ldrb    r3, [r4, #0]
 80003b0:   2b05        cmp r3, #5
 80003b2:   d832        bhi.n   0x800041a
 80003b4:   e8df f003   tbb [pc, r3]
 80003b8:   0603        lsls    r3, r0, #24
 80003ba:   0e0a        lsrs    r2, r1, #24
 80003bc:   2116        movs    r1, #22
 80003be:   f7ff ffe5   bl  0x800038c
 80003c2:   e02a        b.n 0x800041a
 80003c4:   f7ff ffe2   bl  0x800038c
 80003c8:   2304        movs    r3, #4
 80003ca:   e027        b.n 0x800041c
 80003cc:   2302        movs    r3, #2
 80003ce:   7063        strb    r3, [r4, #1]
 80003d0:   2303        movs    r3, #3
 80003d2:   e023        b.n 0x800041c
 80003d4:   7863        ldrb    r3, [r4, #1]
 80003d6:   3b01        subs    r3, #1
 80003d8:   b2db        uxtb    r3, r3
 80003da:   7063        strb    r3, [r4, #1]
 80003dc:   7863        ldrb    r3, [r4, #1]
 80003de:   b9f3        cbnz    r3, 0x800041e
 80003e0:   2204        movs    r2, #4
 80003e2:   e017        b.n 0x8000414
 80003e4:   4b0f        ldr r3, [pc, #60]   ; (0x8000424)
 80003e6:   681a        ldr r2, [r3, #0]
 80003e8:   b292        uxth    r2, r2
 80003ea:   f042 0210   orr.w   r2, r2, #16
 80003ee:   601a        str r2, [r3, #0]
 80003f0:   2305        movs    r3, #5
 80003f2:   7023        strb    r3, [r4, #0]
 80003f4:   230a        movs    r3, #10
 80003f6:   7063        strb    r3, [r4, #1]
 80003f8:   bd10        pop {r4, pc}
 80003fa:   7863        ldrb    r3, [r4, #1]
 80003fc:   3b01        subs    r3, #1
 80003fe:   b2db        uxtb    r3, r3
 8000400:   7063        strb    r3, [r4, #1]
 8000402:   7863        ldrb    r3, [r4, #1]
 8000404:   b95b        cbnz    r3, 0x800041e
 8000406:   4a07        ldr r2, [pc, #28]   ; (0x8000424)
 8000408:   f64f 73ef   movw    r3, #65519  ; 0xffef
 800040c:   6811        ldr r1, [r2, #0]
 800040e:   400b        ands    r3, r1
 8000410:   6013        str r3, [r2, #0]
 8000412:   2206        movs    r2, #6
 8000414:   4b02        ldr r3, [pc, #8]    ; (0x8000420)
 8000416:   701a        strb    r2, [r3, #0]
 8000418:   bd10        pop {r4, pc}
 800041a:   2306        movs    r3, #6
 800041c:   7023        strb    r3, [r4, #0]
 800041e:   bd10        pop {r4, pc}
 8000420:   02ce        lsls    r6, r1, #11
 8000422:   2000        movs    r0, #0
 8000424:   .word USB_BASE + USB_CNTR // 0x40005c40
 8000428:   4b06        ldr r3, [pc, #24]   ; (0x8000444)
 800042a:   2201        movs    r2, #1
 800042c:   601a        str r2, [r3, #0]
 800042e:   4a06        ldr r2, [pc, #24]   ; (0x8000448)
 8000430:   2000        movs    r0, #0
 8000432:   4906        ldr r1, [pc, #24]   ; (0x800044c)
 8000434:   6018        str r0, [r3, #0]
 8000436:   6010        str r0, [r2, #0]
 8000438:   f44f 52e0   mov.w   r2, #7168   ; 0x1c00
 800043c:   800a        strh    r2, [r1, #0]
 800043e:   601a        str r2, [r3, #0]
 8000440:   4770        bx  lr
 8000442:   bf00        nop
 8000444:   .word USB_BASE + USB_CNTR // 0x40005c40
 8000448:   .word USB_BASE + USB_ISTR // 0x40005c44
 800044c:   0308        lsls    r0, r1, #12
 800044e:   2000        movs    r0, #0
 8000450:   4b04        ldr r3, [pc, #16]   ; (0x8000464)
 8000452:   2201        movs    r2, #1
 8000454:   601a        str r2, [r3, #0]
 8000456:   4a04        ldr r2, [pc, #16]   ; (0x8000468)
 8000458:   2000        movs    r0, #0
 800045a:   6010        str r0, [r2, #0]
 800045c:   2203        movs    r2, #3
 800045e:   601a        str r2, [r3, #0]
 8000460:   4770        bx  lr
 8000462:   bf00        nop
 8000464:   .word USB_BASE + USB_CNTR // 0x40005c40
 8000468:   .word USB_BASE + USB_ISTR // 0x40005c44
 800046c:   f7ff bff0   b.w 0x8000450
 8000470:   b507        push    {r0, r1, r2, lr}
 8000472:   2314        movs    r3, #20
 8000474:   f88d 3004   strb.w  r3, [sp, #4]
 8000478:   2300        movs    r3, #0
 800047a:   f88d 3005   strb.w  r3, [sp, #5]
 800047e:   f88d 3006   strb.w  r3, [sp, #6]
 8000482:   a801        add r0, sp, #4
 8000484:   2301        movs    r3, #1
 8000486:   f88d 3007   strb.w  r3, [sp, #7]
 800048a:   f000 f9ff   bl  0x800088c
 800048e:   b003        add sp, #12
 8000490:   f85d fb04   ldr.w   pc, [sp], #4
 8000494:   b510        push    {r4, lr}
 8000496:   f000 facf   bl  0x8000a38
 800049a:   4b09        ldr r3, [pc, #36]   ; (0x80004c0)
 800049c:   2400        movs    r4, #0
 800049e:   681b        ldr r3, [r3, #0]
 80004a0:   729c        strb    r4, [r3, #10]
 80004a2:   f7ff ffc1   bl  0x8000428
 80004a6:   4b07        ldr r3, [pc, #28]   ; (0x80004c4)
 80004a8:   4a07        ldr r2, [pc, #28]   ; (0x80004c8)
 80004aa:   601c        str r4, [r3, #0]
 80004ac:   f44f 433f   mov.w   r3, #48896  ; 0xbf00
 80004b0:   8013        strh    r3, [r2, #0]
 80004b2:   4a06        ldr r2, [pc, #24]   ; (0x80004cc)
 80004b4:   6013        str r3, [r2, #0]
 80004b6:   f7ff ffdb   bl  0x8000470
 80004ba:   4b05        ldr r3, [pc, #20]   ; (0x80004d0)
 80004bc:   601c        str r4, [r3, #0]
 80004be:   bd10        pop {r4, pc}
 80004c0:   0304        lsls    r4, r0, #12
 80004c2:   2000        movs    r0, #0
 80004c4:   .word USB_BASE + USB_ISTR // 0x40005c44
 80004c8:   0308        lsls    r0, r1, #12
 80004ca:   2000        movs    r0, #0
 80004cc:   .word USB_BASE + USB_CNTR // 0x40005c40
 80004d0:   0310        lsls    r0, r2, #12
 80004d2:   2000        movs    r0, #0
 80004d4:   b507        push    {r0, r1, r2, lr}
 80004d6:   2314        movs    r3, #20
 80004d8:   f88d 3004   strb.w  r3, [sp, #4]
 80004dc:   a801        add r0, sp, #4
 80004de:   2300        movs    r3, #0
 80004e0:   f88d 3005   strb.w  r3, [sp, #5]
 80004e4:   f88d 3006   strb.w  r3, [sp, #6]
 80004e8:   f88d 3007   strb.w  r3, [sp, #7]
 80004ec:   f000 f9ce   bl  0x800088c
 80004f0:   b003        add sp, #12
 80004f2:   f85d fb04   ldr.w   pc, [sp], #4
 80004f6:   0000        movs    r0, r0

FUNCTION(USB_LP_CAN1_RX0_Handler)
 80004f8:   b570        push    {r4, r5, r6, lr}
 80004fa:   4d27        ldr r5, LOC({USB_ISTR}) // [pc, #156]  ; (0x8000598)
 80004fc:   4c27        ldr r4, LOC(wIstr) // [pc, #156]  ; (0x800059c)
 80004fe:   682b        ldr r3, [r5, #0]    // r3 = USB_ISTR
 8000500:   4e27        ldr r6, LOC(wInterruptMask) // [pc, #156]  ; (0x80005a0)
 8000502:   b29b        uxth    r3, r3
 8000504:   8023        strh    r3, [r4, #0]    // wIstr = USB_ISTR
 8000506:   8822        ldrh    r2, [r4, #0]    // r2 = USB_ISTR
 8000508:   8833        ldrh    r3, [r6, #0]
 800050a:   4013        ands    r3, r2
 800050c:   0559        lsls    r1, r3, #21
 800050e:   d505        bpl.n   0x800051c
 8000510:   f64f 33ff   movw    r3, #64511  ; 0xfbff    // CLR_RESET
 8000514:   602b        str r3, [r5, #0]                // USB_ISTR = CLR_RESET
 8000516:   4b23        ldr r3, [pc, #140]  ; (0x80005a4)
 8000518:   685b        ldr r3, [r3, #4]
 800051a:   4798        blx r3                  // Device_Property.Reset();

 800051c:   8822        ldrh    r2, [r4, #0]    // r2 = USB_ISTR
 800051e:   8833        ldrh    r3, [r6, #0]
 8000520:   401a        ands    r2, r3
 8000522:   0492        lsls    r2, r2, #18
 8000524:   bf44        itt mi
 8000526:   f64d 72ff   movwmi  r2, #57343  ; 0xdfff    // CLR_ERR
 800052a:   602a        strmi   r2, [r5, #0]            // USB_ISTR = CLR_ERR

 800052c:   8822        ldrh    r2, [r4, #0]
 800052e:   4013        ands    r3, r2
 8000530:   04db        lsls    r3, r3, #19
 8000532:   d505        bpl.n   0x8000540
 8000534:   f64e 73ff   movw    r3, #61439  ; 0xefff
 8000538:   602b        str r3, [r5, #0]                // USB_ISTR = CLR_WKUP
 800053a:   2000        movs    r0, #0
 800053c:   f7ff ff32   bl  0x80003a4

 8000540:   8822        ldrh    r2, [r4, #0]
 8000542:   8833        ldrh    r3, [r6, #0]
 8000544:   4013        ands    r3, r2
 8000546:   0518        lsls    r0, r3, #20
 8000548:   d504        bpl.n   0x8000554
 800054a:   f7ff ff11   bl  0x8000370
 800054e:   f24f 73ff   movw    r3, #63487  ; 0xf7ff
 8000552:   602b        str r3, [r5, #0]                // USB_ISTR = CLR_SUSP

 8000554:   8822        ldrh    r2, [r4, #0]
 8000556:   8833        ldrh    r3, [r6, #0]
 8000558:   401a        ands    r2, r3
 800055a:   0591        lsls    r1, r2, #22
 800055c:   d507        bpl.n   0x800056e
 800055e:   f64f 52ff   movw    r2, #65023  ; 0xfdff
 8000562:   602a        str r2, [r5, #0]                // USB_ISTR = CLR_SOF
 8000564:   4a10        ldr r2, [pc, #64]   ; (0x80005a8)
 8000566:   7811        ldrb    r1, [r2, #0]
 8000568:   3101        adds    r1, #1
 800056a:   b2c9        uxtb    r1, r1
 800056c:   7011        strb    r1, [r2, #0]

 800056e:   8822        ldrh    r2, [r4, #0]
 8000570:   4013        ands    r3, r2
 8000572:   05da        lsls    r2, r3, #23
 8000574:   d505        bpl.n   0x8000582
 8000576:   f64f 63ff   movw    r3, #65279  ; 0xfeff    // USB_ISTR = CLR_ESOF
 800057a:   602b        str r3, [r5, #0]
 800057c:   2007        movs    r0, #7
 800057e:   f7ff ff11   bl  0x80003a4

 8000582:   8822        ldrh    r2, [r4, #0]
 8000584:   8833        ldrh    r3, [r6, #0]
 8000586:   4013        ands    r3, r2
 8000588:   041b        lsls    r3, r3, #16
 800058a:   d503        bpl.n   0x8000594
 800058c:   e8bd 4070   ldmia.w sp!, {r4, r5, r6, lr}
 8000590:   f000 bcd8   b.w CTR_LP // 0x8000f44

 8000594:   bd70        pop {r4, r5, r6, pc}
 8000596:   bf00        nop
 8000598: LOC({USB_ISTR}):      .word USB_BASE + USB_ISTR // 0x40005c44
 800059c: LOC(wIstr):           .word wIstr
 80005a0: LOC(wInterruptMask):  .word wInterruptMask // 0x20000308 
 80005a4:   .word 0x20000000
 80005a8:   .word 0x2000030c
ENDFUNC // USB_LP_CAN1_RX0_Handler

 80005ac:   b537        push    {r0, r1, r2, r4, r5, lr}
 80005ae:   f000 f8a7   bl  0x8000700
 80005b2:   f000 f8c9   bl  0x8000748
 80005b6:   f000 f8f7   bl  0x80007a8
 80005ba:   f7ff fe9b   bl  0x80002f4
 80005be:   f000 f907   bl  0x80007d0
 80005c2:   f000 f93f   bl  0x8000844
 80005c6:   2801        cmp r0, #1
 80005c8:   4604        mov r4, r0
 80005ca:   f04f 0300   mov.w   r3, #0
 80005ce:   d002        beq.n   0x80005d6
 80005d0:   2802        cmp r0, #2
 80005d2:   d035        beq.n   0x8000640
 80005d4:   e008        b.n 0x80005e8
 80005d6:   9300        str r3, [sp, #0]
 80005d8:   4828        ldr r0, [pc, #160]  ; (0x800067c)
 80005da:   210d        movs    r1, #13
 80005dc:   2205        movs    r2, #5
 80005de:   f44f 23a0   mov.w   r3, #327680 ; 0x50000
 80005e2:   f000 f865   bl  0x80006b0
 80005e6:   e044        b.n 0x8000672
 80005e8:   9300        str r3, [sp, #0]
 80005ea:   4824        ldr r0, [pc, #144]  ; (0x800067c)
 80005ec:   210d        movs    r1, #13
 80005ee:   2205        movs    r2, #5
 80005f0:   f44f 23a0   mov.w   r3, #327680 ; 0x50000
 80005f4:   f000 f85c   bl  0x80006b0
 80005f8:   4821        ldr r0, [pc, #132]  ; (0x8000680)
 80005fa:   f000 f8f7   bl  0x80007ec
 80005fe:   b128        cbz r0, 0x800060c
 8000600:   f000 f84e   bl  0x80006a0
 8000604:   1c04        adds    r4, r0, #0
 8000606:   bf18        it  ne
 8000608:   2401        movne   r4, #1
 800060a:   e032        b.n 0x8000672
 800060c:   481d        ldr r0, [pc, #116]  ; (0x8000684)
 800060e:   f000 f8ed   bl  0x80007ec
 8000612:   2800        cmp r0, #0
 8000614:   d1f4        bne.n   0x8000600
 8000616:   2401        movs    r4, #1
 8000618:   e02b        b.n 0x8000672
 800061a:   2300        movs    r3, #0
 800061c:   9300        str r3, [sp, #0]
 800061e:   4817        ldr r0, [pc, #92]   ; (0x800067c)
 8000620:   210d        movs    r1, #13
 8000622:   2201        movs    r2, #1
 8000624:   f44f 1380   mov.w   r3, #1048576    ; 0x100000
 8000628:   f000 f842   bl  0x80006b0
 800062c:   f000 fbe6   bl  0x8000dfc
 8000630:   b108        cbz r0, 0x8000636
 8000632:   f000 fbe9   bl  0x8000e08
 8000636:   3501        adds    r5, #1
 8000638:   2d05        cmp r5, #5
 800063a:   ddee        ble.n   0x800061a
 800063c:   2c00        cmp r4, #0
 800063e:   d1ec        bne.n   0x800061a
 8000640:   4810        ldr r0, [pc, #64]   ; (0x8000684)
 8000642:   f000 f8d3   bl  0x80007ec
 8000646:   b108        cbz r0, 0x800064c
 8000648:   480e        ldr r0, [pc, #56]   ; (0x8000684)
 800064a:   e004        b.n 0x8000656
 800064c:   480c        ldr r0, [pc, #48]   ; (0x8000680)
 800064e:   f000 f8cd   bl  0x80007ec
 8000652:   b118        cbz r0, 0x800065c
 8000654:   480a        ldr r0, [pc, #40]   ; (0x8000680)
 8000656:   f000 f961   bl  0x800091c
 800065a:   e00c        b.n 0x8000676
 800065c:   9000        str r0, [sp, #0]
 800065e:   210d        movs    r1, #13
 8000660:   4806        ldr r0, [pc, #24]   ; (0x800067c)
 8000662:   2205        movs    r2, #5
 8000664:   f44f 23a0   mov.w   r3, #327680 ; 0x50000
 8000668:   f000 f822   bl  0x80006b0
 800066c:   f000 f96a   bl  0x8000944
 8000670:   e001        b.n 0x8000676
 8000672:   2500        movs    r5, #0
 8000674:   e7e0        b.n 0x8000638
 8000676:   2000        movs    r0, #0
 8000678:   b003        add sp, #12
 800067a:   bd30        pop {r4, r5, pc}
 800067c:   1000        asrs    r0, r0, #32
 800067e:   4001        ands    r1, r0
 8000680:   5000        str r0, [r0, r0]
 8000682:   0800        lsrs    r0, r0, #32
 8000684:   2000        movs    r0, #0
 8000686:   0800        lsrs    r0, r0, #32
 8000688:   2301        movs    r3, #1
 800068a:   fa03 f101   lsl.w   r1, r3, r1
 800068e:   f1d2 0201   rsbs    r2, r2, #1
 8000692:   bf38        it  cc
 8000694:   2200        movcc   r2, #0
 8000696:   0113        lsls    r3, r2, #4
 8000698:   4099        lsls    r1, r3
 800069a:   6101        str r1, [r0, #16]
 800069c:   4770        bx  lr
 800069e:   0000        movs    r0, r0
 80006a0:   4b02        ldr r3, [pc, #8]    ; (0x80006ac)
 80006a2:   6818        ldr r0, [r3, #0]
 80006a4:   f3c0 0080   ubfx    r0, r0, #2, #1
 80006a8:   4770        bx  lr
 80006aa:   bf00        nop
 80006ac:   0c08        lsrs    r0, r1, #16
 80006ae:   4001        ands    r1, r0
 80006b0:   e92d 47f0   stmdb   sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
 80006b4:   f89d a020   ldrb.w  r10, [sp, #32]
 80006b8:   4614        mov r4, r2
 80006ba:   f1ca 0701   rsb r7, r10, #1
 80006be:   b2ff        uxtb    r7, r7
 80006c0:   463a        mov r2, r7
 80006c2:   4680        mov r8, r0
 80006c4:   4689        mov r9, r1
 80006c6:   461e        mov r6, r3
 80006c8:   f7ff ffde   bl  0x8000688
 80006cc:   b1b4        cbz r4, 0x80006fc
 80006ce:   4635        mov r5, r6
 80006d0:   b115        cbz r5, 0x80006d8
 80006d2:   bf00        nop
 80006d4:   3d01        subs    r5, #1
 80006d6:   e7fb        b.n 0x80006d0
 80006d8:   4640        mov r0, r8
 80006da:   4649        mov r1, r9
 80006dc:   4652        mov r2, r10
 80006de:   f7ff ffd3   bl  0x8000688
 80006e2:   4635        mov r5, r6
 80006e4:   b115        cbz r5, 0x80006ec
 80006e6:   bf00        nop
 80006e8:   3d01        subs    r5, #1
 80006ea:   e7fb        b.n 0x80006e4
 80006ec:   4640        mov r0, r8
 80006ee:   4649        mov r1, r9
 80006f0:   463a        mov r2, r7
 80006f2:   3c01        subs    r4, #1
 80006f4:   f7ff ffc8   bl  0x8000688
 80006f8:   b2e4        uxtb    r4, r4
 80006fa:   e7e7        b.n 0x80006cc
 80006fc:   e8bd 87f0   ldmia.w sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
 8000700:   4b0d        ldr r3, [pc, #52]   ; (0x8000738)
 8000702:   490e        ldr r1, [pc, #56]   ; (0x800073c)
 8000704:   681a        ldr r2, [r3, #0]
 8000706:   f042 0201   orr.w   r2, r2, #1
 800070a:   601a        str r2, [r3, #0]
 800070c:   4a0c        ldr r2, [pc, #48]   ; (0x8000740)
 800070e:   6810        ldr r0, [r2, #0]
 8000710:   4001        ands    r1, r0
 8000712:   6011        str r1, [r2, #0]
 8000714:   6819        ldr r1, [r3, #0]
 8000716:   f021 7184   bic.w   r1, r1, #17301504   ; 0x1080000
 800071a:   f421 3180   bic.w   r1, r1, #65536  ; 0x10000
 800071e:   6019        str r1, [r3, #0]
 8000720:   6819        ldr r1, [r3, #0]
 8000722:   f421 2180   bic.w   r1, r1, #262144 ; 0x40000
 8000726:   6019        str r1, [r3, #0]
 8000728:   6813        ldr r3, [r2, #0]
 800072a:   f423 03fe   bic.w   r3, r3, #8323072    ; 0x7f0000
 800072e:   6013        str r3, [r2, #0]
 8000730:   4b04        ldr r3, [pc, #16]   ; (0x8000744)
 8000732:   2200        movs    r2, #0
 8000734:   601a        str r2, [r3, #0]
 8000736:   4770        bx  lr
 8000738:   1000        asrs    r0, r0, #32
 800073a:   4002        ands    r2, r0
 800073c:   0000        movs    r0, r0
 800073e:   f8ff 1004   ldr??.w r1, [pc, #4]    ; 0x8000744
 8000742:   4002        ands    r2, r0
 8000744:   1008        asrs    r0, r1, #32
 8000746:   4002        ands    r2, r0
 8000748:   4b15        ldr r3, [pc, #84]   ; (0x80007a0)
 800074a:   681a        ldr r2, [r3, #0]
 800074c:   f042 1201   orr.w   r2, r2, #65537  ; 0x10001
 8000750:   601a        str r2, [r3, #0]
 8000752:   681a        ldr r2, [r3, #0]
 8000754:   4812        ldr r0, [pc, #72]   ; (0x80007a0)
 8000756:   0392        lsls    r2, r2, #14
 8000758:   d5fb        bpl.n   0x8000752
 800075a:   4a12        ldr r2, [pc, #72]   ; (0x80007a4)
 800075c:   2112        movs    r1, #18
 800075e:   6011        str r1, [r2, #0]
 8000760:   f6a2 72fc   subw    r2, r2, #4092   ; 0xffc
 8000764:   6811        ldr r1, [r2, #0]
 8000766:   f441 11e8   orr.w   r1, r1, #1900544    ; 0x1d0000
 800076a:   f441 6180   orr.w   r1, r1, #1024   ; 0x400
 800076e:   6011        str r1, [r2, #0]
 8000770:   6801        ldr r1, [r0, #0]
 8000772:   f041 7180   orr.w   r1, r1, #16777216   ; 0x1000000
 8000776:   6001        str r1, [r0, #0]
 8000778:   6819        ldr r1, [r3, #0]
 800077a:   f011 7f40   tst.w   r1, #50331648   ; 0x3000000
 800077e:   d0fb        beq.n   0x8000778
 8000780:   6811        ldr r1, [r2, #0]
 8000782:   f041 0102   orr.w   r1, r1, #2
 8000786:   6011        str r1, [r2, #0]
 8000788:   6811        ldr r1, [r2, #0]
 800078a:   0709        lsls    r1, r1, #28
 800078c:   d5fc        bpl.n   0x8000788
 800078e:   699a        ldr r2, [r3, #24]
 8000790:   f442 72fe   orr.w   r2, r2, #508    ; 0x1fc
 8000794:   619a        str r2, [r3, #24]
 8000796:   69da        ldr r2, [r3, #28]
 8000798:   f442 0200   orr.w   r2, r2, #8388608    ; 0x800000
 800079c:   61da        str r2, [r3, #28]
 800079e:   4770        bx  lr
 80007a0:   1000        asrs    r0, r0, #32
 80007a2:   4002        ands    r2, r0
 80007a4:   2000        movs    r0, #0
 80007a6:   4002        ands    r2, r0
 80007a8:   4b07        ldr r3, [pc, #28]   ; (0x80007c8)
 80007aa:   4a08        ldr r2, [pc, #32]   ; (0x80007cc)
 80007ac:   601a        str r2, [r3, #0]
 80007ae:   f44f 2280   mov.w   r2, #262144 ; 0x40000
 80007b2:   611a        str r2, [r3, #16]
 80007b4:   f8d3 2404   ldr.w   r2, [r3, #1028] ; 0x404
 80007b8:   f422 0270   bic.w   r2, r2, #15728640   ; 0xf00000
 80007bc:   f442 1280   orr.w   r2, r2, #1048576    ; 0x100000
 80007c0:   f8c3 2404   str.w   r2, [r3, #1028] ; 0x404
 80007c4:   4770        bx  lr
 80007c6:   bf00        nop
 80007c8:   0c00        lsrs    r0, r0, #16
 80007ca:   4001        ands    r1, r0
 80007cc:   0400        lsls    r0, r0, #16
 80007ce:   4001        ands    r1, r0
 80007d0:   4b05        ldr r3, [pc, #20]   ; (0x80007e8)
 80007d2:   681a        ldr r2, [r3, #0]
 80007d4:   07d1        lsls    r1, r2, #31
 80007d6:   d403        bmi.n   0x80007e0
 80007d8:   681a        ldr r2, [r3, #0]
 80007da:   f042 0201   orr.w   r2, r2, #1
 80007de:   601a        str r2, [r3, #0]
 80007e0:   681a        ldr r2, [r3, #0]
 80007e2:   0792        lsls    r2, r2, #30
 80007e4:   d5fc        bpl.n   0x80007e0
 80007e6:   4770        bx  lr
 80007e8:   1000        asrs    r0, r0, #32
 80007ea:   4002        ands    r2, r0
 80007ec:   6803        ldr r3, [r0, #0]
 80007ee:   4803        ldr r0, [pc, #12]   ; (0x80007fc)
 80007f0:   4018        ands    r0, r3
 80007f2:   f1b0 5300   subs.w  r3, r0, #536870912  ; 0x20000000
 80007f6:   4258        negs    r0, r3
 80007f8:   4158        adcs    r0, r3
 80007fa:   4770        bx  lr
 80007fc:   0000        movs    r0, r0
 80007fe:   2ffe        cmp r7, #254    ; 0xfe
 8000800:   4a04        ldr r2, [pc, #16]   ; (0x8000814)
 8000802:   b508        push    {r3, lr}
 8000804:   6843        ldr r3, [r0, #4]
 8000806:   6010        str r0, [r2, #0]
 8000808:   6802        ldr r2, [r0, #0]
 800080a:   f382 8808   msr MSP, r2
 800080e:   4798        blx r3
 8000810:   bd08        pop {r3, pc}
 8000812:   bf00        nop
 8000814:   ed08 e000   stc 0, cr14, [r8, #-0]
 8000818:   4b08        ldr r3, [pc, #32]   ; (0x800083c)
 800081a:   69da        ldr r2, [r3, #28]
 800081c:   f042 52c0   orr.w   r2, r2, #402653184  ; 0x18000000
 8000820:   61da        str r2, [r3, #28]
 8000822:   f5a3 33d0   sub.w   r3, r3, #106496 ; 0x1a000
 8000826:   681a        ldr r2, [r3, #0]
 8000828:   f442 7280   orr.w   r2, r2, #256    ; 0x100
 800082c:   601a        str r2, [r3, #0]
 800082e:   4a04        ldr r2, [pc, #16]   ; (0x8000840)
 8000830:   8510        strh    r0, [r2, #40]   ; 0x28
 8000832:   681a        ldr r2, [r3, #0]
 8000834:   f422 7280   bic.w   r2, r2, #256    ; 0x100
 8000838:   601a        str r2, [r3, #0]
 800083a:   4770        bx  lr
 800083c:   1000        asrs    r0, r0, #32
 800083e:   4002        ands    r2, r0
 8000840:   6c00        ldr r0, [r0, #64]   ; 0x40
 8000842:   4000        ands    r0, r0
 8000844:   b538        push    {r3, r4, r5, lr}
 8000846:   4b0f        ldr r3, [pc, #60]   ; (0x8000884)
 8000848:   f244 214c   movw    r1, #16972  ; 0x424c
 800084c:   69da        ldr r2, [r3, #28]
 800084e:   461d        mov r5, r3
 8000850:   f042 52c0   orr.w   r2, r2, #402653184  ; 0x18000000
 8000854:   61da        str r2, [r3, #28]
 8000856:   4a0c        ldr r2, [pc, #48]   ; (0x8000888)
 8000858:   8d12        ldrh    r2, [r2, #40]   ; 0x28
 800085a:   b292        uxth    r2, r2
 800085c:   428a        cmp r2, r1
 800085e:   d005        beq.n   0x800086c
 8000860:   f244 234d   movw    r3, #16973  ; 0x424d
 8000864:   429a        cmp r2, r3
 8000866:   d003        beq.n   0x8000870
 8000868:   2400        movs    r4, #0
 800086a:   e009        b.n 0x8000880
 800086c:   2401        movs    r4, #1
 800086e:   e000        b.n 0x8000872
 8000870:   2402        movs    r4, #2
 8000872:   2000        movs    r0, #0
 8000874:   f7ff ffd0   bl  0x8000818
 8000878:   69eb        ldr r3, [r5, #28]
 800087a:   f023 53c0   bic.w   r3, r3, #402653184  ; 0x18000000
 800087e:   61eb        str r3, [r5, #28]
 8000880:   4620        mov r0, r4
 8000882:   bd38        pop {r3, r4, r5, pc}
 8000884:   1000        asrs    r0, r0, #32
 8000886:   4002        ands    r2, r0
 8000888:   6c00        ldr r0, [r0, #64]   ; 0x40
 800088a:   4000        ands    r0, r0
 800088c:   4b18        ldr r3, [pc, #96]   ; (0x80008f0)
 800088e:   b530        push    {r4, r5, lr}
 8000890:   68db        ldr r3, [r3, #12]
 8000892:   7844        ldrb    r4, [r0, #1]
 8000894:   43db        mvns    r3, r3
 8000896:   f3c3 2302   ubfx    r3, r3, #8, #3
 800089a:   f1c3 0204   rsb r2, r3, #4
 800089e:   fa04 f202   lsl.w   r2, r4, r2
 80008a2:   240f        movs    r4, #15
 80008a4:   40dc        lsrs    r4, r3
 80008a6:   7881        ldrb    r1, [r0, #2]
 80008a8:   7803        ldrb    r3, [r0, #0]
 80008aa:   400c        ands    r4, r1
 80008ac:   4314        orrs    r4, r2
 80008ae:   f003 0103   and.w   r1, r3, #3
 80008b2:   00c9        lsls    r1, r1, #3
 80008b4:   0124        lsls    r4, r4, #4
 80008b6:   22ff        movs    r2, #255    ; 0xff
 80008b8:   408c        lsls    r4, r1
 80008ba:   408a        lsls    r2, r1
 80008bc:   f003 03fc   and.w   r3, r3, #252    ; 0xfc
 80008c0:   f103 4360   add.w   r3, r3, #3758096384 ; 0xe0000000
 80008c4:   f503 4361   add.w   r3, r3, #57600  ; 0xe100
 80008c8:   f8d3 5300   ldr.w   r5, [r3, #768]  ; 0x300
 80008cc:   ea25 0102   bic.w   r1, r5, r2
 80008d0:   4022        ands    r2, r4
 80008d2:   430a        orrs    r2, r1
 80008d4:   f8c3 2300   str.w   r2, [r3, #768]  ; 0x300
 80008d8:   7803        ldrb    r3, [r0, #0]
 80008da:   2201        movs    r2, #1
 80008dc:   0959        lsrs    r1, r3, #5
 80008de:   f003 031f   and.w   r3, r3, #31
 80008e2:   fa02 f303   lsl.w   r3, r2, r3
 80008e6:   4a03        ldr r2, [pc, #12]   ; (0x80008f4)
 80008e8:   f842 3021   str.w   r3, [r2, r1, lsl #2]
 80008ec:   bd30        pop {r4, r5, pc}
 80008ee:   bf00        nop
 80008f0:   ed00 e000   stc 0, cr14, [r0, #-0]
 80008f4:   e100        b.n 0x8000af8
 80008f6:   e000        b.n 0x80008fa
 80008f8:   4b07        ldr r3, [pc, #28]   ; (0x8000918)
 80008fa:   f04f 32ff   mov.w   r2, #4294967295
 80008fe:   f8c3 2080   str.w   r2, [r3, #128]  ; 0x80
 8000902:   f8c3 2084   str.w   r2, [r3, #132]  ; 0x84
 8000906:   f8c3 2180   str.w   r2, [r3, #384]  ; 0x180
 800090a:   f8c3 2184   str.w   r2, [r3, #388]  ; 0x184
 800090e:   2204        movs    r2, #4
 8000910:   f843 2cf0   str.w   r2, [r3, #-240]
 8000914:   4770        bx  lr
 8000916:   bf00        nop
 8000918:   e100        b.n 0x8000b1c
 800091a:   e000        b.n 0x800091e
 800091c:   b510        push    {r4, lr}
 800091e:   4b08        ldr r3, [pc, #32]   ; (0x8000940)
 8000920:   2280        movs    r2, #128    ; 0x80
 8000922:   4604        mov r4, r0
 8000924:   601a        str r2, [r3, #0]
 8000926:   f7ff fdd5   bl  0x80004d4
 800092a:   f7ff ffe5   bl  0x80008f8
 800092e:   f7ff fd9d   bl  0x800046c
 8000932:   f7ff fee5   bl  0x8000700
 8000936:   4620        mov r0, r4
 8000938:   e8bd 4010   ldmia.w sp!, {r4, lr}
 800093c:   f7ff bf60   b.w 0x8000800
 8000940:   2010        movs    r0, #16
 8000942:   4002        ands    r2, r0
 8000944:   4a02        ldr r2, [pc, #8]    ; (0x8000950)
 8000946:   4b03        ldr r3, [pc, #12]   ; (0x8000954)
 8000948:   60da        str r2, [r3, #12]
 800094a:   bf00        nop
 800094c:   e7fd        b.n 0x800094a
 800094e:   bf00        nop
 8000950:   0004        movs    r4, r0
 8000952:   05fa        lsls    r2, r7, #23
 8000954:   ed00 e000   stc 0, cr14, [r0, #-0]
 8000958:   4b0a        ldr r3, [pc, #40]   ; (0x8000984)
 800095a:   b510        push    {r4, lr}
 800095c:   681a        ldr r2, [r3, #0]
 800095e:   2202        movs    r2, #2
 8000960:   601a        str r2, [r3, #0]
 8000962:   4a09        ldr r2, [pc, #36]   ; (0x8000988)
 8000964:   6811        ldr r1, [r2, #0]
 8000966:   4614        mov r4, r2
 8000968:   f011 0f01   tst.w   r1, #1
 800096c:   d1f9        bne.n   0x8000962
 800096e:   6090        str r0, [r2, #8]
 8000970:   2242        movs    r2, #66 ; 0x42
 8000972:   601a        str r2, [r3, #0]
 8000974:   6822        ldr r2, [r4, #0]
 8000976:   f012 0101   ands.w  r1, r2, #1
 800097a:   d1fb        bne.n   0x8000974
 800097c:   6019        str r1, [r3, #0]
 800097e:   2001        movs    r0, #1
 8000980:   bd10        pop {r4, pc}
 8000982:   bf00        nop
 8000984:   2010        movs    r0, #16
 8000986:   4002        ands    r2, r0
 8000988:   200c        movs    r0, #12
 800098a:   4002        ands    r2, r0
 800098c:   b537        push    {r0, r1, r2, r4, r5, lr}
 800098e:   b28b        uxth    r3, r1
 8000990:   9300        str r3, [sp, #0]
 8000992:   0c0b        lsrs    r3, r1, #16
 8000994:   9301        str r3, [sp, #4]
 8000996:   4b0e        ldr r3, [pc, #56]   ; (0x80009d0)
 8000998:   2201        movs    r2, #1
 800099a:   681c        ldr r4, [r3, #0]
 800099c:   601a        str r2, [r3, #0]
 800099e:   4a0d        ldr r2, [pc, #52]   ; (0x80009d4)
 80009a0:   6815        ldr r5, [r2, #0]
 80009a2:   07ed        lsls    r5, r5, #31
 80009a4:   d4fb        bmi.n   0x800099e
 80009a6:   9d01        ldr r5, [sp, #4]
 80009a8:   b2ad        uxth    r5, r5
 80009aa:   8045        strh    r5, [r0, #2]
 80009ac:   6815        ldr r5, [r2, #0]
 80009ae:   07ed        lsls    r5, r5, #31
 80009b0:   d4fc        bmi.n   0x80009ac
 80009b2:   9d00        ldr r5, [sp, #0]
 80009b4:   b2ad        uxth    r5, r5
 80009b6:   8005        strh    r5, [r0, #0]
 80009b8:   6815        ldr r5, [r2, #0]
 80009ba:   07ed        lsls    r5, r5, #31
 80009bc:   d4fc        bmi.n   0x80009b8
 80009be:   f024 0201   bic.w   r2, r4, #1
 80009c2:   601a        str r2, [r3, #0]
 80009c4:   6800        ldr r0, [r0, #0]
 80009c6:   1a43        subs    r3, r0, r1
 80009c8:   4258        negs    r0, r3
 80009ca:   4158        adcs    r0, r3
 80009cc:   b003        add sp, #12
 80009ce:   bd30        pop {r4, r5, pc}
 80009d0:   2010        movs    r0, #16
 80009d2:   4002        ands    r2, r0
 80009d4:   200c        movs    r0, #12
 80009d6:   4002        ands    r2, r0
 80009d8:   4b01        ldr r3, [pc, #4]    ; (0x80009e0)
 80009da:   2280        movs    r2, #128    ; 0x80
 80009dc:   601a        str r2, [r3, #0]
 80009de:   4770        bx  lr
 80009e0:   2010        movs    r0, #16
 80009e2:   4002        ands    r2, r0
 80009e4:   4b03        ldr r3, [pc, #12]   ; (0x80009f4)
 80009e6:   4a04        ldr r2, [pc, #16]   ; (0x80009f8)
 80009e8:   601a        str r2, [r3, #0]
 80009ea:   f102 3288   add.w   r2, r2, #2290649224 ; 0x88888888
 80009ee:   601a        str r2, [r3, #0]
 80009f0:   4770        bx  lr
 80009f2:   bf00        nop
 80009f4:   2004        movs    r0, #4
 80009f6:   4002        ands    r2, r0
 80009f8:   0123        lsls    r3, r4, #4
 80009fa:   4567        cmp r7, r12
 80009fc:   2807        cmp r0, #7
 80009fe:   bfc8        it  gt
 8000a00:   3808        subgt   r0, #8
 8000a02:   230f        movs    r3, #15
 8000a04:   0080        lsls    r0, r0, #2
 8000a06:   fa03 f000   lsl.w   r0, r3, r0
 8000a0a:   43c0        mvns    r0, r0
 8000a0c:   4770        bx  lr
 8000a0e:   0000        movs    r0, r0
 8000a10:   4b02        ldr r3, [pc, #8]    ; (0x8000a1c)
 8000a12:   8818        ldrh    r0, [r3, #0]
 8000a14:   f500 3000   add.w   r0, r0, #131072 ; 0x20000
 8000a18:   0280        lsls    r0, r0, #10
 8000a1a:   4770        bx  lr
 8000a1c:   f7e0 1fff           ; <UNDEFINED> instruction: 0xf7e01fff
 8000a20:   4b04        ldr r3, [pc, #16]   ; (0x8000a34)
 8000a22:   881b        ldrh    r3, [r3, #0]
 8000a24:   2b81        cmp r3, #129    ; 0x81
 8000a26:   bf34        ite cc
 8000a28:   f44f 6080   movcc.w r0, #1024   ; 0x400
 8000a2c:   f44f 6000   movcs.w r0, #2048   ; 0x800
 8000a30:   4770        bx  lr
 8000a32:   bf00        nop
 8000a34:   f7e0 1fff           ; <UNDEFINED> instruction: 0xf7e01fff
 8000a38:   4a0d        ldr r2, [pc, #52]   ; (0x8000a70)
 8000a3a:   2300        movs    r3, #0
 8000a3c:   2102        movs    r1, #2
 8000a3e:   7013        strb    r3, [r2, #0]
 8000a40:   7053        strb    r3, [r2, #1]
 8000a42:   7093        strb    r3, [r2, #2]
 8000a44:   70d3        strb    r3, [r2, #3]
 8000a46:   7111        strb    r1, [r2, #4]
 8000a48:   7153        strb    r3, [r2, #5]
 8000a4a:   4a0a        ldr r2, [pc, #40]   ; (0x8000a74)
 8000a4c:   490a        ldr r1, [pc, #40]   ; (0x8000a78)
 8000a4e:   6013        str r3, [r2, #0]
 8000a50:   4a0a        ldr r2, [pc, #40]   ; (0x8000a7c)
 8000a52:   8013        strh    r3, [r2, #0]
 8000a54:   4a0a        ldr r2, [pc, #40]   ; (0x8000a80)
 8000a56:   6011        str r1, [r2, #0]
 8000a58:   4a0a        ldr r2, [pc, #40]   ; (0x8000a84)
 8000a5a:   f501 4188   add.w   r1, r1, #17408  ; 0x4400
 8000a5e:   6011        str r1, [r2, #0]
 8000a60:   4a09        ldr r2, [pc, #36]   ; (0x8000a88)
 8000a62:   2103        movs    r1, #3
 8000a64:   7013        strb    r3, [r2, #0]
 8000a66:   4a09        ldr r2, [pc, #36]   ; (0x8000a8c)
 8000a68:   7011        strb    r1, [r2, #0]
 8000a6a:   4a09        ldr r2, [pc, #36]   ; (0x8000a90)
 8000a6c:   7013        strb    r3, [r2, #0]
 8000a6e:   4770        bx  lr
 8000a70:   0b1d        lsrs    r5, r3, #12
 8000a72:   2000        movs    r0, #0
 8000a74:   0b18        lsrs    r0, r3, #12
 8000a76:   2000        movs    r0, #0
 8000a78:   0c00        lsrs    r0, r0, #16
 8000a7a:   2000        movs    r0, #0
 8000a7c:   0b16        lsrs    r6, r2, #12
 8000a7e:   2000        movs    r0, #0
 8000a80:   02c4        lsls    r4, r0, #11
 8000a82:   2000        movs    r0, #0
 8000a84:   02c0        lsls    r0, r0, #11
 8000a86:   2000        movs    r0, #0
 8000a88:   0b1c        lsrs    r4, r3, #12
 8000a8a:   2000        movs    r0, #0
 8000a8c:   02d0        lsls    r0, r2, #11
 8000a8e:   2000        movs    r0, #0
 8000a90:   0b23        lsrs    r3, r4, #12
 8000a92:   2000        movs    r0, #0
 8000a94:   b508        push    {r3, lr}
 8000a96:   4b0e        ldr r3, [pc, #56]   ; (0x8000ad0)
 8000a98:   480e        ldr r0, [pc, #56]   ; (0x8000ad4)
 8000a9a:   7919        ldrb    r1, [r3, #4]
 8000a9c:   2200        movs    r2, #0
 8000a9e:   b2c9        uxtb    r1, r1
 8000aa0:   2901        cmp r1, #1
 8000aa2:   6002        str r2, [r0, #0]
 8000aa4:   d108        bne.n   0x8000ab8
 8000aa6:   2102        movs    r1, #2
 8000aa8:   7119        strb    r1, [r3, #4]
 8000aaa:   701a        strb    r2, [r3, #0]
 8000aac:   f7ff ff24   bl  0x80008f8
 8000ab0:   e8bd 4008   ldmia.w sp!, {r3, lr}
 8000ab4:   f7ff bcdc   b.w 0x8000470
 8000ab8:   f011 0ffd   tst.w   r1, #253    ; 0xfd
 8000abc:   d006        beq.n   0x8000acc
 8000abe:   2102        movs    r1, #2
 8000ac0:   7119        strb    r1, [r3, #4]
 8000ac2:   701a        strb    r2, [r3, #0]
 8000ac4:   e8bd 4008   ldmia.w sp!, {r3, lr}
 8000ac8:   f7ff bf3c   b.w 0x8000944
 8000acc:   bd08        pop {r3, pc}
 8000ace:   bf00        nop
 8000ad0:   0b1d        lsrs    r5, r3, #12
 8000ad2:   2000        movs    r0, #0
 8000ad4:   0b18        lsrs    r0, r3, #12
 8000ad6:   2000        movs    r0, #0
 8000ad8:   b920        cbnz    r0, 0x8000ae4
 8000ada:   4b03        ldr r3, [pc, #12]   ; (0x8000ae8)
 8000adc:   2201        movs    r2, #1
 8000ade:   681b        ldr r3, [r3, #0]
 8000ae0:   821a        strh    r2, [r3, #16]
 8000ae2:   4770        bx  lr
 8000ae4:   4801        ldr r0, [pc, #4]    ; (0x8000aec)
 8000ae6:   4770        bx  lr
 8000ae8:   0304        lsls    r4, r0, #12
 8000aea:   2000        movs    r0, #0
 8000aec:   0b21        lsrs    r1, r4, #12
 8000aee:   2000        movs    r0, #0
 8000af0:   b920        cbnz    r0, 0x8000afc
 8000af2:   4b03        ldr r3, [pc, #12]   ; (0x8000b00)
 8000af4:   2206        movs    r2, #6
 8000af6:   681b        ldr r3, [r3, #0]
 8000af8:   821a        strh    r2, [r3, #16]
 8000afa:   4770        bx  lr
 8000afc:   4801        ldr r0, [pc, #4]    ; (0x8000b04)
 8000afe:   4770        bx  lr
 8000b00:   0304        lsls    r4, r0, #12
 8000b02:   2000        movs    r0, #0
 8000b04:   0b1d        lsrs    r5, r3, #12
 8000b06:   2000        movs    r0, #0
 8000b08:   4b06        ldr r3, [pc, #24]   ; (0x8000b24)
 8000b0a:   681b        ldr r3, [r3, #0]
 8000b0c:   b930        cbnz    r0, 0x8000b1c
 8000b0e:   88da        ldrh    r2, [r3, #6]
 8000b10:   8a59        ldrh    r1, [r3, #18]
 8000b12:   1a51        subs    r1, r2, r1
 8000b14:   8219        strh    r1, [r3, #16]
 8000b16:   4b04        ldr r3, [pc, #16]   ; (0x8000b28)
 8000b18:   801a        strh    r2, [r3, #0]
 8000b1a:   4770        bx  lr
 8000b1c:   8a5b        ldrh    r3, [r3, #18]
 8000b1e:   4803        ldr r0, [pc, #12]   ; (0x8000b2c)
 8000b20:   4418        add r0, r3
 8000b22:   4770        bx  lr
 8000b24:   0304        lsls    r4, r0, #12
 8000b26:   2000        movs    r0, #0
 8000b28:   0b16        lsrs    r6, r2, #12
 8000b2a:   2000        movs    r0, #0
 8000b2c:   0314        lsls    r4, r2, #12
 8000b2e:   2000        movs    r0, #0
 8000b30:   4b08        ldr r3, [pc, #32]   ; (0x8000b54)
 8000b32:   b930        cbnz    r0, 0x8000b42
 8000b34:   681b        ldr r3, [r3, #0]
 8000b36:   4a08        ldr r2, [pc, #32]   ; (0x8000b58)
 8000b38:   8811        ldrh    r1, [r2, #0]
 8000b3a:   8a5a        ldrh    r2, [r3, #18]
 8000b3c:   1a8a        subs    r2, r1, r2
 8000b3e:   821a        strh    r2, [r3, #16]
 8000b40:   4770        bx  lr
 8000b42:   4906        ldr r1, [pc, #24]   ; (0x8000b5c)
 8000b44:   4a06        ldr r2, [pc, #24]   ; (0x8000b60)
 8000b46:   681b        ldr r3, [r3, #0]
 8000b48:   6812        ldr r2, [r2, #0]
 8000b4a:   6808        ldr r0, [r1, #0]
 8000b4c:   8a5b        ldrh    r3, [r3, #18]
 8000b4e:   4410        add r0, r2
 8000b50:   4418        add r0, r3
 8000b52:   4770        bx  lr
 8000b54:   0304        lsls    r4, r0, #12
 8000b56:   2000        movs    r0, #0
 8000b58:   0b16        lsrs    r6, r2, #12
 8000b5a:   2000        movs    r0, #0
 8000b5c:   02c4        lsls    r4, r0, #11
 8000b5e:   2000        movs    r0, #0
 8000b60:   0b18        lsrs    r0, r3, #12
 8000b62:   2000        movs    r0, #0
 8000b64:   b570        push    {r4, r5, r6, lr}
 8000b66:   4b12        ldr r3, [pc, #72]   ; (0x8000bb0)
 8000b68:   4e12        ldr r6, [pc, #72]   ; (0x8000bb4)
 8000b6a:   781b        ldrb    r3, [r3, #0]
 8000b6c:   6834        ldr r4, [r6, #0]
 8000b6e:   2b02        cmp r3, #2
 8000b70:   f104 6400   add.w   r4, r4, #134217728  ; 0x8000000
 8000b74:   bf0c        ite eq
 8000b76:   f504 44a0   addeq.w r4, r4, #20480  ; 0x5000
 8000b7a:   f504 5400   addne.w r4, r4, #8192   ; 0x2000
 8000b7e:   4620        mov r0, r4
 8000b80:   f7ff feea   bl  0x8000958
 8000b84:   2500        movs    r5, #0
 8000b86:   4b0c        ldr r3, [pc, #48]   ; (0x8000bb8)
 8000b88:   881a        ldrh    r2, [r3, #0]
 8000b8a:   b292        uxth    r2, r2
 8000b8c:   4295        cmp r5, r2
 8000b8e:   da06        bge.n   0x8000b9e
 8000b90:   4b0a        ldr r3, [pc, #40]   ; (0x8000bbc)
 8000b92:   1960        adds    r0, r4, r5
 8000b94:   58e9        ldr r1, [r5, r3]
 8000b96:   f7ff fef9   bl  0x800098c
 8000b9a:   3504        adds    r5, #4
 8000b9c:   e7f3        b.n 0x8000b86
 8000b9e:   6831        ldr r1, [r6, #0]
 8000ba0:   881a        ldrh    r2, [r3, #0]
 8000ba2:   b292        uxth    r2, r2
 8000ba4:   440a        add r2, r1
 8000ba6:   6032        str r2, [r6, #0]
 8000ba8:   2200        movs    r2, #0
 8000baa:   801a        strh    r2, [r3, #0]
 8000bac:   bd70        pop {r4, r5, r6, pc}
 8000bae:   bf00        nop
 8000bb0:   0b1c        lsrs    r4, r3, #12
 8000bb2:   2000        movs    r0, #0
 8000bb4:   0b18        lsrs    r0, r3, #12
 8000bb6:   2000        movs    r0, #0
 8000bb8:   0b16        lsrs    r6, r2, #12
 8000bba:   2000        movs    r0, #0
 8000bbc:   0314        lsls    r4, r2, #12
 8000bbe:   2000        movs    r0, #0
 8000bc0:   e92d 41f0   stmdb   sp!, {r4, r5, r6, r7, r8, lr}
 8000bc4:   4981        ldr r1, [pc, #516]  ; (0x8000dcc)
 8000bc6:   4c82        ldr r4, [pc, #520]  ; (0x8000dd0)
 8000bc8:   2001        movs    r0, #1
 8000bca:   7008        strb    r0, [r1, #0]
 8000bcc:   7923        ldrb    r3, [r4, #4]
 8000bce:   2200        movs    r2, #0
 8000bd0:   b2db        uxtb    r3, r3
 8000bd2:   2b02        cmp r3, #2
 8000bd4:   7022        strb    r2, [r4, #0]
 8000bd6:   d15a        bne.n   0x8000c8e
 8000bd8:   7008        strb    r0, [r1, #0]
 8000bda:   497e        ldr r1, [pc, #504]  ; (0x8000dd4)
 8000bdc:   6809        ldr r1, [r1, #0]
 8000bde:   7848        ldrb    r0, [r1, #1]
 8000be0:   2801        cmp r0, #1
 8000be2:   d12a        bne.n   0x8000c3a
 8000be4:   88c8        ldrh    r0, [r1, #6]
 8000be6:   2800        cmp r0, #0
 8000be8:   f000 80c5   beq.w   0x8000d76
 8000bec:   487a        ldr r0, [pc, #488]  ; (0x8000dd8)
 8000bee:   7b09        ldrb    r1, [r1, #12]
 8000bf0:   6002        str r2, [r0, #0]
 8000bf2:   2901        cmp r1, #1
 8000bf4:   f04f 0203   mov.w   r2, #3
 8000bf8:   7122        strb    r2, [r4, #4]
 8000bfa:   d00b        beq.n   0x8000c14
 8000bfc:   2902        cmp r1, #2
 8000bfe:   d11a        bne.n   0x8000c36
 8000c00:   4b76        ldr r3, [pc, #472]  ; (0x8000ddc)
 8000c02:   701a        strb    r2, [r3, #0]
 8000c04:   4a76        ldr r2, [pc, #472]  ; (0x8000de0)
 8000c06:   4b77        ldr r3, [pc, #476]  ; (0x8000de4)
 8000c08:   601a        str r2, [r3, #0]
 8000c0a:   f7ff fde1   bl  0x80007d0
 8000c0e:   f7ff fee9   bl  0x80009e4
 8000c12:   e00b        b.n 0x8000c2c
 8000c14:   4974        ldr r1, [pc, #464]  ; (0x8000de8)
 8000c16:   4a73        ldr r2, [pc, #460]  ; (0x8000de4)
 8000c18:   6011        str r1, [r2, #0]
 8000c1a:   4a70        ldr r2, [pc, #448]  ; (0x8000ddc)
 8000c1c:   7013        strb    r3, [r2, #0]
 8000c1e:   f7ff fdd7   bl  0x80007d0
 8000c22:   f7ff fedf   bl  0x80009e4
 8000c26:   486e        ldr r0, [pc, #440]  ; (0x8000de0)
 8000c28:   f7ff fe96   bl  0x8000958
 8000c2c:   f244 204d   movw    r0, #16973  ; 0x424d
 8000c30:   f7ff fdf2   bl  0x8000818
 8000c34:   e0c2        b.n 0x8000dbc
 8000c36:   230a        movs    r3, #10
 8000c38:   e062        b.n 0x8000d00
 8000c3a:   2802        cmp r0, #2
 8000c3c:   d121        bne.n   0x8000c82
 8000c3e:   2309        movs    r3, #9
 8000c40:   7123        strb    r3, [r4, #4]
 8000c42:   88ca        ldrh    r2, [r1, #6]
 8000c44:   4b69        ldr r3, [pc, #420]  ; (0x8000dec)
 8000c46:   801a        strh    r2, [r3, #0]
 8000c48:   8818        ldrh    r0, [r3, #0]
 8000c4a:   4a69        ldr r2, [pc, #420]  ; (0x8000df0)
 8000c4c:   b280        uxth    r0, r0
 8000c4e:   8010        strh    r0, [r2, #0]
 8000c50:   881a        ldrh    r2, [r3, #0]
 8000c52:   884b        ldrh    r3, [r1, #2]
 8000c54:   b292        uxth    r2, r2
 8000c56:   435a        muls    r2, r3
 8000c58:   4b5f        ldr r3, [pc, #380]  ; (0x8000dd8)
 8000c5a:   601a        str r2, [r3, #0]
 8000c5c:   7b0b        ldrb    r3, [r1, #12]
 8000c5e:   2b01        cmp r3, #1
 8000c60:   d003        beq.n   0x8000c6a
 8000c62:   2b02        cmp r3, #2
 8000c64:   d109        bne.n   0x8000c7a
 8000c66:   4a5e        ldr r2, [pc, #376]  ; (0x8000de0)
 8000c68:   e000        b.n 0x8000c6c
 8000c6a:   4a5f        ldr r2, [pc, #380]  ; (0x8000de8)
 8000c6c:   4b5d        ldr r3, [pc, #372]  ; (0x8000de4)
 8000c6e:   601a        str r2, [r3, #0]
 8000c70:   f7ff fece   bl  0x8000a10
 8000c74:   4b5f        ldr r3, [pc, #380]  ; (0x8000df4)
 8000c76:   6018        str r0, [r3, #0]
 8000c78:   e0a0        b.n 0x8000dbc
 8000c7a:   230a        movs    r3, #10
 8000c7c:   7123        strb    r3, [r4, #4]
 8000c7e:   2303        movs    r3, #3
 8000c80:   e09b        b.n 0x8000dba
 8000c82:   2806        cmp r0, #6
 8000c84:   d03c        beq.n   0x8000d00
 8000c86:   2803        cmp r0, #3
 8000c88:   d019        beq.n   0x8000cbe
 8000c8a:   2805        cmp r0, #5
 8000c8c:   e03c        b.n 0x8000d08
 8000c8e:   2b03        cmp r3, #3
 8000c90:   d10b        bne.n   0x8000caa
 8000c92:   4a50        ldr r2, [pc, #320]  ; (0x8000dd4)
 8000c94:   6812        ldr r2, [r2, #0]
 8000c96:   7852        ldrb    r2, [r2, #1]
 8000c98:   2a03        cmp r2, #3
 8000c9a:   d104        bne.n   0x8000ca6
 8000c9c:   2305        movs    r3, #5
 8000c9e:   7123        strb    r3, [r4, #4]
 8000ca0:   f7ff ff60   bl  0x8000b64
 8000ca4:   e08a        b.n 0x8000dbc
 8000ca6:   2a05        cmp r2, #5
 8000ca8:   e02e        b.n 0x8000d08
 8000caa:   2b04        cmp r3, #4
 8000cac:   d109        bne.n   0x8000cc2
 8000cae:   4952        ldr r1, [pc, #328]  ; (0x8000df8)
 8000cb0:   7808        ldrb    r0, [r1, #0]
 8000cb2:   2802        cmp r0, #2
 8000cb4:   d103        bne.n   0x8000cbe
 8000cb6:   2303        movs    r3, #3
 8000cb8:   7062        strb    r2, [r4, #1]
 8000cba:   700b        strb    r3, [r1, #0]
 8000cbc:   2305        movs    r3, #5
 8000cbe:   7123        strb    r3, [r4, #4]
 8000cc0:   e07c        b.n 0x8000dbc
 8000cc2:   2b05        cmp r3, #5
 8000cc4:   d114        bne.n   0x8000cf0
 8000cc6:   4b43        ldr r3, [pc, #268]  ; (0x8000dd4)
 8000cc8:   681a        ldr r2, [r3, #0]
 8000cca:   7853        ldrb    r3, [r2, #1]
 8000ccc:   2b01        cmp r3, #1
 8000cce:   d108        bne.n   0x8000ce2
 8000cd0:   88d3        ldrh    r3, [r2, #6]
 8000cd2:   b10b        cbz r3, 0x8000cd8
 8000cd4:   2303        movs    r3, #3
 8000cd6:   e7f2        b.n 0x8000cbe
 8000cd8:   2306        movs    r3, #6
 8000cda:   7123        strb    r3, [r4, #4]
 8000cdc:   f7ff fe7c   bl  0x80009d8
 8000ce0:   e06c        b.n 0x8000dbc
 8000ce2:   2b06        cmp r3, #6
 8000ce4:   d04d        beq.n   0x8000d82
 8000ce6:   2b03        cmp r3, #3
 8000ce8:   d04b        beq.n   0x8000d82
 8000cea:   2b05        cmp r3, #5
 8000cec:   d162        bne.n   0x8000db4
 8000cee:   e048        b.n 0x8000d82
 8000cf0:   2b06        cmp r3, #6
 8000cf2:   d10b        bne.n   0x8000d0c
 8000cf4:   4937        ldr r1, [pc, #220]  ; (0x8000dd4)
 8000cf6:   6809        ldr r1, [r1, #0]
 8000cf8:   7849        ldrb    r1, [r1, #1]
 8000cfa:   2903        cmp r1, #3
 8000cfc:   d103        bne.n   0x8000d06
 8000cfe:   2308        movs    r3, #8
 8000d00:   7123        strb    r3, [r4, #4]
 8000d02:   7022        strb    r2, [r4, #0]
 8000d04:   e05a        b.n 0x8000dbc
 8000d06:   2905        cmp r1, #5
 8000d08:   d154        bne.n   0x8000db4
 8000d0a:   e7d8        b.n 0x8000cbe
 8000d0c:   2b07        cmp r3, #7
 8000d0e:   d0f6        beq.n   0x8000cfe
 8000d10:   2b08        cmp r3, #8
 8000d12:   d0d4        beq.n   0x8000cbe
 8000d14:   2b09        cmp r3, #9
 8000d16:   d13c        bne.n   0x8000d92
 8000d18:   4b2e        ldr r3, [pc, #184]  ; (0x8000dd4)
 8000d1a:   681a        ldr r2, [r3, #0]
 8000d1c:   7853        ldrb    r3, [r2, #1]
 8000d1e:   2b02        cmp r3, #2
 8000d20:   d12d        bne.n   0x8000d7e
 8000d22:   88d0        ldrh    r0, [r2, #6]
 8000d24:   b338        cbz r0, 0x8000d76
 8000d26:   4931        ldr r1, [pc, #196]  ; (0x8000dec)
 8000d28:   8852        ldrh    r2, [r2, #2]
 8000d2a:   880b        ldrh    r3, [r1, #0]
 8000d2c:   4d2d        ldr r5, [pc, #180]  ; (0x8000de4)
 8000d2e:   b29b        uxth    r3, r3
 8000d30:   4353        muls    r3, r2
 8000d32:   4a29        ldr r2, [pc, #164]  ; (0x8000dd8)
 8000d34:   4e2f        ldr r6, [pc, #188]  ; (0x8000df4)
 8000d36:   6013        str r3, [r2, #0]
 8000d38:   682f        ldr r7, [r5, #0]
 8000d3a:   f8d2 8000   ldr.w   r8, [r2]
 8000d3e:   f8b1 c000   ldrh.w  r12, [r1]
 8000d42:   4447        add r7, r8
 8000d44:   6833        ldr r3, [r6, #0]
 8000d46:   fa1f fc8c   uxth.w  r12, r12
 8000d4a:   4467        add r7, r12
 8000d4c:   429f        cmp r7, r3
 8000d4e:   4b28        ldr r3, [pc, #160]  ; (0x8000df0)
 8000d50:   d803        bhi.n   0x8000d5a
 8000d52:   880a        ldrh    r2, [r1, #0]
 8000d54:   b292        uxth    r2, r2
 8000d56:   801a        strh    r2, [r3, #0]
 8000d58:   e019        b.n 0x8000d8e
 8000d5a:   6836        ldr r6, [r6, #0]
 8000d5c:   682d        ldr r5, [r5, #0]
 8000d5e:   6811        ldr r1, [r2, #0]
 8000d60:   1b72        subs    r2, r6, r5
 8000d62:   1a52        subs    r2, r2, r1
 8000d64:   b292        uxth    r2, r2
 8000d66:   801a        strh    r2, [r3, #0]
 8000d68:   881a        ldrh    r2, [r3, #0]
 8000d6a:   b292        uxth    r2, r2
 8000d6c:   4282        cmp r2, r0
 8000d6e:   d308        bcc.n   0x8000d82
 8000d70:   2200        movs    r2, #0
 8000d72:   801a        strh    r2, [r3, #0]
 8000d74:   e005        b.n 0x8000d82
 8000d76:   230a        movs    r3, #10
 8000d78:   7123        strb    r3, [r4, #4]
 8000d7a:   2309        movs    r3, #9
 8000d7c:   e01d        b.n 0x8000dba
 8000d7e:   2b06        cmp r3, #6
 8000d80:   d101        bne.n   0x8000d86
 8000d82:   2302        movs    r3, #2
 8000d84:   e79b        b.n 0x8000cbe
 8000d86:   2b03        cmp r3, #3
 8000d88:   d001        beq.n   0x8000d8e
 8000d8a:   2b05        cmp r3, #5
 8000d8c:   d112        bne.n   0x8000db4
 8000d8e:   2309        movs    r3, #9
 8000d90:   e795        b.n 0x8000cbe
 8000d92:   2b0a        cmp r3, #10
 8000d94:   d10e        bne.n   0x8000db4
 8000d96:   4b0f        ldr r3, [pc, #60]   ; (0x8000dd4)
 8000d98:   681b        ldr r3, [r3, #0]
 8000d9a:   785b        ldrb    r3, [r3, #1]
 8000d9c:   2b03        cmp r3, #3
 8000d9e:   d101        bne.n   0x8000da4
 8000da0:   230a        movs    r3, #10
 8000da2:   e78c        b.n 0x8000cbe
 8000da4:   2b05        cmp r3, #5
 8000da6:   d0fb        beq.n   0x8000da0
 8000da8:   2b04        cmp r3, #4
 8000daa:   d103        bne.n   0x8000db4
 8000dac:   2302        movs    r3, #2
 8000dae:   7123        strb    r3, [r4, #4]
 8000db0:   2300        movs    r3, #0
 8000db2:   e002        b.n 0x8000dba
 8000db4:   230a        movs    r3, #10
 8000db6:   7123        strb    r3, [r4, #4]
 8000db8:   230f        movs    r3, #15
 8000dba:   7023        strb    r3, [r4, #0]
 8000dbc:   7820        ldrb    r0, [r4, #0]
 8000dbe:   f1d0 0001   rsbs    r0, r0, #1
 8000dc2:   bf38        it  cc
 8000dc4:   2000        movcc   r0, #0
 8000dc6:   e8bd 81f0   ldmia.w sp!, {r4, r5, r6, r7, r8, pc}
 8000dca:   bf00        nop
 8000dcc:   0b23        lsrs    r3, r4, #12
 8000dce:   2000        movs    r0, #0
 8000dd0:   0b1d        lsrs    r5, r3, #12
 8000dd2:   2000        movs    r0, #0
 8000dd4:   0304        lsls    r4, r0, #12
 8000dd6:   2000        movs    r0, #0
 8000dd8:   0b18        lsrs    r0, r3, #12
 8000dda:   2000        movs    r0, #0
 8000ddc:   0b1c        lsrs    r4, r3, #12
 8000dde:   2000        movs    r0, #0
 8000de0:   2000        movs    r0, #0
 8000de2:   0800        lsrs    r0, r0, #32
 8000de4:   02c4        lsls    r4, r0, #11
 8000de6:   2000        movs    r0, #0
 8000de8:   5000        str r0, [r0, r0]
 8000dea:   0800        lsrs    r0, r0, #32
 8000dec:   0b14        lsrs    r4, r2, #12
 8000dee:   2000        movs    r0, #0
 8000df0:   0b16        lsrs    r6, r2, #12
 8000df2:   2000        movs    r0, #0
 8000df4:   02c0        lsls    r0, r0, #11
 8000df6:   2000        movs    r0, #0
 8000df8:   02d0        lsls    r0, r2, #11
 8000dfa:   2000        movs    r0, #0
 8000dfc:   4b01        ldr r3, [pc, #4]    ; (0x8000e04)
 8000dfe:   7818        ldrb    r0, [r3, #0]
 8000e00:   4770        bx  lr
 8000e02:   bf00        nop
 8000e04:   0b23        lsrs    r3, r4, #12
 8000e06:   2000        movs    r0, #0
 8000e08:   bf00        nop
 8000e0a:   e7fd        b.n 0x8000e08
 8000e0c:   0080        lsls    r0, r0, #2
 8000e0e:   f100 4080   add.w   r0, r0, #1073741824 ; 0x40000000
 8000e12:   f500 40b8   add.w   r0, r0, #23552  ; 0x5c00
 8000e16:   6803        ldr r3, [r0, #0]
 8000e18:   06ca        lsls    r2, r1, #27
 8000e1a:   f423 43e0   bic.w   r3, r3, #28672  ; 0x7000
 8000e1e:   f023 0340   bic.w   r3, r3, #64 ; 0x40
 8000e22:   b29b        uxth    r3, r3
 8000e24:   bf48        it  mi
 8000e26:   f083 0310   eormi.w r3, r3, #16
 8000e2a:   068a        lsls    r2, r1, #26
 8000e2c:   bf48        it  mi
 8000e2e:   f083 0320   eormi.w r3, r3, #32
 8000e32:   6003        str r3, [r0, #0]
 8000e34:   4770        bx  lr
 8000e36:   0080        lsls    r0, r0, #2
 8000e38:   f100 4080   add.w   r0, r0, #1073741824 ; 0x40000000
 8000e3c:   f500 40b8   add.w   r0, r0, #23552  ; 0x5c00
 8000e40:   6803        ldr r3, [r0, #0]
 8000e42:   f423 4380   bic.w   r3, r3, #16384  ; 0x4000
 8000e46:   f023 0370   bic.w   r3, r3, #112    ; 0x70
 8000e4a:   b29b        uxth    r3, r3
 8000e4c:   f483 5340   eor.w   r3, r3, #12288  ; 0x3000
 8000e50:   6003        str r3, [r0, #0]
 8000e52:   4770        bx  lr
 8000e54:   0080        lsls    r0, r0, #2
 8000e56:   f100 4080   add.w   r0, r0, #1073741824 ; 0x40000000
 8000e5a:   f500 40b8   add.w   r0, r0, #23552  ; 0x5c00
 8000e5e:   6803        ldr r3, [r0, #0]
 8000e60:   f423 43e2   bic.w   r3, r3, #28928  ; 0x7100
 8000e64:   f023 0370   bic.w   r3, r3, #112    ; 0x70
 8000e68:   041b        lsls    r3, r3, #16
 8000e6a:   0c1b        lsrs    r3, r3, #16
 8000e6c:   6003        str r3, [r0, #0]
 8000e6e:   4770        bx  lr
 8000e70:   0080        lsls    r0, r0, #2
 8000e72:   f100 4080   add.w   r0, r0, #1073741824 ; 0x40000000
 8000e76:   f500 40b8   add.w   r0, r0, #23552  ; 0x5c00
 8000e7a:   6803        ldr r3, [r0, #0]
 8000e7c:   045b        lsls    r3, r3, #17
 8000e7e:   d506        bpl.n   0x8000e8e
 8000e80:   6802        ldr r2, [r0, #0]
 8000e82:   f648 738f   movw    r3, #36751  ; 0x8f8f
 8000e86:   4013        ands    r3, r2
 8000e88:   f443 4380   orr.w   r3, r3, #16384  ; 0x4000
 8000e8c:   6003        str r3, [r0, #0]
 8000e8e:   4770        bx  lr
 8000e90:   0080        lsls    r0, r0, #2
 8000e92:   f100 4080   add.w   r0, r0, #1073741824 ; 0x40000000
 8000e96:   f500 40b8   add.w   r0, r0, #23552  ; 0x5c00
 8000e9a:   6803        ldr r3, [r0, #0]
 8000e9c:   065b        lsls    r3, r3, #25
 8000e9e:   d506        bpl.n   0x8000eae
 8000ea0:   6802        ldr r2, [r0, #0]
 8000ea2:   f648 738f   movw    r3, #36751  ; 0x8f8f
 8000ea6:   4013        ands    r3, r2
 8000ea8:   f043 0340   orr.w   r3, r3, #64 ; 0x40
 8000eac:   6003        str r3, [r0, #0]
 8000eae:   4770        bx  lr

FUNCTION(GetEPTxAddr)
 8000eb0:   4b05        ldr r3, LOC({USB_BTABLE}) // [pc, #20]   ; (0x8000ec8)
 8000eb2:   681b        ldr r3, [r3, #0]
 8000eb4:   b29b        uxth    r3, r3
 8000eb6:   eb03 00c0   add.w   r0, r3, r0, lsl #3
 8000eba:   f100 5000   add.w   r0, r0, #536870912  ; 0x20000000
 8000ebe:   f500 5040   add.w   r0, r0, #12288  ; 0x3000
 8000ec2:   0040        lsls    r0, r0, #1
 8000ec4:   8800        ldrh    r0, [r0, #0]
 8000ec6:   4770        bx  lr
 8000ec8: LOC({USB_BTABLE}):    .word USB_BASE + USB_BTABLE // 0x40005c50
ENDFUNC // GetEPTxAddr

FUNCTION(GetEPRxAddr)
 8000ecc:   4b04        ldr r3, [pc, #16]   ; (0x8000ee0)
 8000ece:   681b        ldr r3, [r3, #0]
 8000ed0:   b29b        uxth    r3, r3
 8000ed2:   eb03 00c0   add.w   r0, r3, r0, lsl #3
 8000ed6:   4b03        ldr r3, [pc, #12]   ; (0x8000ee4)
 8000ed8:   4403        add r3, r0
 8000eda:   005b        lsls    r3, r3, #1
 8000edc:   8818        ldrh    r0, [r3, #0]
 8000ede:   4770        bx  lr
 8000ee0:   .word USB_BASE + USB_BTABLE // 0x40005c50
 8000ee4:   .word SRAM_3004 // 0x20003004
ENDFUNC // GetEPRxAddr

FUNCTION(SetEPTxCount)
 8000ee8:   4b04        ldr r3, [pc, #16]   ; (0x8000efc)
 8000eea:   681b        ldr r3, [r3, #0]
 8000eec:   b29b        uxth    r3, r3
 8000eee:   eb03 00c0   add.w   r0, r3, r0, lsl #3
 8000ef2:   4b03        ldr r3, [pc, #12]   ; (0x8000f00)
 8000ef4:   4403        add r3, r0
 8000ef6:   005b        lsls    r3, r3, #1
 8000ef8:   6019        str r1, [r3, #0]
 8000efa:   4770        bx  lr
 8000efc:   .word USB_BASE + USB_BTABLE // 0x40005c50
 8000f00:   .word 0x20003002
ENDFUNC // SetEPTxCount

FUNCTION(SetEPCountRxReg)
 8000f04:   4b0d        ldr r3, [pc, #52]   ; (0x8000f3c)
 8000f06:   293e        cmp r1, #62 ; 0x3e
 8000f08:   681b        ldr r3, [r3, #0]
 8000f0a:   b29b        uxth    r3, r3
 8000f0c:   eb03 00c0   add.w   r0, r3, r0, lsl #3
 8000f10:   4b0b        ldr r3, [pc, #44]   ; (0x8000f40)
 8000f12:   4403        add r3, r0
 8000f14:   ea4f 0243   mov.w   r2, r3, lsl #1
 8000f18:   d909        bls.n   0x8000f2e
 8000f1a:   094b        lsrs    r3, r1, #5
 8000f1c:   06c8        lsls    r0, r1, #27
 8000f1e:   bf04        itt eq
 8000f20:   f103 33ff   addeq.w r3, r3, #4294967295 ; 0xffffffff
 8000f24:   b29b        uxtheq  r3, r3
 8000f26:   029b        lsls    r3, r3, #10
 8000f28:   f443 4300   orr.w   r3, r3, #32768  ; 0x8000
 8000f2c:   e004        b.n 0x8000f38
 8000f2e:   084b        lsrs    r3, r1, #1
 8000f30:   07c9        lsls    r1, r1, #31
 8000f32:   bf48        it  mi
 8000f34:   3301        addmi   r3, #1
 8000f36:   029b        lsls    r3, r3, #10
 8000f38:   6013        str r3, [r2, #0]
 8000f3a:   4770        bx  lr
 8000f3c:   .word USB_BASE + USB_BTABLE // 0x40005c50
 8000f40:   .word 0x20003006
ENDFUNC // SetEPCountRxReg

FUNCTION(CTR_LP)
 8000f44:   b570        push    {r4, r5, r6, lr}

  LOC(WHILE_LOOP):
 8000f46:   4a4c        ldr r2, LOC({USB_ISTR}) // [pc, #304]  ; (0x8001078)
 8000f48:   4b4c        ldr r3, LOC(wIstr) // [pc, #304]  ; (0x800107c)
 8000f4a:   6811        ldr r1, [r2, #0]    // r1 = USB_ISTR
 8000f4c:   b288        uxth    r0, r1      // r0 = USB_ISTR
 8000f4e:   040c        lsls    r4, r1, #16
 8000f50:   8018        strh    r0, [r3, #0]    // wIstr = USB_ISTR
 8000f52:   f140 8090   bpl.w   LOC(DONE) // 0x8001076

 8000f56:   f647 71ff   movw    r1, #32767  ; 0x7fff
 8000f5a:   6011        str r1, [r2, #0]            // USB_ISTR = CLR_CTR
 8000f5c:   881a        ldrh    r2, [r3, #0]        // r2 = wIstr
 8000f5e:   4c48        ldr r4, LOC(EPindex) // [pc, #288]  ; (0x8001080)
 8000f60:   f002 020f   and.w   r2, r2, #15         // r2 = wIstr & 0x0f
 8000f64:   7022        strb    r2, [r4, #0]        // EPindex = wIstr & 0x0f
 8000f66:   2a00        cmp r2, #0
 8000f68:   d15f        bne.n   LOC(EP_NOT_0) // 0x800102a

  LOC(EP_IS_0):
 8000f6a:   4c46        ldr r4, LOC({USB_EP0R}) // [pc, #280]  ; (0x8001084)
 8000f6c:   4d46        ldr r5, LOC(SaveRState) // [pc, #280]  ; (0x8001088)
 8000f6e:   6822        ldr r2, [r4, #0]        // r2 = USB_EP0R
 8000f70:   4e46        ldr r6, LOC(SaveTState) // [pc, #280]  ; (0x800108c)

 8000f72:   f402 5240   and.w   r2, r2, #12288  ; 0x3000
 8000f76:   802a        strh    r2, [r5, #0]    // SaveRState = USB_EP0R & 0x3000

 8000f78:   6822        ldr r2, [r4, #0]
 8000f7a:   f002 0230   and.w   r2, r2, #48 ; 0x30
 8000f7e:   8032        strh    r2, [r6, #0]    // SaveTState = USB_EP0R & 0x30

 8000f80:   6822        ldr r2, [r4, #0]
                                                            // leave CTR_RX and CTR_TX -> leave as they are
 8000f82:   f422 4280   bic.w   r2, r2, #16384  ; 0x4000    // clear DTOG_RX -> don't toggle
 8000f86:   f022 0270   bic.w   r2, r2, #112    ; 0x70      // clear DTOG_TX and STAT_TX -> don't toggle
 8000f8a:   b292        uxth    r2, r2
 8000f8c:   f482 5200   eor.w   r2, r2, #8192   ; 0x2000    // xor   STAT_RX:1 -> toggle if clear, leave if set -> set   -> set to NAK
                                                            // leave STAT_RX:0 -> toggle if set, leave if clear -> clear /
 8000f90:   6022        str r2, [r4, #0]

 8000f92:   6822        ldr r2, [r4, #0]
 8000f94:   f422 42e0   bic.w   r2, r2, #28672  ; 0x7000    // clear DTOG_RX and STAT_RX -> don't toggle
 8000f98:   f022 0240   bic.w   r2, r2, #64 ; 0x40          // clear DTOG_TX -> don't toggle
 8000f9c:   b292        uxth    r2, r2
 8000f9e:   f082 0220   eor.w   r2, r2, #32                 // xor   STAT_RX:1 -> toggle if clear, leave if set -> set   -> set to NAK
                                                            // leave STAT_RX:0 -> toggle if set, leave if clear -> clear / 
 8000fa2:   6022        str r2, [r4, #0]

 8000fa4:   881b        ldrh    r3, [r3, #0]    // r3 = wIstr
 8000fa6:   06d8        lsls    r0, r3, #27
 8000fa8:   d502        bpl.n   LOC(DIR_IS_UNSET) // 0x8000fb0

  LOC(DIR_IS_SET):
 8000faa:   6823        ldr r3, [r4, #0]
 8000fac:   0619        lsls    r1, r3, #24     // USB_EP0R & CTR_TX
 8000fae:   d507        bpl.n   LOC(CTR_TX_IS_UNSET) // 0x8000fc0
  LOC(CTR_TX_IS_SET):

  LOC(DIR_IS_UNSET):
 8000fb0:   6822        ldr r2, [r4, #0]
 8000fb2:   f648 730f   movw    r3, #36623  ; 0x8f0f
 8000fb6:   4013        ands    r3, r2
 8000fb8:   6023        str r3, [r4, #0]        // USB_EP0R &= 0x8f0f -> clear CTR_TX
 8000fba:   f000 fc61   bl  In0_Process // 0x8001880
 8000fbe:   e012        b.n LOC(RESTORE_RX_TX) // 0x8000fe6

  LOC(CTR_TX_IS_UNSET):
 8000fc0:   051a        lsls    r2, r3, #20
 8000fc2:   d507        bpl.n   LOC(SETUP_IS_UNSET) // 0x8000fd4
  LOC(SETUP_IS_SET):

 8000fc4:   6822        ldr r2, [r4, #0]
 8000fc6:   f640 738f   movw    r3, #3983   ; 0xf8f
 8000fca:   4013        ands    r3, r2
 8000fcc:   6023        str r3, [r4, #0]      // USB_EP0R &= 0x0f8f -> clear CTR_RX
 8000fce:   f000 fa69   bl  Setup0_Process // 0x80014a4
 8000fd2:   e008        b.n LOC(RESTORE_RX_TX) // 0x8000fe6

  LOC(SETUP_IS_UNSET):
 8000fd4:   0418        lsls    r0, r3, #16
 8000fd6:   d5b6        bpl.n   LOC(WHILE_LOOP) // 0x8000f46
  LOC(CTR_RX_IS_SET):

 8000fd8:   6822        ldr r2, [r4, #0]
 8000fda:   f640 738f   movw    r3, #3983   ; 0xf8f
 8000fde:   4013        ands    r3, r2
 8000fe0:   6023        str r3, [r4, #0]    // USB_EP0R &= 0x0f8f -> clear CTR_RX
 8000fe2:   f000 fbcd   bl  Out0_Process // 0x8001780

  LOC(RESTORE_RX_TX):
 8000fe6:   6823        ldr r3, [r4, #0]        // r3 = USB_EP0R
 8000fe8:   882a        ldrh    r2, [r5, #0]    // r2 = SaveRState
 8000fea:   f423 4380   bic.w   r3, r3, #16384  ; 0x4000    // DTOG_RX
 8000fee:   f023 0370   bic.w   r3, r3, #112    ; 0x70      // DTOG_TX + STAT_TX
 8000ff2:   b29b        uxth    r3, r3
 8000ff4:   04d1        lsls    r1, r2, #19
 8000ff6:   bf48        it  mi
 8000ff8:   f483 5380   eormi.w r3, r3, #4096   ; 0x1000    // STAT_RX:0
 8000ffc:   0495        lsls    r5, r2, #18
 8000ffe:   4a21        ldr r2, LOC({USB_EP0R}) // [pc, #132]  ; (0x8001084)
 8001000:   bf48        it  mi
 8001002:   f483 5300   eormi.w r3, r3, #8192   ; 0x2000    // STAT_RX:1
 8001006:   6013        str r3, [r2, #0]

 8001008:   6813        ldr r3, [r2, #0]        // r3 = USB_EP0R
 800100a:   8831        ldrh    r1, [r6, #0]    // r1 = SaveTState
 800100c:   f423 43e0   bic.w   r3, r3, #28672  ; 0x7000    // DTOG_RX + STAT_RX
 8001010:   f023 0340   bic.w   r3, r3, #64 ; 0x40          // DTOG_TX
 8001014:   b29b        uxth    r3, r3
 8001016:   06cc        lsls    r4, r1, #27
 8001018:   bf48        it  mi
 800101a:   f083 0310   eormi.w r3, r3, #16                 // STAT_TX:0
 800101e:   0688        lsls    r0, r1, #26
 8001020:   bf48        it  mi
 8001022:   f083 0320   eormi.w r3, r3, #32                 // STAT_TX:1
 8001026:   6013        str r3, [r2, #0]
 8001028:   bd70        pop {r4, r5, r6, pc}

  LOC(EP_NOT_0):
 800102a:   0093        lsls    r3, r2, #2
 800102c:   f103 4380   add.w   r3, r3, #1073741824 ; 0x40000000
 8001030:   f503 43b8   add.w   r3, r3, #23552  ; 0x5c00
 8001034:   681d        ldr r5, [r3, #0]
 8001036:   0429        lsls    r1, r5, #16
 8001038:   d509        bpl.n   0x800104e
 800103a:   6818        ldr r0, [r3, #0]
 800103c:   f640 718f   movw    r1, #3983   ; 0xf8f
 8001040:   4001        ands    r1, r0
 8001042:   6019        str r1, [r3, #0]
 8001044:   4b12        ldr r3, [pc, #72]   ; (0x8001090)
 8001046:   3a01        subs    r2, #1
 8001048:   f853 3022   ldr.w   r3, [r3, r2, lsl #2]
 800104c:   4798        blx r3
 800104e:   062b        lsls    r3, r5, #24
 8001050:   f57f af79   bpl.w   0x8000f46
 8001054:   7821        ldrb    r1, [r4, #0]
 8001056:   f648 720f   movw    r2, #36623  ; 0x8f0f
 800105a:   008b        lsls    r3, r1, #2
 800105c:   f103 4380   add.w   r3, r3, #1073741824 ; 0x40000000
 8001060:   f503 43b8   add.w   r3, r3, #23552  ; 0x5c00
 8001064:   6818        ldr r0, [r3, #0]
 8001066:   3901        subs    r1, #1
 8001068:   4002        ands    r2, r0
 800106a:   601a        str r2, [r3, #0]
 800106c:   4b09        ldr r3, [pc, #36]   ; (0x8001094)
 800106e:   f853 3021   ldr.w   r3, [r3, r1, lsl #2]
 8001072:   4798        blx r3
 8001074:   e767        b.n 0x8000f46

  LOC(DONE): 
 8001076:   bd70        pop {r4, r5, r6, pc}
 8001078: LOC({USB_ISTR}):      .word USB_BASE + USB_ISTR // 0x40005c44
 800107c: LOC(wIstr):           .word wIstr // 0x200002cc
 8001080: LOC(EPindex):         .word EPindex // 0x200002e0
 8001084: LOC({USB_EP0R}):      .word USB_EP0R // 0x40005c00
 8001088: LOC(SaveRState):      .word SaveRState // 0x200002d2
 800108c: LOC(SaveTState):      .word SaveTState // 0x200002d4
 8001090:   .word 0x20000050
 8001094:   .word 0x20000034
ENDFUNC // CTR_LP

 8001098:   b508        push    {r3, lr}
 800109a:   4a07        ldr r2, [pc, #28]   ; (0x80010b8)
 800109c:   4b07        ldr r3, [pc, #28]   ; (0x80010bc)
 800109e:   4908        ldr r1, [pc, #32]   ; (0x80010c0)
 80010a0:   6013        str r3, [r2, #0]
 80010a2:   2202        movs    r2, #2
 80010a4:   721a        strb    r2, [r3, #8]
 80010a6:   4b07        ldr r3, [pc, #28]   ; (0x80010c4)
 80010a8:   4a07        ldr r2, [pc, #28]   ; (0x80010c8)
 80010aa:   6013        str r3, [r2, #0]
 80010ac:   4a07        ldr r2, [pc, #28]   ; (0x80010cc)
 80010ae:   681b        ldr r3, [r3, #0]
 80010b0:   6011        str r1, [r2, #0]
 80010b2:   4798        blx r3
 80010b4:   bd08        pop {r3, pc}
 80010b6:   bf00        nop
 80010b8:   0304        lsls    r4, r0, #12
 80010ba:   2000        movs    r0, #0
 80010bc:   02e4        lsls    r4, r4, #11
 80010be:   2000        movs    r0, #0
 80010c0:   006c        lsls    r4, r5, #1
 80010c2:   2000        movs    r0, #0
 80010c4:   0000        movs    r0, r0
 80010c6:   2000        movs    r0, #0
 80010c8:   02dc        lsls    r4, r3, #11
 80010ca:   2000        movs    r0, #0
 80010cc:   0300        lsls    r0, r0, #12
 80010ce:   2000        movs    r0, #0
 80010d0:   b510        push    {r4, lr}
 80010d2:   4c06        ldr r4, [pc, #24]   ; (0x80010ec)
 80010d4:   b918        cbnz    r0, 0x80010de
 80010d6:   6823        ldr r3, [r4, #0]
 80010d8:   2201        movs    r2, #1
 80010da:   821a        strh    r2, [r3, #16]
 80010dc:   bd10        pop {r4, pc}
 80010de:   4b04        ldr r3, [pc, #16]   ; (0x80010f0)
 80010e0:   681b        ldr r3, [r3, #0]
 80010e2:   681b        ldr r3, [r3, #0]
 80010e4:   4798        blx r3
 80010e6:   6820        ldr r0, [r4, #0]
 80010e8:   300a        adds    r0, #10
 80010ea:   bd10        pop {r4, pc}
 80010ec:   0304        lsls    r4, r0, #12
 80010ee:   2000        movs    r0, #0
 80010f0:   0300        lsls    r0, r0, #12
 80010f2:   2000        movs    r0, #0
 80010f4:   b510        push    {r4, lr}
 80010f6:   4c06        ldr r4, [pc, #24]   ; (0x8001110)
 80010f8:   b918        cbnz    r0, 0x8001102
 80010fa:   6823        ldr r3, [r4, #0]
 80010fc:   2201        movs    r2, #1
 80010fe:   821a        strh    r2, [r3, #16]
 8001100:   bd10        pop {r4, pc}
 8001102:   4b04        ldr r3, [pc, #16]   ; (0x8001114)
 8001104:   681b        ldr r3, [r3, #0]
 8001106:   689b        ldr r3, [r3, #8]
 8001108:   4798        blx r3
 800110a:   6820        ldr r0, [r4, #0]
 800110c:   300c        adds    r0, #12
 800110e:   bd10        pop {r4, pc}
 8001110:   0304        lsls    r4, r0, #12
 8001112:   2000        movs    r0, #0
 8001114:   0300        lsls    r0, r0, #12
 8001116:   2000        movs    r0, #0
 8001118:   b510        push    {r4, lr}
 800111a:   4b20        ldr r3, [pc, #128]  ; (0x800119c)
 800111c:   b918        cbnz    r0, 0x8001126
 800111e:   681b        ldr r3, [r3, #0]
 8001120:   2202        movs    r2, #2
 8001122:   821a        strh    r2, [r3, #16]
 8001124:   bd10        pop {r4, pc}
 8001126:   4a1e        ldr r2, [pc, #120]  ; (0x80011a0)
 8001128:   6819        ldr r1, [r3, #0]
 800112a:   2000        movs    r0, #0
 800112c:   8010        strh    r0, [r2, #0]
 800112e:   780c        ldrb    r4, [r1, #0]
 8001130:   4613        mov r3, r2
 8001132:   f014 047f   ands.w  r4, r4, #127    ; 0x7f
 8001136:   d10d        bne.n   0x8001154
 8001138:   7a4a        ldrb    r2, [r1, #9]
 800113a:   0691        lsls    r1, r2, #26
 800113c:   bf44        itt mi
 800113e:   2102        movmi   r1, #2
 8001140:   7019        strbmi  r1, [r3, #0]
 8001142:   f012 0f40   tst.w   r2, #64 ; 0x40
 8001146:   781a        ldrb    r2, [r3, #0]
 8001148:   bf14        ite ne
 800114a:   f022 0201   bicne.w r2, r2, #1
 800114e:   f042 0201   orreq.w r2, r2, #1
 8001152:   e014        b.n 0x800117e
 8001154:   2c01        cmp r4, #1
 8001156:   d01f        beq.n   0x8001198
 8001158:   2c02        cmp r4, #2
 800115a:   d11e        bne.n   0x800119a
 800115c:   7909        ldrb    r1, [r1, #4]
 800115e:   f001 020f   and.w   r2, r1, #15
 8001162:   0092        lsls    r2, r2, #2
 8001164:   f102 4280   add.w   r2, r2, #1073741824 ; 0x40000000
 8001168:   f502 42b8   add.w   r2, r2, #23552  ; 0x5c00
 800116c:   f011 0f80   tst.w   r1, #128    ; 0x80
 8001170:   6812        ldr r2, [r2, #0]
 8001172:   d006        beq.n   0x8001182
 8001174:   f002 0230   and.w   r2, r2, #48 ; 0x30
 8001178:   2a10        cmp r2, #16
 800117a:   d107        bne.n   0x800118c
 800117c:   2201        movs    r2, #1
 800117e:   701a        strb    r2, [r3, #0]
 8001180:   e004        b.n 0x800118c
 8001182:   f402 5240   and.w   r2, r2, #12288  ; 0x3000
 8001186:   f5b2 5f80   cmp.w   r2, #4096   ; 0x1000
 800118a:   e7f6        b.n 0x800117a
 800118c:   4b05        ldr r3, [pc, #20]   ; (0x80011a4)
 800118e:   681b        ldr r3, [r3, #0]
 8001190:   691b        ldr r3, [r3, #16]
 8001192:   4798        blx r3
 8001194:   4802        ldr r0, [pc, #8]    ; (0x80011a0)
 8001196:   bd10        pop {r4, pc}
 8001198:   4610        mov r0, r2
 800119a:   bd10        pop {r4, pc}
 800119c:   0304        lsls    r4, r0, #12
 800119e:   2000        movs    r0, #0
 80011a0:   030a        lsls    r2, r1, #12
 80011a2:   2000        movs    r0, #0
 80011a4:   0300        lsls    r0, r0, #12
 80011a6:   2000        movs    r0, #0

FUNCTION(DataStageIn)
 80011a8:   4a23        ldr r2, [pc, #140]  ; (0x8001238)
 80011aa:   e92d 43f8   stmdb   sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 80011ae:   6814        ldr r4, [r2, #0]
 80011b0:   4690        mov r8, r2
 80011b2:   8a23        ldrh    r3, [r4, #16]
 80011b4:   7a26        ldrb    r6, [r4, #8]
 80011b6:   4f21        ldr r7, LOC(SaveTState) // [pc, #132]  ; (0x800123c)
 80011b8:   b9a3        cbnz    r3, LOC(HAVE_DATA_TO_SEND) // 0x80011e4 // if ((save_wLength == 0) && (ControlState == LAST_IN_DATA))
 80011ba:   2e04        cmp r6, #4
 80011bc:   d112        bne.n   LOC(HAVE_DATA_TO_SEND) // 0x80011e4 // if ((save_wLength == 0) && (ControlState == LAST_IN_DATA))
  LOC(NO_MORE_DATA):

 80011be:   4920        ldr r1, [pc, #128]  ; (0x8001240)
 80011c0:   780a        ldrb    r2, [r1, #0]
 80011c2:   2a01        cmp r2, #1  // if(Data_Mul_MaxPacketSize == TRUE)
 80011c4:   d10a        bne.n   0x80011dc
 80011c6:   4a1f        ldr r2, LOC({USB_BTABLE}) // [pc, #124]  ; (0x8001244)
 80011c8:   6810        ldr r0, [r2, #0]    // Descriptor[0].USB_ADDR_TX
 80011ca:   4a1f        ldr r2, [pc, #124]  ; (0x8001248)
 80011cc:   b280        uxth    r0, r0
 80011ce:   4402        add r2, r0
 80011d0:   0052        lsls    r2, r2, #1
 80011d2:   6013        str r3, [r2, #0]    // TXBUF[0] = 0
 80011d4:   2230        movs    r2, #48 ; 0x30
 80011d6:   803a        strh    r2, [r7, #0]    // SaveTState = 0x30 = USB_STAT_TX_VALID
 80011d8:   700b        strb    r3, [r1, #0]
 80011da:   e027        b.n LOC(Expect_Status_Out) // 0x800122c

 80011dc:   2310        movs    r3, #16
 80011de:   803b        strh    r3, [r7, #0]
 80011e0:   2607        movs    r6, #7
 80011e2:   e023        b.n LOC(Expect_Status_Out) // 0x800122c

   LOC(HAVE_DATA_TO_SEND):
 80011e4:   8aa5        ldrh    r5, [r4, #20] // r5 = Length
 80011e6:   42ab        cmp r3, r5  // (save_wLength > Length)
 80011e8:   bf8c        ite hi
 80011ea:   2602        movhi   r6, #2  // IN_DATA
 80011ec:   2604        movls   r6, #4  // LAST_IN_DATA
 80011ee:   429d        cmp r5, r3 // if (Length > save_wLength)
 80011f0:   bf28        it  cs
 80011f2:   461d        movcs   r5, r3  // Length = save_wLength;
 80011f4:   4628        mov r0, r5
 80011f6:   69a3        ldr r3, [r4, #24]   // r3 = pEPinfo->CopyData
 80011f8:   4798        blx r3              // r9 = DataBuffer = (*pEPinfo->CopyData)(Length);
 80011fa:   4681        mov r9, r0
 80011fc:   2000        movs    r0, #0
 80011fe:   f7ff fe57   bl  GetEPTxAddr // 0x8000eb0 // UserToPMABufferCopy(DataBuffer, GetEPTxAddr(ENDP0), Length);
 8001202:   462a        mov r2, r5
 8001204:   4601        mov r1, r0
 8001206:   4648        mov r0, r9
 8001208:   f000 fb68   bl  UserToPMABufferCopy // 0x80018dc // UserToPMABufferCopy(DataBuffer, GetEPTxAddr(ENDP0), Length);
 800120c:   4629        mov r1, r5
 800120e:   2000        movs    r0, #0
 8001210:   f7ff fe6a   bl  SetEPTxCount // 0x8000ee8 // SetEPTxCount(ENDP0, Length);
 8001214:   8a23        ldrh    r3, [r4, #16]
 8001216:   f44f 5240   mov.w   r2, #12288  ; 0x3000
 800121a:   1b5b        subs    r3, r3, r5
 800121c:   8223        strh    r3, [r4, #16]
 800121e:   8a63        ldrh    r3, [r4, #18]
 8001220:   441d        add r5, r3
 8001222:   2330        movs    r3, #48 ; 0x30
 8001224:   803b        strh    r3, [r7, #0]
 8001226:   4b09        ldr r3, LOC(SaveRState) // [pc, #36]   ; (0x800124c)
 8001228:   8265        strh    r5, [r4, #18]
 800122a:   801a        strh    r2, [r3, #0]

  LOC(Expect_Status_Out):
 800122c:   f8d8 3000   ldr.w   r3, [r8]
 8001230:   721e        strb    r6, [r3, #8]    // pInformation->ControlState = ControlState;
 8001232:   e8bd 83f8   ldmia.w sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8001236:   bf00        nop

 8001238:   .word 0x20000304
 800123c: LOC(SaveTState):      .word SaveTState // 0x200002d4
 8001240:   .word 0x20000b24
 8001244: LOC({USB_BTABLE}):    .word USB_BASE + USB_BTABLE // 0x40005c50
 8001248:   .word 0x20003002
 800124c: LOC(SaveRState):      .word SaveRState // 0x200002d2

 8001250:   b510        push    {r4, lr}
 8001252:   4b0a        ldr r3, [pc, #40]   ; (0x800127c)
 8001254:   490a        ldr r1, [pc, #40]   ; (0x8001280)
 8001256:   681b        ldr r3, [r3, #0]
 8001258:   7849        ldrb    r1, [r1, #1]
 800125a:   789a        ldrb    r2, [r3, #2]
 800125c:   4291        cmp r1, r2
 800125e:   d30a        bcc.n   0x8001276
 8001260:   78d9        ldrb    r1, [r3, #3]
 8001262:   b941        cbnz    r1, 0x8001276
 8001264:   889c        ldrh    r4, [r3, #4]
 8001266:   b934        cbnz    r4, 0x8001276
 8001268:   729a        strb    r2, [r3, #10]
 800126a:   4b06        ldr r3, [pc, #24]   ; (0x8001284)
 800126c:   681b        ldr r3, [r3, #0]
 800126e:   685b        ldr r3, [r3, #4]
 8001270:   4798        blx r3
 8001272:   4620        mov r0, r4
 8001274:   bd10        pop {r4, pc}
 8001276:   2002        movs    r0, #2
 8001278:   bd10        pop {r4, pc}
 800127a:   bf00        nop
 800127c:   0304        lsls    r4, r0, #12
 800127e:   2000        movs    r0, #0
 8001280:   0090        lsls    r0, r2, #2
 8001282:   2000        movs    r0, #0
 8001284:   0300        lsls    r0, r0, #12
 8001286:   2000        movs    r0, #0
 8001288:   b538        push    {r3, r4, r5, lr}
 800128a:   4a0e        ldr r2, [pc, #56]   ; (0x80012c4)
 800128c:   4c0e        ldr r4, [pc, #56]   ; (0x80012c8)
 800128e:   6812        ldr r2, [r2, #0]
 8001290:   6823        ldr r3, [r4, #0]
 8001292:   6992        ldr r2, [r2, #24]
 8001294:   7918        ldrb    r0, [r3, #4]
 8001296:   7899        ldrb    r1, [r3, #2]
 8001298:   4790        blx r2
 800129a:   6823        ldr r3, [r4, #0]
 800129c:   7a9a        ldrb    r2, [r3, #10]
 800129e:   b17a        cbz r2, 0x80012c0
 80012a0:   b970        cbnz    r0, 0x80012c0
 80012a2:   795a        ldrb    r2, [r3, #5]
 80012a4:   b962        cbnz    r2, 0x80012c0
 80012a6:   78dd        ldrb    r5, [r3, #3]
 80012a8:   b955        cbnz    r5, 0x80012c0
 80012aa:   4b08        ldr r3, [pc, #32]   ; (0x80012cc)
 80012ac:   681b        ldr r3, [r3, #0]
 80012ae:   68db        ldr r3, [r3, #12]
 80012b0:   4798        blx r3
 80012b2:   6823        ldr r3, [r4, #0]
 80012b4:   4628        mov r0, r5
 80012b6:   791a        ldrb    r2, [r3, #4]
 80012b8:   72da        strb    r2, [r3, #11]
 80012ba:   789a        ldrb    r2, [r3, #2]
 80012bc:   731a        strb    r2, [r3, #12]
 80012be:   bd38        pop {r3, r4, r5, pc}
 80012c0:   2002        movs    r0, #2
 80012c2:   bd38        pop {r3, r4, r5, pc}
 80012c4:   02dc        lsls    r4, r3, #11
 80012c6:   2000        movs    r0, #0
 80012c8:   0304        lsls    r4, r0, #12
 80012ca:   2000        movs    r0, #0
 80012cc:   0300        lsls    r0, r0, #12
 80012ce:   2000        movs    r0, #0
 80012d0:   b538        push    {r3, r4, r5, lr}
 80012d2:   4b2f        ldr r3, [pc, #188]  ; (0x8001390)
 80012d4:   681b        ldr r3, [r3, #0]
 80012d6:   7818        ldrb    r0, [r3, #0]
 80012d8:   f010 007f   ands.w  r0, r0, #127    ; 0x7f
 80012dc:   d104        bne.n   0x80012e8
 80012de:   7a5a        ldrb    r2, [r3, #9]
 80012e0:   f022 0220   bic.w   r2, r2, #32
 80012e4:   725a        strb    r2, [r3, #9]
 80012e6:   bd38        pop {r3, r4, r5, pc}
 80012e8:   2802        cmp r0, #2
 80012ea:   d14e        bne.n   0x800138a
 80012ec:   885a        ldrh    r2, [r3, #2]
 80012ee:   2a00        cmp r2, #0
 80012f0:   d14c        bne.n   0x800138c
 80012f2:   795a        ldrb    r2, [r3, #5]
 80012f4:   2a00        cmp r2, #0
 80012f6:   d149        bne.n   0x800138c
 80012f8:   791a        ldrb    r2, [r3, #4]
 80012fa:   4d26        ldr r5, [pc, #152]  ; (0x8001394)
 80012fc:   f022 0080   bic.w   r0, r2, #128    ; 0x80
 8001300:   0084        lsls    r4, r0, #2
 8001302:   f104 4180   add.w   r1, r4, #1073741824 ; 0x40000000
 8001306:   f501 41b8   add.w   r1, r1, #23552  ; 0x5c00
 800130a:   6809        ldr r1, [r1, #0]
 800130c:   782d        ldrb    r5, [r5, #0]
 800130e:   f012 0f80   tst.w   r2, #128    ; 0x80
 8001312:   bf14        ite ne
 8001314:   f001 0130   andne.w r1, r1, #48 ; 0x30
 8001318:   f401 5140   andeq.w r1, r1, #12288  ; 0x3000
 800131c:   42a8        cmp r0, r5
 800131e:   d234        bcs.n   0x800138a
 8001320:   2900        cmp r1, #0
 8001322:   d032        beq.n   0x800138a
 8001324:   7a9b        ldrb    r3, [r3, #10]
 8001326:   b383        cbz r3, 0x800138a
 8001328:   f104 4480   add.w   r4, r4, #1073741824 ; 0x40000000
 800132c:   f504 44b8   add.w   r4, r4, #23552  ; 0x5c00
 8001330:   0612        lsls    r2, r2, #24
 8001332:   6823        ldr r3, [r4, #0]
 8001334:   d50c        bpl.n   0x8001350
 8001336:   f003 0330   and.w   r3, r3, #48 ; 0x30
 800133a:   2b10        cmp r3, #16
 800133c:   d11f        bne.n   0x800137e
 800133e:   b2c4        uxtb    r4, r0
 8001340:   4620        mov r0, r4
 8001342:   f7ff fda5   bl  0x8000e90
 8001346:   4620        mov r0, r4
 8001348:   2130        movs    r1, #48 ; 0x30
 800134a:   f7ff fd5f   bl  0x8000e0c
 800134e:   e016        b.n 0x800137e
 8001350:   f403 5340   and.w   r3, r3, #12288  ; 0x3000
 8001354:   f5b3 5f80   cmp.w   r3, #4096   ; 0x1000
 8001358:   d111        bne.n   0x800137e
 800135a:   b928        cbnz    r0, 0x8001368
 800135c:   4b0e        ldr r3, [pc, #56]   ; (0x8001398)
 800135e:   f893 1030   ldrb.w  r1, [r3, #48]   ; 0x30
 8001362:   f7ff fdcf   bl  0x8000f04
 8001366:   e001        b.n 0x800136c
 8001368:   f7ff fd82   bl  0x8000e70
 800136c:   6823        ldr r3, [r4, #0]
 800136e:   f423 4380   bic.w   r3, r3, #16384  ; 0x4000
 8001372:   f023 0370   bic.w   r3, r3, #112    ; 0x70
 8001376:   b29b        uxth    r3, r3
 8001378:   f483 5340   eor.w   r3, r3, #12288  ; 0x3000
 800137c:   6023        str r3, [r4, #0]
 800137e:   4b07        ldr r3, [pc, #28]   ; (0x800139c)
 8001380:   681b        ldr r3, [r3, #0]
 8001382:   695b        ldr r3, [r3, #20]
 8001384:   4798        blx r3
 8001386:   2000        movs    r0, #0
 8001388:   bd38        pop {r3, r4, r5, pc}
 800138a:   2002        movs    r0, #2
 800138c:   bd38        pop {r3, r4, r5, pc}
 800138e:   bf00        nop
 8001390:   0304        lsls    r4, r0, #12
 8001392:   2000        movs    r0, #0
 8001394:   0090        lsls    r0, r2, #2
 8001396:   2000        movs    r0, #0
 8001398:   0000        movs    r0, r0
 800139a:   2000        movs    r0, #0
 800139c:   0300        lsls    r0, r0, #12
 800139e:   2000        movs    r0, #0
 80013a0:   b538        push    {r3, r4, r5, lr}
 80013a2:   4b1d        ldr r3, [pc, #116]  ; (0x8001418)
 80013a4:   4d1d        ldr r5, [pc, #116]  ; (0x800141c)
 80013a6:   6819        ldr r1, [r3, #0]
 80013a8:   782d        ldrb    r5, [r5, #0]
 80013aa:   790a        ldrb    r2, [r1, #4]
 80013ac:   f022 0480   bic.w   r4, r2, #128    ; 0x80
 80013b0:   00a3        lsls    r3, r4, #2
 80013b2:   f103 4080   add.w   r0, r3, #1073741824 ; 0x40000000
 80013b6:   f500 40b8   add.w   r0, r0, #23552  ; 0x5c00
 80013ba:   6800        ldr r0, [r0, #0]
 80013bc:   f012 0f80   tst.w   r2, #128    ; 0x80
 80013c0:   bf14        ite ne
 80013c2:   f000 0030   andne.w r0, r0, #48 ; 0x30
 80013c6:   f400 5040   andeq.w r0, r0, #12288  ; 0x3000
 80013ca:   42ac        cmp r4, r5
 80013cc:   d222        bcs.n   0x8001414
 80013ce:   884c        ldrh    r4, [r1, #2]
 80013d0:   bb04        cbnz    r4, 0x8001414
 80013d2:   b1f8        cbz r0, 0x8001414
 80013d4:   7a89        ldrb    r1, [r1, #10]
 80013d6:   b1e9        cbz r1, 0x8001414
 80013d8:   f103 4380   add.w   r3, r3, #1073741824 ; 0x40000000
 80013dc:   f503 43b8   add.w   r3, r3, #23552  ; 0x5c00
 80013e0:   f012 0f80   tst.w   r2, #128    ; 0x80
 80013e4:   681a        ldr r2, [r3, #0]
 80013e6:   d007        beq.n   0x80013f8
 80013e8:   f422 42e0   bic.w   r2, r2, #28672  ; 0x7000
 80013ec:   f022 0240   bic.w   r2, r2, #64 ; 0x40
 80013f0:   b292        uxth    r2, r2
 80013f2:   f082 0210   eor.w   r2, r2, #16
 80013f6:   e006        b.n 0x8001406
 80013f8:   f422 4280   bic.w   r2, r2, #16384  ; 0x4000
 80013fc:   f022 0270   bic.w   r2, r2, #112    ; 0x70
 8001400:   b292        uxth    r2, r2
 8001402:   f482 5280   eor.w   r2, r2, #4096   ; 0x1000
 8001406:   601a        str r2, [r3, #0]
 8001408:   4b05        ldr r3, [pc, #20]   ; (0x8001420)
 800140a:   681b        ldr r3, [r3, #0]
 800140c:   699b        ldr r3, [r3, #24]
 800140e:   4798        blx r3
 8001410:   2000        movs    r0, #0
 8001412:   bd38        pop {r3, r4, r5, pc}
 8001414:   2002        movs    r0, #2
 8001416:   bd38        pop {r3, r4, r5, pc}
 8001418:   0304        lsls    r4, r0, #12
 800141a:   2000        movs    r0, #0
 800141c:   0090        lsls    r0, r2, #2
 800141e:   2000        movs    r0, #0
 8001420:   0300        lsls    r0, r0, #12
 8001422:   2000        movs    r0, #0
 8001424:   b508        push    {r3, lr}
 8001426:   4b06        ldr r3, [pc, #24]   ; (0x8001440)
 8001428:   681b        ldr r3, [r3, #0]
 800142a:   7a5a        ldrb    r2, [r3, #9]
 800142c:   f042 0220   orr.w   r2, r2, #32
 8001430:   725a        strb    r2, [r3, #9]
 8001432:   4b04        ldr r3, [pc, #16]   ; (0x8001444)
 8001434:   681b        ldr r3, [r3, #0]
 8001436:   69db        ldr r3, [r3, #28]
 8001438:   4798        blx r3
 800143a:   2000        movs    r0, #0
 800143c:   bd08        pop {r3, pc}
 800143e:   bf00        nop
 8001440:   0304        lsls    r4, r0, #12
 8001442:   2000        movs    r0, #0
 8001444:   0300        lsls    r0, r0, #12
 8001446:   2000        movs    r0, #0
 8001448:   4b05        ldr r3, [pc, #20]   ; (0x8001460)
 800144a:   681a        ldr r2, [r3, #0]
 800144c:   8a53        ldrh    r3, [r2, #18]
 800144e:   b918        cbnz    r0, 0x8001458
 8001450:   8889        ldrh    r1, [r1, #4]
 8001452:   1acb        subs    r3, r1, r3
 8001454:   8213        strh    r3, [r2, #16]
 8001456:   4770        bx  lr
 8001458:   6808        ldr r0, [r1, #0]
 800145a:   4418        add r0, r3
 800145c:   4770        bx  lr
 800145e:   bf00        nop
 8001460:   0304        lsls    r4, r0, #12
 8001462:   2000        movs    r0, #0
 8001464:   b508        push    {r3, lr}
 8001466:   4b0b        ldr r3, [pc, #44]   ; (0x8001494)
 8001468:   2000        movs    r0, #0
 800146a:   f893 1030   ldrb.w  r1, [r3, #48]   ; 0x30
 800146e:   f7ff fd49   bl  0x8000f04
 8001472:   4b09        ldr r3, [pc, #36]   ; (0x8001498)
 8001474:   681b        ldr r3, [r3, #0]
 8001476:   7a18        ldrb    r0, [r3, #8]
 8001478:   2808        cmp r0, #8
 800147a:   d106        bne.n   0x800148a
 800147c:   4b07        ldr r3, [pc, #28]   ; (0x800149c)
 800147e:   f44f 5280   mov.w   r2, #4096   ; 0x1000
 8001482:   801a        strh    r2, [r3, #0]
 8001484:   4b06        ldr r3, [pc, #24]   ; (0x80014a0)
 8001486:   2210        movs    r2, #16
 8001488:   801a        strh    r2, [r3, #0]
 800148a:   f1b0 0309   subs.w  r3, r0, #9
 800148e:   4258        negs    r0, r3
 8001490:   4158        adcs    r0, r3
 8001492:   bd08        pop {r3, pc}
 8001494:   0000        movs    r0, r0
 8001496:   2000        movs    r0, #0
 8001498:   0304        lsls    r4, r0, #12
 800149a:   2000        movs    r0, #0
 800149c:   02d2        lsls    r2, r2, #11
 800149e:   2000        movs    r0, #0
 80014a0:   02d4        lsls    r4, r2, #11
 80014a2:   2000        movs    r0, #0

FUNCTION(Setup0_Process)
 80014a4:   b573        push    {r0, r1, r4, r5, r6, lr}
 80014a6:   4e96        ldr r6, LOC({USB_BTABLE}) // [pc, #600]  ; (0x8001700)
 80014a8:   4b96        ldr r3, [pc, #600]  ; (0x8001704)
 80014aa:   6832        ldr r2, [r6, #0]
 80014ac:   4d96        ldr r5, [pc, #600]  ; (0x8001708)
 80014ae:   b292        uxth    r2, r2
 80014b0:   4413        add r3, r2
 80014b2:   005b        lsls    r3, r3, #1
 80014b4:   681a        ldr r2, [r3, #0]
 80014b6:   682b        ldr r3, [r5, #0]
 80014b8:   7a19        ldrb    r1, [r3, #8]    // r1 = pInformation->ControlState
 80014ba:   2909        cmp r1, #9              // == PAUSE?
 80014bc:   d00f        beq.n   0x80014de
 80014be:   b292        uxth    r2, r2
 80014c0:   0052        lsls    r2, r2, #1
            // r2 += USB_PMA_BASE
 80014c2:   f102 4280   add.w   r2, r2, #1073741824 ; 0x40000000
 80014c6:   f502 42c0   add.w   r2, r2, #24576  ; 0x6000
 80014ca:   7811        ldrb    r1, [r2, #0]
 80014cc:   7019        strb    r1, [r3, #0]
 80014ce:   7851        ldrb    r1, [r2, #1]
 80014d0:   7059        strb    r1, [r3, #1]
 80014d2:   8891        ldrh    r1, [r2, #4]
 80014d4:   8059        strh    r1, [r3, #2]
 80014d6:   8911        ldrh    r1, [r2, #8]
 80014d8:   8099        strh    r1, [r3, #4]
 80014da:   8992        ldrh    r2, [r2, #12]
 80014dc:   80da        strh    r2, [r3, #6]

 80014de:   2201        movs    r2, #1          // r2 = SETTING_UP
 80014e0:   721a        strb    r2, [r3, #8]    // pInformation->ControlState = SETTING_UP;
 80014e2:   88da        ldrh    r2, [r3, #6]    // r2 = pInformation->USBwLength
 80014e4:   785c        ldrb    r4, [r3, #1]
 80014e6:   2a00        cmp r2, #0
 80014e8:   d161        bne.n   0x80015ae
  LOC(USBwLength_IS_0):

 80014ea:   781a        ldrb    r2, [r3, #0]
 80014ec:   f012 027f   ands.w  r2, r2, #127    ; 0x7f
 80014f0:   d13a        bne.n   0x8001568
 80014f2:   2c09        cmp r4, #9
 80014f4:   d102        bne.n   0x80014fc
 80014f6:   f7ff feab   bl  0x8001250
 80014fa:   e044        b.n 0x8001586
 80014fc:   2c05        cmp r4, #5
 80014fe:   d10f        bne.n   0x8001520
 8001500:   f993 2002   ldrsb.w r2, [r3, #2]
 8001504:   2a00        cmp r2, #0
 8001506:   da01        bge.n   0x800150c
 8001508:   2308        movs    r3, #8
 800150a:   e04d        b.n 0x80015a8
 800150c:   78da        ldrb    r2, [r3, #3]
 800150e:   2a00        cmp r2, #0
 8001510:   d1fa        bne.n   0x8001508
 8001512:   889a        ldrh    r2, [r3, #4]
 8001514:   2a00        cmp r2, #0
 8001516:   d1f7        bne.n   0x8001508
 8001518:   7a9b        ldrb    r3, [r3, #10]
 800151a:   2b00        cmp r3, #0
 800151c:   d037        beq.n   0x800158e
 800151e:   e7f3        b.n 0x8001508
 8001520:   2c03        cmp r4, #3
 8001522:   d113        bne.n   0x800154c
 8001524:   789a        ldrb    r2, [r3, #2]
 8001526:   2a01        cmp r2, #1
 8001528:   d007        beq.n   0x800153a
 800152a:   4b78        ldr r3, [pc, #480]  ; (0x800170c)
 800152c:   4620        mov r0, r4
 800152e:   681b        ldr r3, [r3, #0]
 8001530:   695b        ldr r3, [r3, #20]
 8001532:   4798        blx r3
 8001534:   2803        cmp r0, #3
 8001536:   d128        bne.n   0x800158a
 8001538:   e035        b.n 0x80015a6
 800153a:   889a        ldrh    r2, [r3, #4]
 800153c:   2a00        cmp r2, #0
 800153e:   d1f4        bne.n   0x800152a
 8001540:   7a5b        ldrb    r3, [r3, #9]
 8001542:   0698        lsls    r0, r3, #26
 8001544:   d5f1        bpl.n   0x800152a
 8001546:   f7ff ff6d   bl  0x8001424
 800154a:   e01c        b.n 0x8001586
 800154c:   2c01        cmp r4, #1
 800154e:   d1ec        bne.n   0x800152a
 8001550:   789a        ldrb    r2, [r3, #2]
 8001552:   2a01        cmp r2, #1
 8001554:   d1e9        bne.n   0x800152a
 8001556:   889a        ldrh    r2, [r3, #4]
 8001558:   2a00        cmp r2, #0
 800155a:   d1e6        bne.n   0x800152a
 800155c:   7a5b        ldrb    r3, [r3, #9]
 800155e:   0699        lsls    r1, r3, #26
 8001560:   d5e3        bpl.n   0x800152a
 8001562:   f7ff feb5   bl  0x80012d0
 8001566:   e00e        b.n 0x8001586
 8001568:   2a01        cmp r2, #1
 800156a:   d104        bne.n   0x8001576
 800156c:   2c0b        cmp r4, #11
 800156e:   d1dc        bne.n   0x800152a
 8001570:   f7ff fe8a   bl  0x8001288
 8001574:   e007        b.n 0x8001586
 8001576:   2a02        cmp r2, #2
 8001578:   d1d7        bne.n   0x800152a
 800157a:   2c01        cmp r4, #1
 800157c:   d0f1        beq.n   0x8001562
 800157e:   2c03        cmp r4, #3
 8001580:   d1d3        bne.n   0x800152a
 8001582:   f7ff ff0d   bl  0x80013a0
 8001586:   b110        cbz r0, 0x800158e
 8001588:   e7cf        b.n 0x800152a
 800158a:   2800        cmp r0, #0
 800158c:   d1bc        bne.n   0x8001508
 800158e:   6832        ldr r2, [r6, #0]
 8001590:   4b5f        ldr r3, [pc, #380]  ; (0x8001710)
 8001592:   b292        uxth    r2, r2
 8001594:   4413        add r3, r2
 8001596:   005b        lsls    r3, r3, #1
 8001598:   2200        movs    r2, #0
 800159a:   601a        str r2, [r3, #0]
 800159c:   4b5d        ldr r3, [pc, #372]  ; (0x8001714)
 800159e:   2230        movs    r2, #48 ; 0x30
 80015a0:   801a        strh    r2, [r3, #0]
 80015a2:   2306        movs    r3, #6
 80015a4:   e000        b.n 0x80015a8
 80015a6:   2309        movs    r3, #9
 80015a8:   682a        ldr r2, [r5, #0]
 80015aa:   7213        strb    r3, [r2, #8]
 80015ac:   e0d4        b.n 0x8001758

  LOC(USBwLength_NOT_0):
 80015ae:   2c06        cmp r4, #6              // if (Request_No == GET_DESCRIPTOR)
 80015b0:   d118        bne.n   0x80015e4
  LOC(Request_No_IS_GET_DESCRIPTOR):

 80015b2:   781a        ldrb    r2, [r3, #0]    // r2 = pInformation->whatever
 80015b4:   0652        lsls    r2, r2, #25
 80015b6:   d17c        bne.n   0x80016b2
 80015b8:   78da        ldrb    r2, [r3, #3]
 80015ba:   4b54        ldr r3, [pc, #336]  ; (0x800170c)
 80015bc:   2a01        cmp r2, #1              // if (wValue1 == DEVICE_DESCRIPTOR)
 80015be:   d102        bne.n   0x80015c6
 80015c0:   681b        ldr r3, [r3, #0]        // r3 = pProperty
 80015c2:   69db        ldr r3, [r3, #28]       // r3 = CopyRoutine = pProperty->GetDeviceDescriptor;
 80015c4:   e06c        b.n 0x80016a0

 80015c6:   2a02        cmp r2, #2              // else if (wValue1 == CONFIG_DESCRIPTOR)
 80015c8:   d102        bne.n   0x80015d0   
 80015ca:   681b        ldr r3, [r3, #0]
 80015cc:   6a1b        ldr r3, [r3, #32]
 80015ce:   e067        b.n 0x80016a0

 80015d0:   2a03        cmp r2, #3              // else if (wValue1 == STRING_DESCRIPTOR)
 80015d2:   d102        bne.n   0x80015da
 80015d4:   681b        ldr r3, [r3, #0]
 80015d6:   6a5b        ldr r3, [r3, #36]   ; 0x24
 80015d8:   e062        b.n 0x80016a0

 80015da:   2a21        cmp r2, #33 ; 0x21      // else if (wValue1 == 0x21)
 80015dc:   d169        bne.n   0x80016b2
 80015de:   681b        ldr r3, [r3, #0]
 80015e0:   6a9b        ldr r3, [r3, #40]   ; 0x28
 80015e2:   e05d        b.n 0x80016a0

 80015e4:   2c00        cmp r4, #0
 80015e6:   d13c        bne.n   0x8001662
 80015e8:   8859        ldrh    r1, [r3, #2]
 80015ea:   2900        cmp r1, #0
 80015ec:   d161        bne.n   0x80016b2
 80015ee:   685a        ldr r2, [r3, #4]
 80015f0:   f022 02ff   bic.w   r2, r2, #255    ; 0xff
 80015f4:   f5b2 3f00   cmp.w   r2, #131072 ; 0x20000
 80015f8:   d15b        bne.n   0x80016b2
 80015fa:   781a        ldrb    r2, [r3, #0]
 80015fc:   f012 027f   ands.w  r2, r2, #127    ; 0x7f
 8001600:   d104        bne.n   0x800160c
 8001602:   889b        ldrh    r3, [r3, #4]
 8001604:   2b00        cmp r3, #0
 8001606:   f000 80ab   beq.w   0x8001760
 800160a:   e052        b.n 0x80016b2
 800160c:   2a01        cmp r2, #1
 800160e:   d10c        bne.n   0x800162a
 8001610:   4a3e        ldr r2, [pc, #248]  ; (0x800170c)
 8001612:   7918        ldrb    r0, [r3, #4]
 8001614:   6812        ldr r2, [r2, #0]
 8001616:   6992        ldr r2, [r2, #24]
 8001618:   4790        blx r2
 800161a:   2800        cmp r0, #0
 800161c:   d149        bne.n   0x80016b2
 800161e:   682b        ldr r3, [r5, #0]
 8001620:   7a9b        ldrb    r3, [r3, #10]
 8001622:   2b00        cmp r3, #0
 8001624:   f040 809c   bne.w   0x8001760
 8001628:   e043        b.n 0x80016b2
 800162a:   2a02        cmp r2, #2
 800162c:   d141        bne.n   0x80016b2
 800162e:   791b        ldrb    r3, [r3, #4]
 8001630:   4839        ldr r0, [pc, #228]  ; (0x8001718)
 8001632:   f003 010f   and.w   r1, r3, #15
 8001636:   008a        lsls    r2, r1, #2
 8001638:   f102 4280   add.w   r2, r2, #1073741824 ; 0x40000000
 800163c:   f502 42b8   add.w   r2, r2, #23552  ; 0x5c00
 8001640:   6812        ldr r2, [r2, #0]
 8001642:   7800        ldrb    r0, [r0, #0]
 8001644:   f013 0f80   tst.w   r3, #128    ; 0x80
 8001648:   bf14        ite ne
 800164a:   f002 0230   andne.w r2, r2, #48 ; 0x30
 800164e:   f402 5240   andeq.w r2, r2, #12288  ; 0x3000
 8001652:   4281        cmp r1, r0
 8001654:   d22d        bcs.n   0x80016b2
 8001656:   f013 0f70   tst.w   r3, #112    ; 0x70
 800165a:   d12a        bne.n   0x80016b2
 800165c:   2a00        cmp r2, #0
 800165e:   d17f        bne.n   0x8001760
 8001660:   e027        b.n 0x80016b2
 8001662:   2c08        cmp r4, #8
 8001664:   d103        bne.n   0x800166e
 8001666:   781b        ldrb    r3, [r3, #0]
 8001668:   065b        lsls    r3, r3, #25
 800166a:   d07b        beq.n   0x8001764
 800166c:   e021        b.n 0x80016b2
 800166e:   2c0a        cmp r4, #10
 8001670:   d11f        bne.n   0x80016b2
 8001672:   781a        ldrb    r2, [r3, #0]
 8001674:   f002 027f   and.w   r2, r2, #127    ; 0x7f
 8001678:   2a01        cmp r2, #1
 800167a:   d11a        bne.n   0x80016b2
 800167c:   7a9a        ldrb    r2, [r3, #10]
 800167e:   b1c2        cbz r2, 0x80016b2
 8001680:   8859        ldrh    r1, [r3, #2]
 8001682:   b9b1        cbnz    r1, 0x80016b2
 8001684:   685a        ldr r2, [r3, #4]
 8001686:   f022 02ff   bic.w   r2, r2, #255    ; 0xff
 800168a:   f5b2 3f80   cmp.w   r2, #65536  ; 0x10000
 800168e:   d110        bne.n   0x80016b2
 8001690:   4a1e        ldr r2, [pc, #120]  ; (0x800170c)
 8001692:   7918        ldrb    r0, [r3, #4]
 8001694:   6812        ldr r2, [r2, #0]
 8001696:   6992        ldr r2, [r2, #24]
 8001698:   4790        blx r2
 800169a:   2800        cmp r0, #0
 800169c:   d064        beq.n   0x8001768
 800169e:   e008        b.n 0x80016b2

 80016a0:   b13b        cbz r3, LOC(CopyRoutine_IS_NULL) // 0x80016b2       // if (CopyRoutine)
  LOC(CopyRoutine_NOT_NULL):

 80016a2:   682a        ldr r2, [r5, #0]
 80016a4:   2400        movs    r4, #0
 80016a6:   8254        strh    r4, [r2, #18]
 80016a8:   6193        str r3, [r2, #24]
 80016aa:   4620        mov r0, r4
 80016ac:   4798        blx r3          // (*CopyRoutine)(0);
 80016ae:   4620        mov r0, r4      // Result = USB_SUCCESS;
 80016b0:   e00a        b.n 0x80016c8

  LOC(CopyRoutine_IS_NULL):
 80016b2:   4b16        ldr r3, [pc, #88]   ; (0x800170c)
 80016b4:   681a        ldr r2, [r3, #0]
 80016b6:   682b        ldr r3, [r5, #0]
 80016b8:   6912        ldr r2, [r2, #16]
 80016ba:   7858        ldrb    r0, [r3, #1]
 80016bc:   4790        blx r2
 80016be:   2803        cmp r0, #3
 80016c0:   d102        bne.n   0x80016c8
 80016c2:   4b11        ldr r3, [pc, #68]   ; (0x8001708)
 80016c4:   681b        ldr r3, [r3, #0]
 80016c6:   e005        b.n 0x80016d4

 80016c8:   682b        ldr r3, [r5, #0]
 80016ca:   f64f 71ff   movw    r1, #65535  ; 0xffff
 80016ce:   8a1a        ldrh    r2, [r3, #16]
 80016d0:   428a        cmp r2, r1              // if (pInformation->Ctrl_Info.Usb_wLength == 0xFFFF)
 80016d2:   d101        bne.n   LOC(Usb_wLength_NOT_0xFFFF) // 0x80016d8
 80016d4:   2209        movs    r2, #9          // pInformation->ControlState = PAUSE;
 80016d6:   e003        b.n 0x80016e0

  LOC(Usb_wLength_NOT_0xFFFF):
 80016d8:   2802        cmp r0, #2
 80016da:   d000        beq.n   0x80016de           // if ((Result == USB_UNSUPPORT) || (pInformation->Ctrl_Info.Usb_wLength == 0))
 80016dc:   b912        cbnz    r2, 0x80016e4
 80016de:   2208        movs    r2, #8          // pInformation->ControlState = STALLED;
 80016e0:   721a        strb    r2, [r3, #8]
 80016e2:   e039        b.n 0x8001758

  LOC(SURVIVED_ALL_EARLY_RETURNS):
 80016e4:   f993 1000   ldrsb.w r1, [r3]
 80016e8:   2900        cmp r1, #0
 80016ea:   da2f        bge.n  LOC(REQ_BIT7_IS_UNSET) // 0x800174c       // if (ValBit(pInformation->USBbmRequestType, 7))
  LOC(REQ_BIT7_IS_SET):

 80016ec:   88d9        ldrh    r1, [r3, #6]    // vu32 wLength = pInformation->USBwLength;
 80016ee:   9101        str r1, [sp, #4]
 80016f0:   9801        ldr r0, [sp, #4]
 80016f2:   4282        cmp r2, r0
 80016f4:   4805        ldr r0, [pc, #20]   ; (0x800170c)
 80016f6:   d911        bls.n   0x800171c       // if (pInformation->Ctrl_Info.Usb_wLength > wLength)
 80016f8:   9a01        ldr r2, [sp, #4]
 80016fa:   821a        strh    r2, [r3, #16]
 80016fc:   e01f        b.n 0x800173e
 80016fe:   bf00        nop
 8001700: LOC({USB_BTABLE}):    .word USB_BASE + USB_BTABLE // 0x40005c50
 8001704:   .word SRAM_3004 // 0x20003004
 8001708:   .word 0x20000304
 800170c:   .word 0x200002dc
 8001710:   .word 0x20003002
 8001714:   .word 0x200002d4
 8001718:   .word 0x20000090

 800171c:   428a        cmp r2, r1
 800171e:   d20e        bcs.n   0x800173e
 8001720:   6801        ldr r1, [r0, #0]
 8001722:   f891 1030   ldrb.w  r1, [r1, #48]   ; 0x30
 8001726:   428a        cmp r2, r1
 8001728:   d201        bcs.n   0x800172e
 800172a:   2100        movs    r1, #0
 800172c:   e005        b.n 0x800173a
 800172e:   fb92 f4f1   sdiv    r4, r2, r1
 8001732:   fb01 2214   mls r2, r1, r4, r2
 8001736:   b912        cbnz    r2, 0x800173e
 8001738:   2101        movs    r1, #1
 800173a:   4a0c        ldr r2, [pc, #48]   ; (0x800176c)
 800173c:   7011        strb    r1, [r2, #0]

 800173e:   6802        ldr r2, [r0, #0]
 8001740:   f892 2030   ldrb.w  r2, [r2, #48]   ; 0x30
 8001744:   829a        strh    r2, [r3, #20]   // pInformation->Ctrl_Info.PacketSize = pProperty->MaxPacketSize;
 8001746:   f7ff fd2f   bl  DataStageIn // 0x80011a8
 800174a:   e005        b.n 0x8001758

  LOC(REQ_BIT7_IS_UNSET):
 800174c:   2203        movs    r2, #3
 800174e:   721a        strb    r2, [r3, #8]
 8001750:   4b07        ldr r3, [pc, #28]   ; (0x8001770)
 8001752:   f44f 5240   mov.w   r2, #12288  ; 0x3000
 8001756:   801a        strh    r2, [r3, #0]
 8001758:   f7ff fe84   bl  0x8001464
 800175c:   b002        add sp, #8
 800175e:   bd70        pop {r4, r5, r6, pc}
 8001760:   4b04        ldr r3, [pc, #16]   ; (0x8001774)
 8001762:   e79e        b.n 0x80016a2
 8001764:   4b04        ldr r3, [pc, #16]   ; (0x8001778)
 8001766:   e79c        b.n 0x80016a2
 8001768:   4b04        ldr r3, [pc, #16]   ; (0x800177c)
 800176a:   e79a        b.n 0x80016a2
 800176c:   .word 0x20000b24
 8001770:   .word 0x200002d2
 8001774:   .word 0x08001119
 8001778:   .word 0x080010d1
 800177c:   .word 0x080010f5

FUNCTION(Out0_Process)
 8001780:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 8001782:   4d2b        ldr r5, [pc, #172]  ; (0x8001830)
 8001784:   682c        ldr r4, [r5, #0]
 8001786:   7a23        ldrb    r3, [r4, #8]
 8001788:   2b03        cmp r3, #3
 800178a:   d001        beq.n   0x8001790
 800178c:   2b05        cmp r3, #5
 800178e:   d141        bne.n   0x8001814
 8001790:   69a3        ldr r3, [r4, #24]
 8001792:   8a22        ldrh    r2, [r4, #16]
 8001794:   b1ab        cbz r3, 0x80017c2
 8001796:   b1a2        cbz r2, 0x80017c2
 8001798:   8aa6        ldrh    r6, [r4, #20]
 800179a:   4296        cmp r6, r2
 800179c:   bf28        it  cs
 800179e:   4616        movcs   r6, r2
 80017a0:   4630        mov r0, r6
 80017a2:   4798        blx r3
 80017a4:   8a23        ldrh    r3, [r4, #16]
 80017a6:   4607        mov r7, r0
 80017a8:   1b9b        subs    r3, r3, r6
 80017aa:   8223        strh    r3, [r4, #16]
 80017ac:   8a63        ldrh    r3, [r4, #18]
 80017ae:   2000        movs    r0, #0
 80017b0:   4433        add r3, r6
 80017b2:   8263        strh    r3, [r4, #18]
 80017b4:   f7ff fb8a   bl  0x8000ecc
 80017b8:   4632        mov r2, r6
 80017ba:   4601        mov r1, r0
 80017bc:   4638        mov r0, r7
 80017be:   f000 f8a5   bl  0x800190c
 80017c2:   8a23        ldrh    r3, [r4, #16]
 80017c4:   b153        cbz r3, 0x80017dc
 80017c6:   4b1b        ldr r3, [pc, #108]  ; (0x8001834)
 80017c8:   2000        movs    r0, #0
 80017ca:   f44f 5240   mov.w   r2, #12288  ; 0x3000
 80017ce:   4601        mov r1, r0
 80017d0:   801a        strh    r2, [r3, #0]
 80017d2:   f7ff fb89   bl  0x8000ee8
 80017d6:   4b18        ldr r3, [pc, #96]   ; (0x8001838)
 80017d8:   2230        movs    r2, #48 ; 0x30
 80017da:   801a        strh    r2, [r3, #0]
 80017dc:   8a23        ldrh    r3, [r4, #16]
 80017de:   8aa2        ldrh    r2, [r4, #20]
 80017e0:   429a        cmp r2, r3
 80017e2:   d802        bhi.n   0x80017ea
 80017e4:   682b        ldr r3, [r5, #0]
 80017e6:   2203        movs    r2, #3
 80017e8:   e002        b.n 0x80017f0
 80017ea:   b11b        cbz r3, 0x80017f4
 80017ec:   682b        ldr r3, [r5, #0]
 80017ee:   2205        movs    r2, #5
 80017f0:   721a        strb    r2, [r3, #8]
 80017f2:   e00c        b.n 0x800180e
 80017f4:   682a        ldr r2, [r5, #0]
 80017f6:   2106        movs    r1, #6
 80017f8:   7211        strb    r1, [r2, #8]
 80017fa:   4a10        ldr r2, [pc, #64]   ; (0x800183c)
 80017fc:   6811        ldr r1, [r2, #0]
 80017fe:   4a10        ldr r2, [pc, #64]   ; (0x8001840)
 8001800:   b289        uxth    r1, r1
 8001802:   440a        add r2, r1
 8001804:   0052        lsls    r2, r2, #1
 8001806:   6013        str r3, [r2, #0]
 8001808:   4b0b        ldr r3, [pc, #44]   ; (0x8001838)
 800180a:   2230        movs    r2, #48 ; 0x30
 800180c:   801a        strh    r2, [r3, #0]
 800180e:   682b        ldr r3, [r5, #0]
 8001810:   7a1b        ldrb    r3, [r3, #8]
 8001812:   e006        b.n 0x8001822
 8001814:   2b07        cmp r3, #7
 8001816:   d103        bne.n   0x8001820
 8001818:   4b0a        ldr r3, [pc, #40]   ; (0x8001844)
 800181a:   681b        ldr r3, [r3, #0]
 800181c:   68db        ldr r3, [r3, #12]
 800181e:   4798        blx r3
 8001820:   2308        movs    r3, #8
 8001822:   682a        ldr r2, [r5, #0]
 8001824:   7213        strb    r3, [r2, #8]
 8001826:   e8bd 40f8   ldmia.w sp!, {r3, r4, r5, r6, r7, lr}
 800182a:   f7ff be1b   b.w 0x8001464
 800182e:   bf00        nop
 8001830:   0304        lsls    r4, r0, #12
 8001832:   2000        movs    r0, #0
 8001834:   02d2        lsls    r2, r2, #11
 8001836:   2000        movs    r0, #0
 8001838:   02d4        lsls    r4, r2, #11
 800183a:   2000        movs    r0, #0
 800183c:   .word USB_BASE + USB_BTABLE // 0x40005c50
 8001840:   3002        adds    r0, #2
 8001842:   2000        movs    r0, #0
 8001844:   02dc        lsls    r4, r3, #11
 8001846:   2000        movs    r0, #0

 8001848:   b530        push    {r4, r5, lr}
 800184a:   4b0b        ldr r3, [pc, #44]   ; (0x8001878)
 800184c:   781c        ldrb    r4, [r3, #0]
 800184e:   2300        movs    r3, #0
 8001850:   42a3        cmp r3, r4
 8001852:   d20c        bcs.n   0x800186e
 8001854:   f103 5280   add.w   r2, r3, #268435456  ; 0x10000000
 8001858:   f502 52b8   add.w   r2, r2, #5888   ; 0x1700
 800185c:   0091        lsls    r1, r2, #2
 800185e:   680d        ldr r5, [r1, #0]
 8001860:   f648 728f   movw    r2, #36751  ; 0x8f8f
 8001864:   402a        ands    r2, r5
 8001866:   431a        orrs    r2, r3
 8001868:   600a        str r2, [r1, #0]
 800186a:   3301        adds    r3, #1
 800186c:   e7f0        b.n 0x8001850
 800186e:   4b03        ldr r3, [pc, #12]   ; (0x800187c)
 8001870:   f040 0080   orr.w   r0, r0, #128    ; 0x80
 8001874:   6018        str r0, [r3, #0]
 8001876:   bd30        pop {r4, r5, pc}
 8001878:   0090        lsls    r0, r2, #2
 800187a:   2000        movs    r0, #0
 800187c:   .word USB_BASE + USB_DADDR // 0x40005c4c

FUNCTION(In0_Process)
 8001880:   b510        push    {r4, lr}
 8001882:   4c13        ldr r4, [pc, #76]   ; (0x80018d0)
 8001884:   6823        ldr r3, [r4, #0]
 8001886:   7a1a        ldrb    r2, [r3, #8]
 8001888:   2a02        cmp r2, #2
 800188a:   d001        beq.n   0x8001890
 800188c:   2a04        cmp r2, #4
 800188e:   d104        bne.n   0x800189a
 8001890:   f7ff fc8a   bl  0x80011a8
 8001894:   6823        ldr r3, [r4, #0]
 8001896:   7a1b        ldrb    r3, [r3, #8]
 8001898:   e013        b.n 0x80018c2
 800189a:   2a06        cmp r2, #6
 800189c:   d110        bne.n   0x80018c0
 800189e:   785a        ldrb    r2, [r3, #1]
 80018a0:   2a05        cmp r2, #5
 80018a2:   d109        bne.n   0x80018b8
 80018a4:   781a        ldrb    r2, [r3, #0]
 80018a6:   0652        lsls    r2, r2, #25
 80018a8:   d106        bne.n   0x80018b8
 80018aa:   7898        ldrb    r0, [r3, #2]
 80018ac:   f7ff ffcc   bl  0x8001848
 80018b0:   4b08        ldr r3, [pc, #32]   ; (0x80018d4)
 80018b2:   681b        ldr r3, [r3, #0]
 80018b4:   6a1b        ldr r3, [r3, #32]
 80018b6:   4798        blx r3
 80018b8:   4b07        ldr r3, [pc, #28]   ; (0x80018d8)
 80018ba:   681b        ldr r3, [r3, #0]
 80018bc:   689b        ldr r3, [r3, #8]
 80018be:   4798        blx r3
 80018c0:   2308        movs    r3, #8
 80018c2:   6822        ldr r2, [r4, #0]
 80018c4:   7213        strb    r3, [r2, #8]
 80018c6:   e8bd 4010   ldmia.w sp!, {r4, lr}
 80018ca:   f7ff bdcb   b.w 0x8001464
 80018ce:   bf00        nop
 80018d0:   0304        lsls    r4, r0, #12
 80018d2:   2000        movs    r0, #0
 80018d4:   0300        lsls    r0, r0, #12
 80018d6:   2000        movs    r0, #0
 80018d8:   02dc        lsls    r4, r3, #11
 80018da:   2000        movs    r0, #0

FUNCTION(UserToPMABufferCopy):
 80018dc:   b530        push    {r4, r5, lr}
 80018de:   f101 5100   add.w   r1, r1, #536870912  ; 0x20000000
 80018e2:   3201        adds    r2, #1
 80018e4:   f501 5140   add.w   r1, r1, #12288  ; 0x3000
 80018e8:   1052        asrs    r2, r2, #1
 80018ea:   0049        lsls    r1, r1, #1
 80018ec:   2300        movs    r3, #0
 80018ee:   4293        cmp r3, r2
 80018f0:   f100 0002   add.w   r0, r0, #2
 80018f4:   d009        beq.n   0x800190a
 80018f6:   f810 5c01   ldrb.w  r5, [r0, #-1]
 80018fa:   f810 4c02   ldrb.w  r4, [r0, #-2]
 80018fe:   ea44 2405   orr.w   r4, r4, r5, lsl #8
 8001902:   f821 4023   strh.w  r4, [r1, r3, lsl #2]
 8001906:   3301        adds    r3, #1
 8001908:   e7f1        b.n 0x80018ee
 800190a:   bd30        pop {r4, r5, pc}
 800190c:   b510        push    {r4, lr}
 800190e:   f101 5100   add.w   r1, r1, #536870912  ; 0x20000000
 8001912:   3201        adds    r2, #1
 8001914:   f501 5140   add.w   r1, r1, #12288  ; 0x3000
 8001918:   1052        asrs    r2, r2, #1
 800191a:   0049        lsls    r1, r1, #1
 800191c:   2300        movs    r3, #0
 800191e:   4293        cmp r3, r2
 8001920:   d005        beq.n   0x800192e
 8001922:   f851 4023   ldr.w   r4, [r1, r3, lsl #2]
 8001926:   f820 4013   strh.w  r4, [r0, r3, lsl #1]
 800192a:   3301        adds    r3, #1
 800192c:   e7f7        b.n 0x800191e
 800192e:   bd10        pop {r4, pc}
 8001930:   .word 0x08000495        lsls    r5, r2, #18
 8001934:   .word 0x08000181        lsls    r1, r0, #6
 8001938:   .word 0x0800013f        lsls    r7, r7, #4
 800193c:   .word 0x08000141        lsls    r1, r0, #5
 8001940:   .word 0x08000229        lsls    r1, r5, #8
 8001944:   .word 0x080002cd        lsls    r5, r1, #11
 8001948:   .word 0x08000143        lsls    r3, r0, #5
 800194c:   .word 0x08000289        lsls    r1, r1, #10
 8001950:   .word 0x08000295        lsls    r5, r2, #10
 8001954:   .word 0x080002a1        lsls    r1, r4, #10
 8001958:   .word 0x080002c1        lsls    r1, r0, #11
 800195c:   0000        movs    r0, r0
 800195e:   0000        movs    r0, r0
 8001960:   0040        lsls    r0, r0, #1
 8001962:   0000        movs    r0, r0
 8001964:   .word 0x0800013d        lsls    r5, r7, #4
 8001968:   .word 0x0800013d        lsls    r5, r7, #4
 800196c:   .word 0x0800013d        lsls    r5, r7, #4
 8001970:   .word 0x0800013d        lsls    r5, r7, #4
 8001974:   .word 0x0800013d        lsls    r5, r7, #4
 8001978:   .word 0x0800013d        lsls    r5, r7, #4
 800197c:   .word 0x0800013d        lsls    r5, r7, #4
 8001980:   .word 0x0800013d        lsls    r5, r7, #4
 8001984:   .word 0x0800013d        lsls    r5, r7, #4
 8001988:   .word 0x0800013d        lsls    r5, r7, #4
 800198c:   .word 0x0800013d        lsls    r5, r7, #4
 8001990:   .word 0x0800013d        lsls    r5, r7, #4
 8001994:   .word 0x0800013d        lsls    r5, r7, #4
 8001998:   .word 0x0800013d        lsls    r5, r7, #4
 800199c:   .word 0x0800014d        lsls    r5, r1, #5
 80019a0:   .word 0x08000151        lsls    r1, r2, #5
 80019a4:   .word 0x08000169        lsls    r1, r5, #5
 80019a8:   .word 0x0800016b        lsls    r3, r5, #5
 80019ac:   .word 0x0800016d        lsls    r5, r5, #5
 80019b0:   .word 0x0800016f        lsls    r7, r5, #5
 80019b4:   .word 0x08000171        lsls    r1, r6, #5
 80019b8:   .word 0x08000173        lsls    r3, r6, #5
 80019bc:   .word 0x08000175        lsls    r5, r6, #5
 80019c0:   0101        lsls    r1, r0, #4
 80019c2:   0000        movs    r0, r0
 80019c4:   00e8        lsls    r0, r5, #3
 80019c6:   2000        movs    r0, #0
 80019c8:   0004        movs    r4, r0
 80019ca:   0000        movs    r0, r0
 80019cc:   0132        lsls    r2, r6, #4
 80019ce:   2000        movs    r0, #0
 80019d0:   0012        movs    r2, r2
 80019d2:   0000        movs    r0, r0
 80019d4:   014c        lsls    r4, r1, #5
 80019d6:   2000        movs    r0, #0
 80019d8:   0014        movs    r4, r2
 80019da:   0000        movs    r0, r0
 80019dc:   0119        lsls    r1, r3, #4
 80019de:   2000        movs    r0, #0
 80019e0:   0010        movs    r0, r2
 80019e2:   0000        movs    r0, r0
 80019e4:   0160        lsls    r0, r4, #5
 80019e6:   2000        movs    r0, #0
 80019e8:   0080        lsls    r0, r0, #2
 80019ea:   0000        movs    r0, r0
 80019ec:   01e0        lsls    r0, r4, #7
 80019ee:   2000        movs    r0, #0
 80019f0:   006c        lsls    r4, r5, #1
 80019f2:   0000        movs    r0, r0
 80019f4:   024c        lsls    r4, r1, #9
 80019f6:   2000        movs    r0, #0
 80019f8:   006c        lsls    r4, r5, #1
 80019fa:   0000        movs    r0, r0
 80019fc:   0112        lsls    r2, r2, #4
 80019fe:   0100        lsls    r0, r0, #4
 8001a00:   0000        movs    r0, r0
 8001a02:   4000        ands    r0, r0
 8001a04:   1eaf        subs    r7, r5, #2
 8001a06:   0003        movs    r3, r0
 8001a08:   0201        lsls    r1, r0, #8
 8001a0a:   0201        lsls    r1, r0, #8
 8001a0c:   0103        lsls    r3, r0, #4
 8001a0e:   0000        movs    r0, r0
 8001a10:   0129        lsls    r1, r5, #4
 8001a12:   2000        movs    r0, #0
 8001a14:   0009        movs    r1, r1
 8001a16:   0000        movs    r0, r0
 8001a18:   0304        lsls    r4, r0, #12
 8001a1a:   0409        lsls    r1, r1, #16
 8001a1c:   0209        lsls    r1, r1, #8
 8001a1e:   002d        movs    r5, r5
 8001a20:   0101        lsls    r1, r0, #4
 8001a22:   8000        strh    r0, [r0, #0]
 8001a24:   0932        lsrs    r2, r6, #4
 8001a26:   0004        movs    r4, r0
 8001a28:   0000        movs    r0, r0
 8001a2a:   01fe        lsls    r6, r7, #7
 8001a2c:   0402        lsls    r2, r0, #16
 8001a2e:   0409        lsls    r1, r1, #16
 8001a30:   0100        lsls    r0, r0, #4
 8001a32:   fe00 0201   cdp2    2, 0, cr0, cr0, cr1, {0}
 8001a36:   0905        lsrs    r5, r0, #4
 8001a38:   0004        movs    r4, r0
 8001a3a:   0002        movs    r2, r0
 8001a3c:   01fe        lsls    r6, r7, #7
 8001a3e:   0602        lsls    r2, r0, #24
 8001a40:   2109        movs    r1, #9
 8001a42:   ff03 0000   vhadd.u8    d0, d3, d0
 8001a46:   1008        asrs    r0, r1, #32
 8001a48:   1001        asrs    r1, r0, #32
 8001a4a:   4c03        ldr r4, [pc, #12]   ; (0x8001a58)
 8001a4c:   4c00        ldr r4, [pc, #0]    ; (0x8001a50)
 8001a4e:   4d00        ldr r5, [pc, #0]    ; (0x8001a50)
 8001a50:   2000        movs    r0, #0
 8001a52:   3000        adds    r0, #0
 8001a54:   3000        adds    r0, #0
 8001a56:   3300        adds    r3, #0
 8001a58:   0900        lsrs    r0, r0, #4
 8001a5a:   0321        lsls    r1, r4, #12
 8001a5c:   00ff        lsls    r7, r7, #3
 8001a5e:   0800        lsrs    r0, r0, #32
 8001a60:   0110        lsls    r0, r2, #4
 8001a62:   0312        lsls    r2, r2, #12
 8001a64:   004c        lsls    r4, r1, #1
 8001a66:   0065        lsls    r5, r4, #1
 8001a68:   0061        lsls    r1, r4, #1
 8001a6a:   0066        lsls    r6, r4, #1
 8001a6c:   004c        lsls    r4, r1, #1
 8001a6e:   0061        lsls    r1, r4, #1
 8001a70:   0062        lsls    r2, r4, #1
 8001a72:   0073        lsls    r3, r6, #1
 8001a74:   00cc        lsls    r4, r1, #3
 8001a76:   2000        movs    r0, #0
 8001a78:   0012        movs    r2, r2
 8001a7a:   0000        movs    r0, r0
 8001a7c:   0314        lsls    r4, r2, #12
 8001a7e:   004d        lsls    r5, r1, #1
 8001a80:   0061        lsls    r1, r4, #1
 8001a82:   0070        lsls    r0, r6, #1
 8001a84:   006c        lsls    r4, r5, #1
 8001a86:   0065        lsls    r5, r4, #1
 8001a88:   0020        movs    r0, r4
 8001a8a:   0030        movs    r0, r6
 8001a8c:   0030        movs    r0, r6
 8001a8e:   0033        movs    r3, r6
 8001a90:   0380        lsls    r0, r0, #14
 8001a92:   0053        lsls    r3, r2, #1
 8001a94:   0054        lsls    r4, r2, #1
 8001a96:   004d        lsls    r5, r1, #1
 8001a98:   0033        movs    r3, r6
 8001a9a:   0032        movs    r2, r6
 8001a9c:   0064        lsls    r4, r4, #1
 8001a9e:   0075        lsls    r5, r6, #1
 8001aa0:   0069        lsls    r1, r5, #1
 8001aa2:   006e        lsls    r6, r5, #1
 8001aa4:   006f        lsls    r7, r5, #1
 8001aa6:   0020        movs    r0, r4
 8001aa8:   0062        lsls    r2, r4, #1
 8001aaa:   006f        lsls    r7, r5, #1
 8001aac:   006f        lsls    r7, r5, #1
 8001aae:   0074        lsls    r4, r6, #1
 8001ab0:   006c        lsls    r4, r5, #1
 8001ab2:   006f        lsls    r7, r5, #1
 8001ab4:   0061        lsls    r1, r4, #1
 8001ab6:   0064        lsls    r4, r4, #1
 8001ab8:   0065        lsls    r5, r4, #1
 8001aba:   0072        lsls    r2, r6, #1
 8001abc:   0020        movs    r0, r4
 8001abe:   0076        lsls    r6, r6, #1
 8001ac0:   0031        movs    r1, r6
 8001ac2:   002e        movs    r6, r5
 8001ac4:   0030        movs    r0, r6
 8001ac6:   0020        movs    r0, r4
 8001ac8:   0020        movs    r0, r4
 8001aca:   0045        lsls    r5, r0, #1
 8001acc:   0052        lsls    r2, r2, #1
 8001ace:   0052        lsls    r2, r2, #1
 8001ad0:   004f        lsls    r7, r1, #1
 8001ad2:   0052        lsls    r2, r2, #1
 8001ad4:   002e        movs    r6, r5
 8001ad6:   0020        movs    r0, r4
 8001ad8:   0055        lsls    r5, r2, #1
 8001ada:   0070        lsls    r0, r6, #1
 8001adc:   006c        lsls    r4, r5, #1
 8001ade:   006f        lsls    r7, r5, #1
 8001ae0:   0061        lsls    r1, r4, #1
 8001ae2:   0064        lsls    r4, r4, #1
 8001ae4:   0020        movs    r0, r4
 8001ae6:   0074        lsls    r4, r6, #1
 8001ae8:   006f        lsls    r7, r5, #1
 8001aea:   0020        movs    r0, r4
 8001aec:   0052        lsls    r2, r2, #1
 8001aee:   0041        lsls    r1, r0, #1
 8001af0:   004d        lsls    r5, r1, #1
 8001af2:   0020        movs    r0, r4
 8001af4:   006e        lsls    r6, r5, #1
 8001af6:   006f        lsls    r7, r5, #1
 8001af8:   0074        lsls    r4, r6, #1
 8001afa:   0020        movs    r0, r4
 8001afc:   0073        lsls    r3, r6, #1
 8001afe:   0075        lsls    r5, r6, #1
 8001b00:   0070        lsls    r0, r6, #1
 8001b02:   0070        lsls    r0, r6, #1
 8001b04:   006f        lsls    r7, r5, #1
 8001b06:   0072        lsls    r2, r6, #1
 8001b08:   0074        lsls    r4, r6, #1
 8001b0a:   0065        lsls    r5, r4, #1
 8001b0c:   0064        lsls    r4, r4, #1
 8001b0e:   002e        movs    r6, r5
 8001b10:   036c        lsls    r4, r5, #13
 8001b12:   0053        lsls    r3, r2, #1
 8001b14:   0054        lsls    r4, r2, #1
 8001b16:   004d        lsls    r5, r1, #1
 8001b18:   0033        movs    r3, r6
 8001b1a:   0032        movs    r2, r6
 8001b1c:   0064        lsls    r4, r4, #1
 8001b1e:   0075        lsls    r5, r6, #1
 8001b20:   0069        lsls    r1, r5, #1
 8001b22:   006e        lsls    r6, r5, #1
 8001b24:   006f        lsls    r7, r5, #1
 8001b26:   0020        movs    r0, r4
 8001b28:   0062        lsls    r2, r4, #1
 8001b2a:   006f        lsls    r7, r5, #1
 8001b2c:   006f        lsls    r7, r5, #1
 8001b2e:   0074        lsls    r4, r6, #1
 8001b30:   006c        lsls    r4, r5, #1
 8001b32:   006f        lsls    r7, r5, #1
 8001b34:   0061        lsls    r1, r4, #1
 8001b36:   0064        lsls    r4, r4, #1
 8001b38:   0065        lsls    r5, r4, #1
 8001b3a:   0072        lsls    r2, r6, #1
 8001b3c:   0020        movs    r0, r4
 8001b3e:   0076        lsls    r6, r6, #1
 8001b40:   0031        movs    r1, r6
 8001b42:   002e        movs    r6, r5
 8001b44:   0030        movs    r0, r6
 8001b46:   0020        movs    r0, r4
 8001b48:   0020        movs    r0, r4
 8001b4a:   0055        lsls    r5, r2, #1
 8001b4c:   0070        lsls    r0, r6, #1
 8001b4e:   006c        lsls    r4, r5, #1
 8001b50:   006f        lsls    r7, r5, #1
 8001b52:   0061        lsls    r1, r4, #1
 8001b54:   0064        lsls    r4, r4, #1
 8001b56:   0020        movs    r0, r4
 8001b58:   0074        lsls    r4, r6, #1
 8001b5a:   006f        lsls    r7, r5, #1
 8001b5c:   0020        movs    r0, r4
 8001b5e:   0046        lsls    r6, r0, #1
 8001b60:   006c        lsls    r4, r5, #1
 8001b62:   0061        lsls    r1, r4, #1
 8001b64:   0073        lsls    r3, r6, #1
 8001b66:   0068        lsls    r0, r5, #1
 8001b68:   0020        movs    r0, r4
 8001b6a:   0030        movs    r0, r6
 8001b6c:   0078        lsls    r0, r7, #1
 8001b6e:   0038        movs    r0, r7
 8001b70:   0030        movs    r0, r6
 8001b72:   0030        movs    r0, r6
 8001b74:   0035        movs    r5, r6
 8001b76:   0030        movs    r0, r6
 8001b78:   0030        movs    r0, r6
 8001b7a:   0030        movs    r0, r6
 8001b7c:   036c        lsls    r4, r5, #13
 8001b7e:   0053        lsls    r3, r2, #1
 8001b80:   0054        lsls    r4, r2, #1
 8001b82:   004d        lsls    r5, r1, #1
 8001b84:   0033        movs    r3, r6
 8001b86:   0032        movs    r2, r6
 8001b88:   0064        lsls    r4, r4, #1
 8001b8a:   0075        lsls    r5, r6, #1
 8001b8c:   0069        lsls    r1, r5, #1
 8001b8e:   006e        lsls    r6, r5, #1
 8001b90:   006f        lsls    r7, r5, #1
 8001b92:   0020        movs    r0, r4
 8001b94:   0062        lsls    r2, r4, #1
 8001b96:   006f        lsls    r7, r5, #1
 8001b98:   006f        lsls    r7, r5, #1
 8001b9a:   0074        lsls    r4, r6, #1
 8001b9c:   006c        lsls    r4, r5, #1
 8001b9e:   006f        lsls    r7, r5, #1
 8001ba0:   0061        lsls    r1, r4, #1
 8001ba2:   0064        lsls    r4, r4, #1
 8001ba4:   0065        lsls    r5, r4, #1
 8001ba6:   0072        lsls    r2, r6, #1
 8001ba8:   0020        movs    r0, r4
 8001baa:   0076        lsls    r6, r6, #1
 8001bac:   0031        movs    r1, r6
 8001bae:   002e        movs    r6, r5
 8001bb0:   0030        movs    r0, r6
 8001bb2:   0020        movs    r0, r4
 8001bb4:   0020        movs    r0, r4
 8001bb6:   0055        lsls    r5, r2, #1
 8001bb8:   0070        lsls    r0, r6, #1
 8001bba:   006c        lsls    r4, r5, #1
 8001bbc:   006f        lsls    r7, r5, #1
 8001bbe:   0061        lsls    r1, r4, #1
 8001bc0:   0064        lsls    r4, r4, #1
 8001bc2:   0020        movs    r0, r4
 8001bc4:   0074        lsls    r4, r6, #1
 8001bc6:   006f        lsls    r7, r5, #1
 8001bc8:   0020        movs    r0, r4
 8001bca:   0046        lsls    r6, r0, #1
 8001bcc:   006c        lsls    r4, r5, #1
 8001bce:   0061        lsls    r1, r4, #1
 8001bd0:   0073        lsls    r3, r6, #1
 8001bd2:   0068        lsls    r0, r5, #1
 8001bd4:   0020        movs    r0, r4
 8001bd6:   0030        movs    r0, r6
 8001bd8:   0078        lsls    r0, r7, #1
 8001bda:   0038        movs    r0, r7
 8001bdc:   0030        movs    r0, r6
 8001bde:   0030        movs    r0, r6
 8001be0:   0032        movs    r2, r6
 8001be2:   0030        movs    r0, r6
 8001be4:   0030        movs    r0, r6
 8001be6:   0030        movs    r0, r6
 8001be8:   00ec        lsls    r4, r5, #3
 8001bea:   2000        movs    r0, #0
 8001bec:   002d        movs    r5, r5
 8001bee:   0000        movs    r0, r0
 8001bf0:   5000        str r0, [r0, r0]
 8001bf2:   2000        movs    r0, #0
 8001bf4:   0c00        lsrs    r0, r0, #16
 8001bf6:   2000        movs    r0, #0
    ...
 8002000:   5000        str r0, [r0, r0]
 8002002:   2000        movs    r0, #0
 8002004:   .word 0x08002191        movs    r1, #145    ; 0x91
 8002008:   .word 0x08002461        movs    r4, #97 ; 0x61
 800200c:   .word 0x08002465        movs    r4, #101    ; 0x65
 8002010:   .word 0x08002469        movs    r4, #105    ; 0x69
 8002014:   .word 0x0800246d        movs    r4, #109    ; 0x6d
 8002018:   .word 0x08002471        movs    r4, #113    ; 0x71
 800201c:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002020:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002024:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002028:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 800202c:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002030:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002034:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002038:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 800203c:   .word 0x0800285d        cmp r0, #93 ; 0x5d
 8002040:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002044:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002048:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 800204c:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002050:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002054:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002058:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 800205c:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002060:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002064:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002068:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 800206c:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002070:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002074:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002078:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 800207c:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002080:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002084:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002088:   .word 0x08002519        movs    r5, #25
 800208c:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002090:   .word 0x0800327d        adds    r2, #125    ; 0x7d
 8002094:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 8002098:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 800209c:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 80020a0:   .word 0x080028e5        cmp r0, #229    ; 0xe5
 80020a4:   .word 0x08002909        cmp r1, #9
 80020a8:   .word 0x0800292d        cmp r1, #45 ; 0x2d
 80020ac:   .word 0x08002965        cmp r1, #101    ; 0x65
 80020b0:   .word 0x080029b9        cmp r1, #185    ; 0xb9
 80020b4:   .word 0x08002a29        cmp r2, #41 ; 0x29
 80020b8:   .word 0x08002a99        cmp r2, #153    ; 0x99
 80020bc:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 80020c0:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 80020c4:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 80020c8:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 80020cc:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 80020d0:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 80020d4:   .word 0x08002b81        cmp r3, #129    ; 0x81
 80020d8:   .word 0x08002bd5        cmp r3, #213    ; 0xd5
 80020dc:   .word 0x08002c29        cmp r4, #41 ; 0x29
 80020e0:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 80020e4:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 80020e8:   .word 0x080024c1        movs    r4, #193    ; 0xc1
 80020ec:   b510        push    {r4, lr}
 80020ee:   4c05        ldr r4, [pc, #20]   ; (0x8002104)
 80020f0:   7823        ldrb    r3, [r4, #0]
 80020f2:   b933        cbnz    r3, 0x8002102
 80020f4:   4b04        ldr r3, [pc, #16]   ; (0x8002108)
 80020f6:   b113        cbz r3, 0x80020fe
 80020f8:   4804        ldr r0, [pc, #16]   ; (0x800210c)
 80020fa:   f3af 8000   nop.w
 80020fe:   2301        movs    r3, #1
 8002100:   7023        strb    r3, [r4, #0]
 8002102:   bd10        pop {r4, pc}
 8002104:   07d8        lsls    r0, r3, #31
 8002106:   2000        movs    r0, #0
 8002108:   0000        movs    r0, r0
 800210a:   0000        movs    r0, r0
 800210c:   4638        mov r0, r7
 800210e:   0800        lsrs    r0, r0, #32
 8002110:   b508        push    {r3, lr}
 8002112:   4b06        ldr r3, [pc, #24]   ; (0x800212c)
 8002114:   b11b        cbz r3, 0x800211e
 8002116:   4806        ldr r0, [pc, #24]   ; (0x8002130)
 8002118:   4906        ldr r1, [pc, #24]   ; (0x8002134)
 800211a:   f3af 8000   nop.w
 800211e:   4806        ldr r0, [pc, #24]   ; (0x8002138)
 8002120:   6803        ldr r3, [r0, #0]
 8002122:   b113        cbz r3, 0x800212a
 8002124:   4b05        ldr r3, [pc, #20]   ; (0x800213c)
 8002126:   b103        cbz r3, 0x800212a
 8002128:   4798        blx r3
 800212a:   bd08        pop {r3, pc}
 800212c:   0000        movs    r0, r0
 800212e:   0000        movs    r0, r0
 8002130:   4638        mov r0, r7
 8002132:   0800        lsrs    r0, r0, #32
 8002134:   07dc        lsls    r4, r3, #31
 8002136:   2000        movs    r0, #0
 8002138:   07d8        lsls    r0, r3, #31
 800213a:   2000        movs    r0, #0
 800213c:   0000        movs    r0, r0
 800213e:   0000        movs    r0, r0
 8002140:   4801        ldr r0, [pc, #4]    ; (0x8002148)
 8002142:   f000 bf23   b.w 0x8002f8c
 8002146:   bf00        nop
 8002148:   088c        lsrs    r4, r1, #2
 800214a:   2000        movs    r0, #0
 800214c:   b510        push    {r4, lr}
 800214e:   4c0b        ldr r4, [pc, #44]   ; (0x800217c)
 8002150:   490b        ldr r1, [pc, #44]   ; (0x8002180)
 8002152:   4620        mov r0, r4
 8002154:   f000 fe6c   bl  0x8002e30
 8002158:   4620        mov r0, r4
 800215a:   490a        ldr r1, [pc, #40]   ; (0x8002184)
 800215c:   f000 fe68   bl  0x8002e30
 8002160:   4620        mov r0, r4
 8002162:   4909        ldr r1, [pc, #36]   ; (0x8002188)
 8002164:   f000 fe64   bl  0x8002e30
 8002168:   4620        mov r0, r4
 800216a:   4908        ldr r1, [pc, #32]   ; (0x800218c)
 800216c:   f000 fe60   bl  0x8002e30
 8002170:   e8bd 4010   ldmia.w sp!, {r4, lr}
 8002174:   f44f 707a   mov.w   r0, #1000   ; 0x3e8
 8002178:   f000 bf80   b.w 0x800307c
 800217c:   088c        lsrs    r4, r1, #2
 800217e:   2000        movs    r0, #0
 8002180:   .word 0x08004e48        ldr r6, [pc, #288]  ; (0x80022a4)
 8002184:   .word 0x08004e86        ldr r6, [pc, #536]  ; (0x80023a0)
 8002188:   .word 0x08004ec9        ldr r6, [pc, #804]  ; (0x80024b0)
 800218c:   .word 0x08004ef5        ldr r6, [pc, #980]  ; (0x8002564)
 8002190:   4901        ldr r1, [pc, #4]    ; (0x8002198)
 8002192:   468d        mov sp, r1
 8002194:   4901        ldr r1, [pc, #4]    ; (0x800219c)
 8002196:   4708        bx  r1
 8002198:   5000        str r0, [r0, r0]
 800219a:   2000        movs    r0, #0
 800219c:   21a1        movs    r1, #161    ; 0xa1
 800219e:   0800        lsrs    r0, r0, #32
 80021a0:   b508        push    {r3, lr}
 80021a2:   4b12        ldr r3, [pc, #72]   ; (0x80021ec)
 80021a4:   4a12        ldr r2, [pc, #72]   ; (0x80021f0)
 80021a6:   6819        ldr r1, [r3, #0]
 80021a8:   4291        cmp r1, r2
 80021aa:   d001        beq.n   0x80021b0
 80021ac:   2300        movs    r3, #0
 80021ae:   e001        b.n 0x80021b4
 80021b0:   4b10        ldr r3, [pc, #64]   ; (0x80021f4)
 80021b2:   e007        b.n 0x80021c4
 80021b4:   4810        ldr r0, [pc, #64]   ; (0x80021f8)
 80021b6:   18d4        adds    r4, r2, r3
 80021b8:   4284        cmp r4, r0
 80021ba:   d2f9        bcs.n   0x80021b0
 80021bc:   58c8        ldr r0, [r1, r3]
 80021be:   50d0        str r0, [r2, r3]
 80021c0:   3304        adds    r3, #4
 80021c2:   e7f7        b.n 0x80021b4
 80021c4:   4a0d        ldr r2, [pc, #52]   ; (0x80021fc)
 80021c6:   4293        cmp r3, r2
 80021c8:   d203        bcs.n   0x80021d2
 80021ca:   2200        movs    r2, #0
 80021cc:   f843 2b04   str.w   r2, [r3], #4
 80021d0:   e7f8        b.n 0x80021c4
 80021d2:   f002 f8e5   bl  0x80043a0
 80021d6:   2000        movs    r0, #0
 80021d8:   4601        mov r1, r0
 80021da:   4602        mov r2, r0
 80021dc:   f000 fe34   bl  0x8002e48
 80021e0:   4b07        ldr r3, [pc, #28]   ; (0x8002200)
 80021e2:   b10b        cbz r3, 0x80021e8
 80021e4:   f002 f8cc   bl  0x8004380
 80021e8:   e7fe        b.n 0x80021e8
 80021ea:   bf00        nop
 80021ec:   5290        strh    r0, [r2, r2]
 80021ee:   0800        lsrs    r0, r0, #32
 80021f0:   0000        movs    r0, r0
 80021f2:   2000        movs    r0, #0
 80021f4:   07d8        lsls    r0, r3, #31
 80021f6:   2000        movs    r0, #0
 80021f8:   07d8        lsls    r0, r3, #31
 80021fa:   2000        movs    r0, #0
 80021fc:   0b00        lsrs    r0, r0, #12
 80021fe:   2000        movs    r0, #0
 8002200:   4381        bics    r1, r0
 8002202:   0800        lsrs    r0, r0, #32
 8002204:   e7fe        b.n 0x8002204
 8002206:   f000 bf47   b.w 0x8003098
 800220a:   0000        movs    r0, r0
 800220c:   4b0b        ldr r3, [pc, #44]   ; (0x800223c)
 800220e:   b510        push    {r4, lr}
 8002210:   6819        ldr r1, [r3, #0]
 8002212:   2209        movs    r2, #9
 8002214:   230a        movs    r3, #10
 8002216:   480a        ldr r0, [pc, #40]   ; (0x8002240)
 8002218:   f000 fdc8   bl  0x8002dac
 800221c:   4b09        ldr r3, [pc, #36]   ; (0x8002244)
 800221e:   2202        movs    r2, #2
 8002220:   6819        ldr r1, [r3, #0]
 8002222:   4809        ldr r0, [pc, #36]   ; (0x8002248)
 8002224:   2303        movs    r3, #3
 8002226:   f000 fdc1   bl  0x8002dac
 800222a:   e8bd 4010   ldmia.w sp!, {r4, lr}
 800222e:   4b07        ldr r3, [pc, #28]   ; (0x800224c)
 8002230:   4807        ldr r0, [pc, #28]   ; (0x8002250)
 8002232:   6819        ldr r1, [r3, #0]
 8002234:   221a        movs    r2, #26
 8002236:   231b        movs    r3, #27
 8002238:   f000 bdb8   b.w 0x8002dac
 800223c:   0114        lsls    r4, r2, #4
 800223e:   2000        movs    r0, #0
 8002240:   07f4        lsls    r4, r6, #31
 8002242:   2000        movs    r0, #0
 8002244:   0118        lsls    r0, r3, #4
 8002246:   2000        movs    r0, #0
 8002248:   080c        lsrs    r4, r1, #32
 800224a:   2000        movs    r0, #0
 800224c:   011c        lsls    r4, r3, #4
 800224e:   2000        movs    r0, #0
 8002250:   0824        lsrs    r4, r4, #32
 8002252:   2000        movs    r0, #0
 8002254:   b510        push    {r4, lr}
 8002256:   4604        mov r4, r0
 8002258:   f000 f9aa   bl  0x80025b0
 800225c:   4b03        ldr r3, [pc, #12]   ; (0x800226c)
 800225e:   4620        mov r0, r4
 8002260:   7819        ldrb    r1, [r3, #0]
 8002262:   e8bd 4010   ldmia.w sp!, {r4, lr}
 8002266:   f000 b93f   b.w 0x80024e8
 800226a:   bf00        nop
 800226c:   000c        movs    r4, r1
 800226e:   2000        movs    r0, #0
 8002270:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 8002272:   4604        mov r4, r0
 8002274:   6805        ldr r5, [r0, #0]
 8002276:   f000 fb13   bl  0x80028a0
 800227a:   6822        ldr r2, [r4, #0]
 800227c:   2300        movs    r3, #0
 800227e:   0151        lsls    r1, r2, #5
 8002280:   f101 4184   add.w   r1, r1, #1107296256 ; 0x42000000
 8002284:   600b        str r3, [r1, #0]
 8002286:   2180        movs    r1, #128    ; 0x80
 8002288:   6029        str r1, [r5, #0]
 800228a:   2101        movs    r1, #1
 800228c:   62a9        str r1, [r5, #40]   ; 0x28
 800228e:   612b        str r3, [r5, #16]
 8002290:   60eb        str r3, [r5, #12]
 8002292:   7963        ldrb    r3, [r4, #5]
 8002294:   6169        str r1, [r5, #20]
 8002296:   b113        cbz r3, 0x800229e
 8002298:   428b        cmp r3, r1
 800229a:   d003        beq.n   0x80022a4
 800229c:   e02b        b.n 0x80022f6
 800229e:   f44f 4300   mov.w   r3, #32768  ; 0x8000
 80022a2:   646b        str r3, [r5, #68]   ; 0x44
 80022a4:   f64f 73ff   movw    r3, #65535  ; 0xffff
 80022a8:   62d3        str r3, [r2, #44]   ; 0x2c
 80022aa:   2500        movs    r5, #0
 80022ac:   1c6e        adds    r6, r5, #1
 80022ae:   b2f7        uxtb    r7, r6
 80022b0:   4620        mov r0, r4
 80022b2:   4639        mov r1, r7
 80022b4:   f000 fafe   bl  0x80028b4
 80022b8:   b1d0        cbz r0, 0x80022f0
 80022ba:   6823        ldr r3, [r4, #0]
 80022bc:   f648 71ff   movw    r1, #36863  ; 0x8fff
 80022c0:   f103 0234   add.w   r2, r3, #52 ; 0x34
 80022c4:   f842 1025   str.w   r1, [r2, r5, lsl #2]
 80022c8:   3318        adds    r3, #24
 80022ca:   106d        asrs    r5, r5, #1
 80022cc:   f017 0f01   tst.w   r7, #1
 80022d0:   f853 2025   ldr.w   r2, [r3, r5, lsl #2]
 80022d4:   bf14        ite ne
 80022d6:   f06f 01ff   mvnne.w r1, #255    ; 0xff
 80022da:   f46f 417f   mvneq.w r1, #65280  ; 0xff00
 80022de:   ea01 0202   and.w   r2, r1, r2
 80022e2:   bf14        ite ne
 80022e4:   2168        movne   r1, #104    ; 0x68
 80022e6:   f44f 41d0   moveq.w r1, #26624  ; 0x6800
 80022ea:   430a        orrs    r2, r1
 80022ec:   f843 2025   str.w   r2, [r3, r5, lsl #2]
 80022f0:   2e04        cmp r6, #4
 80022f2:   4635        mov r5, r6
 80022f4:   d1da        bne.n   0x80022ac
 80022f6:   6821        ldr r1, [r4, #0]
 80022f8:   2201        movs    r2, #1
 80022fa:   014b        lsls    r3, r1, #5
 80022fc:   0149        lsls    r1, r1, #5
 80022fe:   f103 4384   add.w   r3, r3, #1107296256 ; 0x42000000
 8002302:   f101 4184   add.w   r1, r1, #1107296256 ; 0x42000000
 8002306:   f8c3 2280   str.w   r2, [r3, #640]  ; 0x280
 800230a:   600a        str r2, [r1, #0]
 800230c:   bdf8        pop {r3, r4, r5, r6, r7, pc}
 800230e:   0000        movs    r0, r0
 8002310:   b538        push    {r3, r4, r5, lr}
 8002312:   4b26        ldr r3, [pc, #152]  ; (0x80023ac)
 8002314:   4c26        ldr r4, [pc, #152]  ; (0x80023b0)
 8002316:   681a        ldr r2, [r3, #0]
 8002318:   2002        movs    r0, #2
 800231a:   f042 0210   orr.w   r2, r2, #16
 800231e:   601a        str r2, [r3, #0]
 8002320:   f000 f962   bl  0x80025e8
 8002324:   2500        movs    r5, #0
 8002326:   2000        movs    r0, #0
 8002328:   f000 fa02   bl  0x8002730
 800232c:   6065        str r5, [r4, #4]
 800232e:   6823        ldr r3, [r4, #0]
 8002330:   2018        movs    r0, #24
 8002332:   f423 2300   bic.w   r3, r3, #524288 ; 0x80000
 8002336:   6023        str r3, [r4, #0]
 8002338:   f000 fa07   bl  0x800274a
 800233c:   2010        movs    r0, #16
 800233e:   f000 fa04   bl  0x800274a
 8002342:   f000 f843   bl  0x80023cc
 8002346:   60a5        str r5, [r4, #8]
 8002348:   2010        movs    r0, #16
 800234a:   f000 f9f1   bl  0x8002730
 800234e:   2010        movs    r0, #16
 8002350:   f000 fa09   bl  0x8002766
 8002354:   2800        cmp r0, #0
 8002356:   d0fa        beq.n   0x800234e
 8002358:   f000 f839   bl  0x80023ce
 800235c:   4815        ldr r0, [pc, #84]   ; (0x80023b4)
 800235e:   f000 fa0f   bl  0x8002780
 8002362:   2018        movs    r0, #24
 8002364:   f000 f9e4   bl  0x8002730
 8002368:   2018        movs    r0, #24
 800236a:   f000 f9fc   bl  0x8002766
 800236e:   2800        cmp r0, #0
 8002370:   d0fa        beq.n   0x8002368
 8002372:   2002        movs    r0, #2
 8002374:   f000 f9cc   bl  0x8002710
 8002378:   2100        movs    r1, #0
 800237a:   480f        ldr r0, [pc, #60]   ; (0x80023b8)
 800237c:   f000 f99c   bl  0x80026b8
 8002380:   480e        ldr r0, [pc, #56]   ; (0x80023bc)
 8002382:   f000 fa63   bl  0x800284c
 8002386:   f000 f839   bl  0x80023fc
 800238a:   4b0d        ldr r3, [pc, #52]   ; (0x80023c0)
 800238c:   8818        ldrh    r0, [r3, #0]
 800238e:   f000 f8fd   bl  0x800258c
 8002392:   480c        ldr r0, [pc, #48]   ; (0x80023c4)
 8002394:   f000 f8fe   bl  0x8002594
 8002398:   480b        ldr r0, [pc, #44]   ; (0x80023c8)
 800239a:   f000 fa6d   bl  0x8002878
 800239e:   f000 f82f   bl  0x8002400
 80023a2:   f000 f857   bl  0x8002454
 80023a6:   f7ff ff2e   bl  0x8002206
 80023aa:   bd38        pop {r3, r4, r5, pc}
 80023ac:   2000        movs    r0, #0
 80023ae:   4002        ands    r2, r0
 80023b0:   1000        asrs    r0, r0, #32
 80023b2:   4002        ands    r2, r0
 80023b4:   0010        movs    r0, r2
 80023b6:   2000        movs    r0, #0
 80023b8:   2000        movs    r0, #0
 80023ba:   0800        lsrs    r0, r0, #32
 80023bc:   193f        adds    r7, r7, r4
 80023be:   0001        movs    r1, r0
 80023c0:   000e        movs    r6, r1
 80023c2:   2000        movs    r0, #0
 80023c4:   2255        movs    r2, #85 ; 0x55
 80023c6:   0800        lsrs    r0, r0, #32
 80023c8:   2271        movs    r2, #113    ; 0x71
 80023ca:   0800        lsrs    r0, r0, #32
 80023cc:   4770        bx  lr
 80023ce:   b508        push    {r3, lr}
 80023d0:   2000        movs    r0, #0
 80023d2:   4601        mov r1, r0
 80023d4:   f000 fa12   bl  0x80027fc
 80023d8:   2001        movs    r0, #1
 80023da:   f44f 6180   mov.w   r1, #1024   ; 0x400
 80023de:   f000 fa0d   bl  0x80027fc
 80023e2:   2100        movs    r1, #0
 80023e4:   2002        movs    r0, #2
 80023e6:   f000 fa09   bl  0x80027fc
 80023ea:   202d        movs    r0, #45 ; 0x2d
 80023ec:   f000 fa16   bl  0x800281c
 80023f0:   e8bd 4008   ldmia.w sp!, {r3, lr}
 80023f4:   2003        movs    r0, #3
 80023f6:   2100        movs    r1, #0
 80023f8:   f000 ba00   b.w 0x80027fc
 80023fc:   f000 b8fe   b.w 0x80025fc
 8002400:   b513        push    {r0, r1, r4, lr}
 8002402:   4c12        ldr r4, [pc, #72]   ; (0x800244c)
 8002404:   2203        movs    r2, #3
 8002406:   f8d4 00c0   ldr.w   r0, [r4, #192]  ; 0xc0
 800240a:   f894 10cc   ldrb.w  r1, [r4, #204]  ; 0xcc
 800240e:   f000 f90d   bl  0x800262c
 8002412:   f894 20cc   ldrb.w  r2, [r4, #204]  ; 0xcc
 8002416:   f44f 3180   mov.w   r1, #65536  ; 0x10000
 800241a:   fa01 f202   lsl.w   r2, r1, r2
 800241e:   f8d4 00c0   ldr.w   r0, [r4, #192]  ; 0xc0
 8002422:   6803        ldr r3, [r0, #0]
 8002424:   611a        str r2, [r3, #16]
 8002426:   2300        movs    r3, #0
 8002428:   9301        str r3, [sp, #4]
 800242a:   9b01        ldr r3, [sp, #4]
 800242c:   f5b3 7f00   cmp.w   r3, #512    ; 0x200
 8002430:   d202        bcs.n   0x8002438
 8002432:   9b01        ldr r3, [sp, #4]
 8002434:   3301        adds    r3, #1
 8002436:   e7f7        b.n 0x8002428
 8002438:   f894 10cc   ldrb.w  r1, [r4, #204]  ; 0xcc
 800243c:   2204        movs    r2, #4
 800243e:   f000 f8f5   bl  0x800262c
 8002442:   4803        ldr r0, [pc, #12]   ; (0x8002450)
 8002444:   f000 fda2   bl  0x8002f8c
 8002448:   b002        add sp, #8
 800244a:   bd10        pop {r4, pc}
 800244c:   4f18        ldr r7, [pc, #96]   ; (0x80024b0)
 800244e:   0800        lsrs    r0, r0, #32
 8002450:   088c        lsrs    r4, r1, #2
 8002452:   2000        movs    r0, #0
 8002454:   f000 b912   b.w 0x800267c
    ...
 8002460:   2001        movs    r0, #1
 8002462:   e007        b.n 0x8002474
 8002464:   2002        movs    r0, #2
 8002466:   e005        b.n 0x8002474
 8002468:   2003        movs    r0, #3
 800246a:   e003        b.n 0x8002474
 800246c:   2004        movs    r0, #4
 800246e:   e001        b.n 0x8002474
 8002470:   2005        movs    r0, #5
 8002472:   e7ff        b.n 0x8002474
 8002474:   4a0d        ldr r2, [pc, #52]   ; (0x80024ac)
 8002476:   2101        movs    r1, #1
 8002478:   6011        str r1, [r2, #0]
 800247a:   b672        cpsid   i
 800247c:   4a0c        ldr r2, [pc, #48]   ; (0x80024b0)
 800247e:   2100        movs    r1, #0
 8002480:   6011        str r1, [r2, #0]
 8002482:   4907        ldr r1, [pc, #28]   ; (0x80024a0)
 8002484:   b402        push    {r1}
 8002486:   4908        ldr r1, [pc, #32]   ; (0x80024a8)
 8002488:   b402        push    {r1}
 800248a:   b086        sub sp, #24
 800248c:   4905        ldr r1, [pc, #20]   ; (0x80024a4)
 800248e:   468e        mov lr, r1
 8002490:   4770        bx  lr
 8002492:   bf00        nop
 8002494:   f3af 8000   nop.w
 8002498:   f3af 8000   nop.w
 800249c:   f3af 8000   nop.w
 80024a0:   0000        movs    r0, r0
 80024a2:   6100        str r0, [r0, #16]
 80024a4:   fff9 ffff           ; <UNDEFINED> instruction: 0xfff9ffff
 80024a8:   2cc9        cmp r4, #201    ; 0xc9
 80024aa:   0800        lsrs    r0, r0, #32
 80024ac:   ed14 e000   ldc 0, cr14, [r4, #-0]
 80024b0:   e010        b.n 0x80024d4
 80024b2:   e000        b.n 0x80024b6
 80024b4:   f3af 8000   nop.w
 80024b8:   f3af 8000   nop.w
 80024bc:   f3af 8000   nop.w
 80024c0:   e7fe        b.n 0x80024c0
 80024c2:   b510        push    {r4, lr}
 80024c4:   4604        mov r4, r0
 80024c6:   7900        ldrb    r0, [r0, #4]
 80024c8:   f000 f966   bl  0x8002798
 80024cc:   7920        ldrb    r0, [r4, #4]
 80024ce:   e8bd 4010   ldmia.w sp!, {r4, lr}
 80024d2:   f000 b979   b.w 0x80027c8
 80024d6:   6803        ldr r3, [r0, #0]
 80024d8:   689a        ldr r2, [r3, #8]
 80024da:   f422 2260   bic.w   r2, r2, #917504 ; 0xe0000
 80024de:   f442 1280   orr.w   r2, r2, #1048576    ; 0x100000
 80024e2:   4311        orrs    r1, r2
 80024e4:   6099        str r1, [r3, #8]
 80024e6:   4770        bx  lr
 80024e8:   2300        movs    r3, #0
 80024ea:   b570        push    {r4, r5, r6, lr}
 80024ec:   461a        mov r2, r3
 80024ee:   461c        mov r4, r3
 80024f0:   2b07        cmp r3, #7
 80024f2:   ea4f 0543   mov.w   r5, r3, lsl #1
 80024f6:   dc03        bgt.n   0x8002500
 80024f8:   18ee        adds    r6, r5, r3
 80024fa:   fa01 f606   lsl.w   r6, r1, r6
 80024fe:   4334        orrs    r4, r6
 8002500:   441d        add r5, r3
 8002502:   fa01 f505   lsl.w   r5, r1, r5
 8002506:   3301        adds    r3, #1
 8002508:   2b0a        cmp r3, #10
 800250a:   ea42 0205   orr.w   r2, r2, r5
 800250e:   d1ef        bne.n   0x80024f0
 8002510:   6803        ldr r3, [r0, #0]
 8002512:   60dc        str r4, [r3, #12]
 8002514:   611a        str r2, [r3, #16]
 8002516:   bd70        pop {r4, r5, r6, pc}
 8002518:   b538        push    {r3, r4, r5, lr}
 800251a:   4d12        ldr r5, [pc, #72]   ; (0x8002564)
 800251c:   682a        ldr r2, [r5, #0]
 800251e:   6813        ldr r3, [r2, #0]
 8002520:   681c        ldr r4, [r3, #0]
 8002522:   07a1        lsls    r1, r4, #30
 8002524:   d506        bpl.n   0x8002534
 8002526:   6819        ldr r1, [r3, #0]
 8002528:   f021 0102   bic.w   r1, r1, #2
 800252c:   6019        str r1, [r3, #0]
 800252e:   6893        ldr r3, [r2, #8]
 8002530:   b103        cbz r3, 0x8002534
 8002532:   4798        blx r3
 8002534:   0762        lsls    r2, r4, #29
 8002536:   d508        bpl.n   0x800254a
 8002538:   682b        ldr r3, [r5, #0]
 800253a:   681a        ldr r2, [r3, #0]
 800253c:   691b        ldr r3, [r3, #16]
 800253e:   6811        ldr r1, [r2, #0]
 8002540:   f021 0104   bic.w   r1, r1, #4
 8002544:   6011        str r1, [r2, #0]
 8002546:   b103        cbz r3, 0x800254a
 8002548:   4798        blx r3
 800254a:   07e3        lsls    r3, r4, #31
 800254c:   d508        bpl.n   0x8002560
 800254e:   682b        ldr r3, [r5, #0]
 8002550:   681a        ldr r2, [r3, #0]
 8002552:   68db        ldr r3, [r3, #12]
 8002554:   6811        ldr r1, [r2, #0]
 8002556:   f021 0101   bic.w   r1, r1, #1
 800255a:   6011        str r1, [r2, #0]
 800255c:   b103        cbz r3, 0x8002560
 800255e:   4798        blx r3
 8002560:   bd38        pop {r3, r4, r5, pc}
 8002562:   bf00        nop
 8002564:   003c        movs    r4, r7
 8002566:   2000        movs    r0, #0
 8002568:   6803        ldr r3, [r0, #0]
 800256a:   2201        movs    r2, #1
 800256c:   015b        lsls    r3, r3, #5
 800256e:   f103 4384   add.w   r3, r3, #1107296256 ; 0x42000000
 8002572:   f503 7386   add.w   r3, r3, #268    ; 0x10c
 8002576:   1f19        subs    r1, r3, #4
 8002578:   601a        str r2, [r3, #0]
 800257a:   6818        ldr r0, [r3, #0]
 800257c:   2800        cmp r0, #0
 800257e:   d1fc        bne.n   0x800257a
 8002580:   f843 2c04   str.w   r2, [r3, #-4]
 8002584:   680b        ldr r3, [r1, #0]
 8002586:   2b00        cmp r3, #0
 8002588:   d1fc        bne.n   0x8002584
 800258a:   4770        bx  lr
 800258c:   4601        mov r1, r0
 800258e:   2004        movs    r0, #4
 8002590:   f000 b934   b.w 0x80027fc
 8002594:   4b04        ldr r3, [pc, #16]   ; (0x80025a8)
 8002596:   b510        push    {r4, lr}
 8002598:   4604        mov r4, r0
 800259a:   6818        ldr r0, [r3, #0]
 800259c:   47a0        blx r4
 800259e:   4b03        ldr r3, [pc, #12]   ; (0x80025ac)
 80025a0:   6818        ldr r0, [r3, #0]
 80025a2:   47a0        blx r4
 80025a4:   bd10        pop {r4, pc}
 80025a6:   bf00        nop
 80025a8:   003c        movs    r4, r7
 80025aa:   2000        movs    r0, #0
 80025ac:   0038        movs    r0, r7
 80025ae:   2000        movs    r0, #0
 80025b0:   b510        push    {r4, lr}
 80025b2:   4604        mov r4, r0
 80025b4:   f7ff ff85   bl  0x80024c2
 80025b8:   4620        mov r0, r4
 80025ba:   f44f 2160   mov.w   r1, #917504 ; 0xe0000
 80025be:   f7ff ff8a   bl  0x80024d6
 80025c2:   6823        ldr r3, [r4, #0]
 80025c4:   2101        movs    r1, #1
 80025c6:   f103 4340   add.w   r3, r3, #3221225472 ; 0xc0000000
 80025ca:   3308        adds    r3, #8
 80025cc:   015a        lsls    r2, r3, #5
 80025ce:   015b        lsls    r3, r3, #5
 80025d0:   f102 4284   add.w   r2, r2, #1107296256 ; 0x42000000
 80025d4:   f103 4384   add.w   r3, r3, #1107296256 ; 0x42000000
 80025d8:   6511        str r1, [r2, #80]   ; 0x50
 80025da:   4620        mov r0, r4
 80025dc:   6019        str r1, [r3, #0]
 80025de:   e8bd 4010   ldmia.w sp!, {r4, lr}
 80025e2:   f7ff bfc1   b.w 0x8002568
 80025e6:   0000        movs    r0, r0
 80025e8:   4b03        ldr r3, [pc, #12]   ; (0x80025f8)
 80025ea:   681a        ldr r2, [r3, #0]
 80025ec:   f022 0207   bic.w   r2, r2, #7
 80025f0:   4310        orrs    r0, r2
 80025f2:   6018        str r0, [r3, #0]
 80025f4:   4770        bx  lr
 80025f6:   bf00        nop
 80025f8:   2000        movs    r0, #0
 80025fa:   4002        ands    r2, r0
 80025fc:   b508        push    {r3, lr}
 80025fe:   4807        ldr r0, [pc, #28]   ; (0x800261c)
 8002600:   f000 fd55   bl  0x80030ae
 8002604:   4806        ldr r0, [pc, #24]   ; (0x8002620)
 8002606:   f000 fd52   bl  0x80030ae
 800260a:   4806        ldr r0, [pc, #24]   ; (0x8002624)
 800260c:   f000 fd4f   bl  0x80030ae
 8002610:   e8bd 4008   ldmia.w sp!, {r3, lr}
 8002614:   4804        ldr r0, [pc, #16]   ; (0x8002628)
 8002616:   f000 bd4a   b.w 0x80030ae
 800261a:   bf00        nop
 800261c:   0040        lsls    r0, r0, #1
 800261e:   2000        movs    r0, #0
 8002620:   0048        lsls    r0, r1, #1
 8002622:   2000        movs    r0, #0
 8002624:   0050        lsls    r0, r2, #1
 8002626:   2000        movs    r0, #0
 8002628:   0058        lsls    r0, r3, #1
 800262a:   2000        movs    r0, #0
 800262c:   b570        push    {r4, r5, r6, lr}
 800262e:   f001 0407   and.w   r4, r1, #7
 8002632:   00a4        lsls    r4, r4, #2
 8002634:   250f        movs    r5, #15
 8002636:   40a5        lsls    r5, r4
 8002638:   6803        ldr r3, [r0, #0]
 800263a:   08c8        lsrs    r0, r1, #3
 800263c:   f853 6020   ldr.w   r6, [r3, r0, lsl #2]
 8002640:   2a09        cmp r2, #9
 8002642:   ea26 0505   bic.w   r5, r6, r5
 8002646:   bf14        ite ne
 8002648:   4616        movne   r6, r2
 800264a:   2608        moveq   r6, #8
 800264c:   fa06 f404   lsl.w   r4, r6, r4
 8002650:   2a08        cmp r2, #8
 8002652:   ea44 0405   orr.w   r4, r4, r5
 8002656:   f843 4020   str.w   r4, [r3, r0, lsl #2]
 800265a:   d106        bne.n   0x800266a
 800265c:   2001        movs    r0, #1
 800265e:   fa00 f101   lsl.w   r1, r0, r1
 8002662:   68da        ldr r2, [r3, #12]
 8002664:   ea22 0101   bic.w   r1, r2, r1
 8002668:   e006        b.n 0x8002678
 800266a:   2a09        cmp r2, #9
 800266c:   d105        bne.n   0x800267a
 800266e:   2001        movs    r0, #1
 8002670:   fa00 f101   lsl.w   r1, r0, r1
 8002674:   68da        ldr r2, [r3, #12]
 8002676:   4311        orrs    r1, r2
 8002678:   60d9        str r1, [r3, #12]
 800267a:   bd70        pop {r4, r5, r6, pc}
 800267c:   b508        push    {r3, lr}
 800267e:   2003        movs    r0, #3
 8002680:   f000 f88a   bl  0x8002798
 8002684:   e8bd 4008   ldmia.w sp!, {r3, lr}
 8002688:   2003        movs    r0, #3
 800268a:   f000 b89d   b.w 0x80027c8
 800268e:   0000        movs    r0, r0
 8002690:   2800        cmp r0, #0
 8002692:   ea4f 1101   mov.w   r1, r1, lsl #4
 8002696:   da05        bge.n   0x80026a4
 8002698:   4b06        ldr r3, [pc, #24]   ; (0x80026b4)
 800269a:   f000 000f   and.w   r0, r0, #15
 800269e:   b2c9        uxtb    r1, r1
 80026a0:   5419        strb    r1, [r3, r0]
 80026a2:   4770        bx  lr
 80026a4:   f100 4060   add.w   r0, r0, #3758096384 ; 0xe0000000
 80026a8:   b2c9        uxtb    r1, r1
 80026aa:   f500 4061   add.w   r0, r0, #57600  ; 0xe100
 80026ae:   f880 1300   strb.w  r1, [r0, #768]  ; 0x300
 80026b2:   4770        bx  lr
 80026b4:   ed14 e000   ldc 0, cr14, [r4, #-0]
 80026b8:   f021 4160   bic.w   r1, r1, #3758096384 ; 0xe0000000
 80026bc:   b538        push    {r3, r4, r5, lr}
 80026be:   f021 017f   bic.w   r1, r1, #127    ; 0x7f
 80026c2:   4b08        ldr r3, [pc, #32]   ; (0x80026e4)
 80026c4:   4308        orrs    r0, r1
 80026c6:   6098        str r0, [r3, #8]
 80026c8:   2400        movs    r4, #0
 80026ca:   461d        mov r5, r3
 80026cc:   b260        sxtb    r0, r4
 80026ce:   210f        movs    r1, #15
 80026d0:   3401        adds    r4, #1
 80026d2:   f7ff ffdd   bl  0x8002690
 80026d6:   2c2b        cmp r4, #43 ; 0x2b
 80026d8:   d1f8        bne.n   0x80026cc
 80026da:   23f0        movs    r3, #240    ; 0xf0
 80026dc:   f885 3023   strb.w  r3, [r5, #35]   ; 0x23
 80026e0:   bd38        pop {r3, r4, r5, pc}
 80026e2:   bf00        nop
 80026e4:   ed00 e000   stc 0, cr14, [r0, #-0]
 80026e8:   4a04        ldr r2, [pc, #16]   ; (0x80026fc)
 80026ea:   4b05        ldr r3, [pc, #20]   ; (0x8002700)
 80026ec:   68d1        ldr r1, [r2, #12]
 80026ee:   f401 7140   and.w   r1, r1, #768    ; 0x300
 80026f2:   430b        orrs    r3, r1
 80026f4:   60d3        str r3, [r2, #12]
 80026f6:   f3bf 8f4f   dsb sy
 80026fa:   e7fe        b.n 0x80026fa
 80026fc:   ed00 e000   stc 0, cr14, [r0, #-0]
 8002700:   0004        movs    r4, r0
 8002702:   05fa        lsls    r2, r7, #23
 8002704:   4b01        ldr r3, [pc, #4]    ; (0x800270c)
 8002706:   f813 0010   ldrb.w  r0, [r3, r0, lsl #1]
 800270a:   4770        bx  lr
 800270c:   514c        str r4, [r1, r5]
 800270e:   0800        lsrs    r0, r0, #32
 8002710:   4b06        ldr r3, [pc, #24]   ; (0x800272c)
 8002712:   685a        ldr r2, [r3, #4]
 8002714:   f022 0203   bic.w   r2, r2, #3
 8002718:   4302        orrs    r2, r0
 800271a:   605a        str r2, [r3, #4]
 800271c:   0080        lsls    r0, r0, #2
 800271e:   685a        ldr r2, [r3, #4]
 8002720:   f002 020c   and.w   r2, r2, #12
 8002724:   4282        cmp r2, r0
 8002726:   d1fa        bne.n   0x800271e
 8002728:   4770        bx  lr
 800272a:   bf00        nop
 800272c:   1000        asrs    r0, r0, #32
 800272e:   4002        ands    r2, r0
 8002730:   0a03        lsrs    r3, r0, #8
 8002732:   2101        movs    r1, #1
 8002734:   b2c0        uxtb    r0, r0
 8002736:   fa01 f000   lsl.w   r0, r1, r0
 800273a:   f103 4380   add.w   r3, r3, #1073741824 ; 0x40000000
 800273e:   f503 3304   add.w   r3, r3, #135168 ; 0x21000
 8002742:   681a        ldr r2, [r3, #0]
 8002744:   4310        orrs    r0, r2
 8002746:   6018        str r0, [r3, #0]
 8002748:   4770        bx  lr
 800274a:   0a03        lsrs    r3, r0, #8
 800274c:   2101        movs    r1, #1
 800274e:   b2c0        uxtb    r0, r0
 8002750:   fa01 f000   lsl.w   r0, r1, r0
 8002754:   f103 4380   add.w   r3, r3, #1073741824 ; 0x40000000
 8002758:   f503 3304   add.w   r3, r3, #135168 ; 0x21000
 800275c:   681a        ldr r2, [r3, #0]
 800275e:   ea22 0000   bic.w   r0, r2, r0
 8002762:   6018        str r0, [r3, #0]
 8002764:   4770        bx  lr
 8002766:   0a03        lsrs    r3, r0, #8
 8002768:   2202        movs    r2, #2
 800276a:   b2c0        uxtb    r0, r0
 800276c:   fa02 f000   lsl.w   r0, r2, r0
 8002770:   f103 4380   add.w   r3, r3, #1073741824 ; 0x40000000
 8002774:   f503 3304   add.w   r3, r3, #135168 ; 0x21000
 8002778:   681b        ldr r3, [r3, #0]
 800277a:   4018        ands    r0, r3
 800277c:   4770        bx  lr
 800277e:   0000        movs    r0, r0
 8002780:   4b04        ldr r3, [pc, #16]   ; (0x8002794)
 8002782:   c805        ldmia   r0, {r0, r2}
 8002784:   6859        ldr r1, [r3, #4]
 8002786:   6812        ldr r2, [r2, #0]
 8002788:   f421 1174   bic.w   r1, r1, #3997696    ; 0x3d0000
 800278c:   4302        orrs    r2, r0
 800278e:   430a        orrs    r2, r1
 8002790:   605a        str r2, [r3, #4]
 8002792:   4770        bx  lr
 8002794:   1000        asrs    r0, r0, #32
 8002796:   4002        ands    r2, r0
 8002798:   b510        push    {r4, lr}
 800279a:   4604        mov r4, r0
 800279c:   f7ff ffb2   bl  0x8002704
 80027a0:   4b07        ldr r3, [pc, #28]   ; (0x80027c0)
 80027a2:   f853 2020   ldr.w   r2, [r3, r0, lsl #2]
 80027a6:   4b07        ldr r3, [pc, #28]   ; (0x80027c4)
 80027a8:   eb03 0444   add.w   r4, r3, r4, lsl #1
 80027ac:   7863        ldrb    r3, [r4, #1]
 80027ae:   eb03 03c2   add.w   r3, r3, r2, lsl #3
 80027b2:   009b        lsls    r3, r3, #2
 80027b4:   f103 4384   add.w   r3, r3, #1107296256 ; 0x42000000
 80027b8:   2201        movs    r2, #1
 80027ba:   601a        str r2, [r3, #0]
 80027bc:   bd10        pop {r4, pc}
 80027be:   bf00        nop
 80027c0:   0060        lsls    r0, r4, #1
 80027c2:   2000        movs    r0, #0
 80027c4:   514c        str r4, [r1, r5]
 80027c6:   0800        lsrs    r0, r0, #32
 80027c8:   b510        push    {r4, lr}
 80027ca:   4604        mov r4, r0
 80027cc:   f7ff ff9a   bl  0x8002704
 80027d0:   4b08        ldr r3, [pc, #32]   ; (0x80027f4)
 80027d2:   f853 2020   ldr.w   r2, [r3, r0, lsl #2]
 80027d6:   4b08        ldr r3, [pc, #32]   ; (0x80027f8)
 80027d8:   eb03 0444   add.w   r4, r3, r4, lsl #1
 80027dc:   7863        ldrb    r3, [r4, #1]
 80027de:   eb03 03c2   add.w   r3, r3, r2, lsl #3
 80027e2:   009b        lsls    r3, r3, #2
 80027e4:   f103 4384   add.w   r3, r3, #1107296256 ; 0x42000000
 80027e8:   2201        movs    r2, #1
 80027ea:   601a        str r2, [r3, #0]
 80027ec:   2200        movs    r2, #0
 80027ee:   601a        str r2, [r3, #0]
 80027f0:   bd10        pop {r4, pc}
 80027f2:   bf00        nop
 80027f4:   006c        lsls    r4, r5, #1
 80027f6:   2000        movs    r0, #0
 80027f8:   514c        str r4, [r1, r5]
 80027fa:   0800        lsrs    r0, r0, #32
 80027fc:   b510        push    {r4, lr}
 80027fe:   4b05        ldr r3, [pc, #20]   ; (0x8002814)
 8002800:   4c05        ldr r4, [pc, #20]   ; (0x8002818)
 8002802:   685a        ldr r2, [r3, #4]
 8002804:   f854 0020   ldr.w   r0, [r4, r0, lsl #2]
 8002808:   ea22 0200   bic.w   r2, r2, r0
 800280c:   4311        orrs    r1, r2
 800280e:   6059        str r1, [r3, #4]
 8002810:   bd10        pop {r4, pc}
 8002812:   bf00        nop
 8002814:   1000        asrs    r0, r0, #32
 8002816:   4002        ands    r2, r0
 8002818:   51a8        str r0, [r5, r6]
 800281a:   0800        lsrs    r0, r0, #32
 800281c:   b510        push    {r4, lr}
 800281e:   4604        mov r4, r0
 8002820:   f7ff ff70   bl  0x8002704
 8002824:   4b07        ldr r3, [pc, #28]   ; (0x8002844)
 8002826:   f853 2020   ldr.w   r2, [r3, r0, lsl #2]
 800282a:   4b07        ldr r3, [pc, #28]   ; (0x8002848)
 800282c:   eb03 0444   add.w   r4, r3, r4, lsl #1
 8002830:   7863        ldrb    r3, [r4, #1]
 8002832:   eb03 03c2   add.w   r3, r3, r2, lsl #3
 8002836:   009b        lsls    r3, r3, #2
 8002838:   f103 4384   add.w   r3, r3, #1107296256 ; 0x42000000
 800283c:   2200        movs    r2, #0
 800283e:   601a        str r2, [r3, #0]
 8002840:   bd10        pop {r4, pc}
 8002842:   bf00        nop
 8002844:   0074        lsls    r4, r6, #1
 8002846:   2000        movs    r0, #0
 8002848:   514c        str r4, [r1, r5]
 800284a:   0800        lsrs    r0, r0, #32
 800284c:   4b02        ldr r3, [pc, #8]    ; (0x8002858)
 800284e:   2207        movs    r2, #7
 8002850:   6058        str r0, [r3, #4]
 8002852:   601a        str r2, [r3, #0]
 8002854:   4770        bx  lr
 8002856:   bf00        nop
 8002858:   e010        b.n 0x800287c
 800285a:   e000        b.n 0x800285e
 800285c:   b508        push    {r3, lr}
 800285e:   4b04        ldr r3, [pc, #16]   ; (0x8002870)
 8002860:   681a        ldr r2, [r3, #0]
 8002862:   3201        adds    r2, #1
 8002864:   601a        str r2, [r3, #0]
 8002866:   4b03        ldr r3, [pc, #12]   ; (0x8002874)
 8002868:   681b        ldr r3, [r3, #0]
 800286a:   b103        cbz r3, 0x800286e
 800286c:   4798        blx r3
 800286e:   bd08        pop {r3, pc}
 8002870:   0ac0        lsrs    r0, r0, #11
 8002872:   2000        movs    r0, #0
 8002874:   083c        lsrs    r4, r7, #32
 8002876:   2000        movs    r0, #0
 8002878:   b510        push    {r4, lr}
 800287a:   4604        mov r4, r0
 800287c:   4804        ldr r0, [pc, #16]   ; (0x8002890)
 800287e:   47a0        blx r4
 8002880:   4804        ldr r0, [pc, #16]   ; (0x8002894)
 8002882:   47a0        blx r4
 8002884:   4804        ldr r0, [pc, #16]   ; (0x8002898)
 8002886:   47a0        blx r4
 8002888:   4804        ldr r0, [pc, #16]   ; (0x800289c)
 800288a:   47a0        blx r4
 800288c:   bd10        pop {r4, pc}
 800288e:   bf00        nop
 8002890:   00c8        lsls    r0, r1, #3
 8002892:   2000        movs    r0, #0
 8002894:   00f0        lsls    r0, r6, #3
 8002896:   2000        movs    r0, #0
 8002898:   0080        lsls    r0, r0, #2
 800289a:   2000        movs    r0, #0
 800289c:   00a4        lsls    r4, r4, #2
 800289e:   2000        movs    r0, #0
 80028a0:   b510        push    {r4, lr}
 80028a2:   4604        mov r4, r0
 80028a4:   7900        ldrb    r0, [r0, #4]
 80028a6:   f7ff ff77   bl  0x8002798
 80028aa:   7920        ldrb    r0, [r4, #4]
 80028ac:   e8bd 4010   ldmia.w sp!, {r4, lr}
 80028b0:   f7ff bf8a   b.w 0x80027c8
 80028b4:   7903        ldrb    r3, [r0, #4]
 80028b6:   2b1e        cmp r3, #30
 80028b8:   d910        bls.n   0x80028dc
 80028ba:   2b21        cmp r3, #33 ; 0x21
 80028bc:   d00e        beq.n   0x80028dc
 80028be:   2b20        cmp r3, #32
 80028c0:   d90e        bls.n   0x80028e0
 80028c2:   2b22        cmp r3, #34 ; 0x22
 80028c4:   d001        beq.n   0x80028ca
 80028c6:   2b25        cmp r3, #37 ; 0x25
 80028c8:   d104        bne.n   0x80028d4
 80028ca:   2902        cmp r1, #2
 80028cc:   bf8c        ite hi
 80028ce:   2000        movhi   r0, #0
 80028d0:   2001        movls   r0, #1
 80028d2:   4770        bx  lr
 80028d4:   1e4b        subs    r3, r1, #1
 80028d6:   4258        negs    r0, r3
 80028d8:   4158        adcs    r0, r3
 80028da:   4770        bx  lr
 80028dc:   2001        movs    r0, #1
 80028de:   4770        bx  lr
 80028e0:   2000        movs    r0, #0
 80028e2:   4770        bx  lr
 80028e4:   b510        push    {r4, lr}
 80028e6:   4b07        ldr r3, [pc, #28]   ; (0x8002904)
 80028e8:   681c        ldr r4, [r3, #0]
 80028ea:   68e1        ldr r1, [r4, #12]
 80028ec:   6922        ldr r2, [r4, #16]
 80028ee:   400a        ands    r2, r1
 80028f0:   0612        lsls    r2, r2, #24
 80028f2:   d506        bpl.n   0x8002902
 80028f4:   6a5b        ldr r3, [r3, #36]   ; 0x24
 80028f6:   b123        cbz r3, 0x8002902
 80028f8:   4798        blx r3
 80028fa:   6923        ldr r3, [r4, #16]
 80028fc:   f023 0380   bic.w   r3, r3, #128    ; 0x80
 8002900:   6123        str r3, [r4, #16]
 8002902:   bd10        pop {r4, pc}
 8002904:   00c8        lsls    r0, r1, #3
 8002906:   2000        movs    r0, #0
 8002908:   b510        push    {r4, lr}
 800290a:   4b07        ldr r3, [pc, #28]   ; (0x8002928)
 800290c:   681c        ldr r4, [r3, #0]
 800290e:   68e1        ldr r1, [r4, #12]
 8002910:   6922        ldr r2, [r4, #16]
 8002912:   400a        ands    r2, r1
 8002914:   07d2        lsls    r2, r2, #31
 8002916:   d506        bpl.n   0x8002926
 8002918:   689b        ldr r3, [r3, #8]
 800291a:   b123        cbz r3, 0x8002926
 800291c:   4798        blx r3
 800291e:   6923        ldr r3, [r4, #16]
 8002920:   f023 0301   bic.w   r3, r3, #1
 8002924:   6123        str r3, [r4, #16]
 8002926:   bd10        pop {r4, pc}
 8002928:   00c8        lsls    r0, r1, #3
 800292a:   2000        movs    r0, #0
 800292c:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 800292e:   4f0c        ldr r7, [pc, #48]   ; (0x8002960)
 8002930:   683d        ldr r5, [r7, #0]
 8002932:   68eb        ldr r3, [r5, #12]
 8002934:   692e        ldr r6, [r5, #16]
 8002936:   401e        ands    r6, r3
 8002938:   f016 0440   ands.w  r4, r6, #64 ; 0x40
 800293c:   d003        beq.n   0x8002946
 800293e:   6a3c        ldr r4, [r7, #32]
 8002940:   b10c        cbz r4, 0x8002946
 8002942:   47a0        blx r4
 8002944:   2440        movs    r4, #64 ; 0x40
 8002946:   06b3        lsls    r3, r6, #26
 8002948:   d504        bpl.n   0x8002954
 800294a:   69fb        ldr r3, [r7, #28]
 800294c:   b113        cbz r3, 0x8002954
 800294e:   4798        blx r3
 8002950:   f044 0420   orr.w   r4, r4, #32
 8002954:   692b        ldr r3, [r5, #16]
 8002956:   ea23 0404   bic.w   r4, r3, r4
 800295a:   612c        str r4, [r5, #16]
 800295c:   bdf8        pop {r3, r4, r5, r6, r7, pc}
 800295e:   bf00        nop
 8002960:   00c8        lsls    r0, r1, #3
 8002962:   2000        movs    r0, #0
 8002964:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 8002966:   4f13        ldr r7, [pc, #76]   ; (0x80029b4)
 8002968:   683e        ldr r6, [r7, #0]
 800296a:   68f3        ldr r3, [r6, #12]
 800296c:   6935        ldr r5, [r6, #16]
 800296e:   401d        ands    r5, r3
 8002970:   f015 0410   ands.w  r4, r5, #16
 8002974:   d003        beq.n   0x800297e
 8002976:   69bc        ldr r4, [r7, #24]
 8002978:   b10c        cbz r4, 0x800297e
 800297a:   47a0        blx r4
 800297c:   2410        movs    r4, #16
 800297e:   0729        lsls    r1, r5, #28
 8002980:   d504        bpl.n   0x800298c
 8002982:   697b        ldr r3, [r7, #20]
 8002984:   b113        cbz r3, 0x800298c
 8002986:   4798        blx r3
 8002988:   f044 0408   orr.w   r4, r4, #8
 800298c:   076a        lsls    r2, r5, #29
 800298e:   d504        bpl.n   0x800299a
 8002990:   693b        ldr r3, [r7, #16]
 8002992:   b113        cbz r3, 0x800299a
 8002994:   4798        blx r3
 8002996:   f044 0404   orr.w   r4, r4, #4
 800299a:   07ab        lsls    r3, r5, #30
 800299c:   d504        bpl.n   0x80029a8
 800299e:   68fb        ldr r3, [r7, #12]
 80029a0:   b113        cbz r3, 0x80029a8
 80029a2:   4798        blx r3
 80029a4:   f044 0402   orr.w   r4, r4, #2
 80029a8:   6933        ldr r3, [r6, #16]
 80029aa:   ea23 0404   bic.w   r4, r3, r4
 80029ae:   6134        str r4, [r6, #16]
 80029b0:   bdf8        pop {r3, r4, r5, r6, r7, pc}
 80029b2:   bf00        nop
 80029b4:   00c8        lsls    r0, r1, #3
 80029b6:   2000        movs    r0, #0
 80029b8:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 80029ba:   4e1a        ldr r6, [pc, #104]  ; (0x8002a24)
 80029bc:   6837        ldr r7, [r6, #0]
 80029be:   68fb        ldr r3, [r7, #12]
 80029c0:   693d        ldr r5, [r7, #16]
 80029c2:   401d        ands    r5, r3
 80029c4:   f015 0440   ands.w  r4, r5, #64 ; 0x40
 80029c8:   d003        beq.n   0x80029d2
 80029ca:   6a34        ldr r4, [r6, #32]
 80029cc:   b10c        cbz r4, 0x80029d2
 80029ce:   47a0        blx r4
 80029d0:   2440        movs    r4, #64 ; 0x40
 80029d2:   06eb        lsls    r3, r5, #27
 80029d4:   d504        bpl.n   0x80029e0
 80029d6:   69b3        ldr r3, [r6, #24]
 80029d8:   b113        cbz r3, 0x80029e0
 80029da:   4798        blx r3
 80029dc:   f044 0410   orr.w   r4, r4, #16
 80029e0:   0728        lsls    r0, r5, #28
 80029e2:   d504        bpl.n   0x80029ee
 80029e4:   6973        ldr r3, [r6, #20]
 80029e6:   b113        cbz r3, 0x80029ee
 80029e8:   4798        blx r3
 80029ea:   f044 0408   orr.w   r4, r4, #8
 80029ee:   0769        lsls    r1, r5, #29
 80029f0:   d504        bpl.n   0x80029fc
 80029f2:   6933        ldr r3, [r6, #16]
 80029f4:   b113        cbz r3, 0x80029fc
 80029f6:   4798        blx r3
 80029f8:   f044 0404   orr.w   r4, r4, #4
 80029fc:   07aa        lsls    r2, r5, #30
 80029fe:   d504        bpl.n   0x8002a0a
 8002a00:   68f3        ldr r3, [r6, #12]
 8002a02:   b113        cbz r3, 0x8002a0a
 8002a04:   4798        blx r3
 8002a06:   f044 0402   orr.w   r4, r4, #2
 8002a0a:   07eb        lsls    r3, r5, #31
 8002a0c:   d504        bpl.n   0x8002a18
 8002a0e:   68b3        ldr r3, [r6, #8]
 8002a10:   b113        cbz r3, 0x8002a18
 8002a12:   4798        blx r3
 8002a14:   f044 0401   orr.w   r4, r4, #1
 8002a18:   693b        ldr r3, [r7, #16]
 8002a1a:   ea23 0404   bic.w   r4, r3, r4
 8002a1e:   613c        str r4, [r7, #16]
 8002a20:   bdf8        pop {r3, r4, r5, r6, r7, pc}
 8002a22:   bf00        nop
 8002a24:   00f0        lsls    r0, r6, #3
 8002a26:   2000        movs    r0, #0
 8002a28:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 8002a2a:   4e1a        ldr r6, [pc, #104]  ; (0x8002a94)
 8002a2c:   6837        ldr r7, [r6, #0]
 8002a2e:   68fb        ldr r3, [r7, #12]
 8002a30:   693d        ldr r5, [r7, #16]
 8002a32:   401d        ands    r5, r3
 8002a34:   f015 0440   ands.w  r4, r5, #64 ; 0x40
 8002a38:   d003        beq.n   0x8002a42
 8002a3a:   6a34        ldr r4, [r6, #32]
 8002a3c:   b10c        cbz r4, 0x8002a42
 8002a3e:   47a0        blx r4
 8002a40:   2440        movs    r4, #64 ; 0x40
 8002a42:   06eb        lsls    r3, r5, #27
 8002a44:   d504        bpl.n   0x8002a50
 8002a46:   69b3        ldr r3, [r6, #24]
 8002a48:   b113        cbz r3, 0x8002a50
 8002a4a:   4798        blx r3
 8002a4c:   f044 0410   orr.w   r4, r4, #16
 8002a50:   0728        lsls    r0, r5, #28
 8002a52:   d504        bpl.n   0x8002a5e
 8002a54:   6973        ldr r3, [r6, #20]
 8002a56:   b113        cbz r3, 0x8002a5e
 8002a58:   4798        blx r3
 8002a5a:   f044 0408   orr.w   r4, r4, #8
 8002a5e:   0769        lsls    r1, r5, #29
 8002a60:   d504        bpl.n   0x8002a6c
 8002a62:   6933        ldr r3, [r6, #16]
 8002a64:   b113        cbz r3, 0x8002a6c
 8002a66:   4798        blx r3
 8002a68:   f044 0404   orr.w   r4, r4, #4
 8002a6c:   07aa        lsls    r2, r5, #30
 8002a6e:   d504        bpl.n   0x8002a7a
 8002a70:   68f3        ldr r3, [r6, #12]
 8002a72:   b113        cbz r3, 0x8002a7a
 8002a74:   4798        blx r3
 8002a76:   f044 0402   orr.w   r4, r4, #2
 8002a7a:   07eb        lsls    r3, r5, #31
 8002a7c:   d504        bpl.n   0x8002a88
 8002a7e:   68b3        ldr r3, [r6, #8]
 8002a80:   b113        cbz r3, 0x8002a88
 8002a82:   4798        blx r3
 8002a84:   f044 0401   orr.w   r4, r4, #1
 8002a88:   693b        ldr r3, [r7, #16]
 8002a8a:   ea23 0404   bic.w   r4, r3, r4
 8002a8e:   613c        str r4, [r7, #16]
 8002a90:   bdf8        pop {r3, r4, r5, r6, r7, pc}
 8002a92:   bf00        nop
 8002a94:   0080        lsls    r0, r0, #2
 8002a96:   2000        movs    r0, #0
 8002a98:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 8002a9a:   4e1a        ldr r6, [pc, #104]  ; (0x8002b04)
 8002a9c:   6837        ldr r7, [r6, #0]
 8002a9e:   68fb        ldr r3, [r7, #12]
 8002aa0:   693d        ldr r5, [r7, #16]
 8002aa2:   401d        ands    r5, r3
 8002aa4:   f015 0440   ands.w  r4, r5, #64 ; 0x40
 8002aa8:   d003        beq.n   0x8002ab2
 8002aaa:   6a34        ldr r4, [r6, #32]
 8002aac:   b10c        cbz r4, 0x8002ab2
 8002aae:   47a0        blx r4
 8002ab0:   2440        movs    r4, #64 ; 0x40
 8002ab2:   06eb        lsls    r3, r5, #27
 8002ab4:   d504        bpl.n   0x8002ac0
 8002ab6:   69b3        ldr r3, [r6, #24]
 8002ab8:   b113        cbz r3, 0x8002ac0
 8002aba:   4798        blx r3
 8002abc:   f044 0410   orr.w   r4, r4, #16
 8002ac0:   0728        lsls    r0, r5, #28
 8002ac2:   d504        bpl.n   0x8002ace
 8002ac4:   6973        ldr r3, [r6, #20]
 8002ac6:   b113        cbz r3, 0x8002ace
 8002ac8:   4798        blx r3
 8002aca:   f044 0408   orr.w   r4, r4, #8
 8002ace:   0769        lsls    r1, r5, #29
 8002ad0:   d504        bpl.n   0x8002adc
 8002ad2:   6933        ldr r3, [r6, #16]
 8002ad4:   b113        cbz r3, 0x8002adc
 8002ad6:   4798        blx r3
 8002ad8:   f044 0404   orr.w   r4, r4, #4
 8002adc:   07aa        lsls    r2, r5, #30
 8002ade:   d504        bpl.n   0x8002aea
 8002ae0:   68f3        ldr r3, [r6, #12]
 8002ae2:   b113        cbz r3, 0x8002aea
 8002ae4:   4798        blx r3
 8002ae6:   f044 0402   orr.w   r4, r4, #2
 8002aea:   07eb        lsls    r3, r5, #31
 8002aec:   d504        bpl.n   0x8002af8
 8002aee:   68b3        ldr r3, [r6, #8]
 8002af0:   b113        cbz r3, 0x8002af8
 8002af2:   4798        blx r3
 8002af4:   f044 0401   orr.w   r4, r4, #1
 8002af8:   693b        ldr r3, [r7, #16]
 8002afa:   ea23 0404   bic.w   r4, r3, r4
 8002afe:   613c        str r4, [r7, #16]
 8002b00:   bdf8        pop {r3, r4, r5, r6, r7, pc}
 8002b02:   bf00        nop
 8002b04:   00a4        lsls    r4, r4, #2
 8002b06:   2000        movs    r0, #0
 8002b08:   8881        ldrh    r1, [r0, #4]
 8002b0a:   6802        ldr r2, [r0, #0]
 8002b0c:   4603        mov r3, r0
 8002b0e:   b289        uxth    r1, r1
 8002b10:   5c50        ldrb    r0, [r2, r1]
 8002b12:   8899        ldrh    r1, [r3, #4]
 8002b14:   891a        ldrh    r2, [r3, #8]
 8002b16:   b289        uxth    r1, r1
 8002b18:   b292        uxth    r2, r2
 8002b1a:   4291        cmp r1, r2
 8002b1c:   bf17        itett   ne
 8002b1e:   889a        ldrhne  r2, [r3, #4]
 8002b20:   2200        moveq   r2, #0
 8002b22:   3201        addne   r2, #1
 8002b24:   b292        uxthne  r2, r2
 8002b26:   b2c0        uxtb    r0, r0
 8002b28:   809a        strh    r2, [r3, #4]
 8002b2a:   4770        bx  lr
 8002b2c:   88c2        ldrh    r2, [r0, #6]
 8002b2e:   b538        push    {r3, r4, r5, lr}
 8002b30:   8883        ldrh    r3, [r0, #4]
 8002b32:   b292        uxth    r2, r2
 8002b34:   b29b        uxth    r3, r3
 8002b36:   3201        adds    r2, #1
 8002b38:   429a        cmp r2, r3
 8002b3a:   4604        mov r4, r0
 8002b3c:   460d        mov r5, r1
 8002b3e:   d01a        beq.n   0x8002b76
 8002b40:   88c2        ldrh    r2, [r0, #6]
 8002b42:   8903        ldrh    r3, [r0, #8]
 8002b44:   b292        uxth    r2, r2
 8002b46:   b29b        uxth    r3, r3
 8002b48:   429a        cmp r2, r3
 8002b4a:   d102        bne.n   0x8002b52
 8002b4c:   8883        ldrh    r3, [r0, #4]
 8002b4e:   b29b        uxth    r3, r3
 8002b50:   b18b        cbz r3, 0x8002b76
 8002b52:   f04f 30ff   mov.w   r0, #4294967295
 8002b56:   88e2        ldrh    r2, [r4, #6]
 8002b58:   6823        ldr r3, [r4, #0]
 8002b5a:   b292        uxth    r2, r2
 8002b5c:   549d        strb    r5, [r3, r2]
 8002b5e:   88e2        ldrh    r2, [r4, #6]
 8002b60:   8923        ldrh    r3, [r4, #8]
 8002b62:   b292        uxth    r2, r2
 8002b64:   b29b        uxth    r3, r3
 8002b66:   429a        cmp r2, r3
 8002b68:   bf17        itett   ne
 8002b6a:   88e3        ldrhne  r3, [r4, #6]
 8002b6c:   2300        moveq   r3, #0
 8002b6e:   3301        addne   r3, #1
 8002b70:   b29b        uxthne  r3, r3
 8002b72:   80e3        strh    r3, [r4, #6]
 8002b74:   bd38        pop {r3, r4, r5, pc}
 8002b76:   4620        mov r0, r4
 8002b78:   f7ff ffc6   bl  0x8002b08
 8002b7c:   e7eb        b.n 0x8002b56
 8002b7e:   0000        movs    r0, r0
 8002b80:   b538        push    {r3, r4, r5, lr}
 8002b82:   4d11        ldr r5, [pc, #68]   ; (0x8002bc8)
 8002b84:   68eb        ldr r3, [r5, #12]
 8002b86:   0698        lsls    r0, r3, #26
 8002b88:   d507        bpl.n   0x8002b9a
 8002b8a:   682b        ldr r3, [r5, #0]
 8002b8c:   0699        lsls    r1, r3, #26
 8002b8e:   d504        bpl.n   0x8002b9a
 8002b90:   6869        ldr r1, [r5, #4]
 8002b92:   480e        ldr r0, [pc, #56]   ; (0x8002bcc)
 8002b94:   b2c9        uxtb    r1, r1
 8002b96:   f7ff ffc9   bl  0x8002b2c
 8002b9a:   68eb        ldr r3, [r5, #12]
 8002b9c:   4c0a        ldr r4, [pc, #40]   ; (0x8002bc8)
 8002b9e:   061a        lsls    r2, r3, #24
 8002ba0:   d511        bpl.n   0x8002bc6
 8002ba2:   6823        ldr r3, [r4, #0]
 8002ba4:   061b        lsls    r3, r3, #24
 8002ba6:   d50e        bpl.n   0x8002bc6
 8002ba8:   4809        ldr r0, [pc, #36]   ; (0x8002bd0)
 8002baa:   8882        ldrh    r2, [r0, #4]
 8002bac:   88c3        ldrh    r3, [r0, #6]
 8002bae:   b292        uxth    r2, r2
 8002bb0:   b29b        uxth    r3, r3
 8002bb2:   429a        cmp r2, r3
 8002bb4:   d003        beq.n   0x8002bbe
 8002bb6:   f7ff ffa7   bl  0x8002b08
 8002bba:   6060        str r0, [r4, #4]
 8002bbc:   bd38        pop {r3, r4, r5, pc}
 8002bbe:   68e3        ldr r3, [r4, #12]
 8002bc0:   f023 0380   bic.w   r3, r3, #128    ; 0x80
 8002bc4:   60e3        str r3, [r4, #12]
 8002bc6:   bd38        pop {r3, r4, r5, pc}
 8002bc8:   3800        subs    r0, #0
 8002bca:   4001        ands    r1, r0
 8002bcc:   084c        lsrs    r4, r1, #1
 8002bce:   2000        movs    r0, #0
 8002bd0:   0840        lsrs    r0, r0, #1
 8002bd2:   2000        movs    r0, #0
 8002bd4:   b538        push    {r3, r4, r5, lr}
 8002bd6:   4d11        ldr r5, [pc, #68]   ; (0x8002c1c)
 8002bd8:   68eb        ldr r3, [r5, #12]
 8002bda:   0698        lsls    r0, r3, #26
 8002bdc:   d507        bpl.n   0x8002bee
 8002bde:   682b        ldr r3, [r5, #0]
 8002be0:   0699        lsls    r1, r3, #26
 8002be2:   d504        bpl.n   0x8002bee
 8002be4:   6869        ldr r1, [r5, #4]
 8002be6:   480e        ldr r0, [pc, #56]   ; (0x8002c20)
 8002be8:   b2c9        uxtb    r1, r1
 8002bea:   f7ff ff9f   bl  0x8002b2c
 8002bee:   68eb        ldr r3, [r5, #12]
 8002bf0:   4c0a        ldr r4, [pc, #40]   ; (0x8002c1c)
 8002bf2:   061a        lsls    r2, r3, #24
 8002bf4:   d511        bpl.n   0x8002c1a
 8002bf6:   6823        ldr r3, [r4, #0]
 8002bf8:   061b        lsls    r3, r3, #24
 8002bfa:   d50e        bpl.n   0x8002c1a
 8002bfc:   4809        ldr r0, [pc, #36]   ; (0x8002c24)
 8002bfe:   8882        ldrh    r2, [r0, #4]
 8002c00:   88c3        ldrh    r3, [r0, #6]
 8002c02:   b292        uxth    r2, r2
 8002c04:   b29b        uxth    r3, r3
 8002c06:   429a        cmp r2, r3
 8002c08:   d003        beq.n   0x8002c12
 8002c0a:   f7ff ff7d   bl  0x8002b08
 8002c0e:   6060        str r0, [r4, #4]
 8002c10:   bd38        pop {r3, r4, r5, pc}
 8002c12:   68e3        ldr r3, [r4, #12]
 8002c14:   f023 0380   bic.w   r3, r3, #128    ; 0x80
 8002c18:   60e3        str r3, [r4, #12]
 8002c1a:   bd38        pop {r3, r4, r5, pc}
 8002c1c:   4400        add r0, r0
 8002c1e:   4000        ands    r0, r0
 8002c20:   0858        lsrs    r0, r3, #1
 8002c22:   2000        movs    r0, #0
 8002c24:   0870        lsrs    r0, r6, #1
 8002c26:   2000        movs    r0, #0
 8002c28:   b538        push    {r3, r4, r5, lr}
 8002c2a:   4d11        ldr r5, [pc, #68]   ; (0x8002c70)
 8002c2c:   68eb        ldr r3, [r5, #12]
 8002c2e:   0698        lsls    r0, r3, #26
 8002c30:   d507        bpl.n   0x8002c42
 8002c32:   682b        ldr r3, [r5, #0]
 8002c34:   0699        lsls    r1, r3, #26
 8002c36:   d504        bpl.n   0x8002c42
 8002c38:   6869        ldr r1, [r5, #4]
 8002c3a:   480e        ldr r0, [pc, #56]   ; (0x8002c74)
 8002c3c:   b2c9        uxtb    r1, r1
 8002c3e:   f7ff ff75   bl  0x8002b2c
 8002c42:   68eb        ldr r3, [r5, #12]
 8002c44:   4c0a        ldr r4, [pc, #40]   ; (0x8002c70)
 8002c46:   061a        lsls    r2, r3, #24
 8002c48:   d511        bpl.n   0x8002c6e
 8002c4a:   6823        ldr r3, [r4, #0]
 8002c4c:   061b        lsls    r3, r3, #24
 8002c4e:   d50e        bpl.n   0x8002c6e
 8002c50:   4809        ldr r0, [pc, #36]   ; (0x8002c78)
 8002c52:   8882        ldrh    r2, [r0, #4]
 8002c54:   88c3        ldrh    r3, [r0, #6]
 8002c56:   b292        uxth    r2, r2
 8002c58:   b29b        uxth    r3, r3
 8002c5a:   429a        cmp r2, r3
 8002c5c:   d003        beq.n   0x8002c66
 8002c5e:   f7ff ff53   bl  0x8002b08
 8002c62:   6060        str r0, [r4, #4]
 8002c64:   bd38        pop {r3, r4, r5, pc}
 8002c66:   68e3        ldr r3, [r4, #12]
 8002c68:   f023 0380   bic.w   r3, r3, #128    ; 0x80
 8002c6c:   60e3        str r3, [r4, #12]
 8002c6e:   bd38        pop {r3, r4, r5, pc}
 8002c70:   4800        ldr r0, [pc, #0]    ; (0x8002c74)
 8002c72:   4000        ands    r0, r0
 8002c74:   0864        lsrs    r4, r4, #1
 8002c76:   2000        movs    r0, #0
 8002c78:   087c        lsrs    r4, r7, #1
 8002c7a:   2000        movs    r0, #0
 8002c7c:   b508        push    {r3, lr}
 8002c7e:   4b11        ldr r3, [pc, #68]   ; (0x8002cc4)
 8002c80:   2101        movs    r1, #1
 8002c82:   681c        ldr r4, [r3, #0]
 8002c84:   2203        movs    r2, #3
 8002c86:   4620        mov r0, r4
 8002c88:   f7ff fcd0   bl  0x800262c
 8002c8c:   2300        movs    r3, #0
 8002c8e:   2101        movs    r1, #1
 8002c90:   461a        mov r2, r3
 8002c92:   4293        cmp r3, r2
 8002c94:   6820        ldr r0, [r4, #0]
 8002c96:   bf34        ite cc
 8002c98:   2502        movcc   r5, #2
 8002c9a:   f44f 3500   movcs.w r5, #131072 ; 0x20000
 8002c9e:   f5b2 7f00   cmp.w   r2, #512    ; 0x200
 8002ca2:   6105        str r5, [r0, #16]
 8002ca4:   f103 0301   add.w   r3, r3, #1
 8002ca8:   d003        beq.n   0x8002cb2
 8002caa:   2a00        cmp r2, #0
 8002cac:   bf08        it  eq
 8002cae:   2101        moveq   r1, #1
 8002cb0:   e001        b.n 0x8002cb6
 8002cb2:   f04f 31ff   mov.w   r1, #4294967295
 8002cb6:   f5b3 7f00   cmp.w   r3, #512    ; 0x200
 8002cba:   bf04        itt eq
 8002cbc:   1852        addeq   r2, r2, r1
 8002cbe:   2300        moveq   r3, #0
 8002cc0:   e7e7        b.n 0x8002c92
 8002cc2:   bf00        nop
 8002cc4:   5148        str r0, [r1, r5]
 8002cc6:   0800        lsrs    r0, r0, #32
 8002cc8:   b508        push    {r3, lr}
 8002cca:   4b03        ldr r3, [pc, #12]   ; (0x8002cd8)
 8002ccc:   b10b        cbz r3, 0x8002cd2
 8002cce:   f3af 8000   nop.w
 8002cd2:   b662        cpsie   i
 8002cd4:   f7ff ffd2   bl  0x8002c7c
 8002cd8:   0000        movs    r0, r0
 8002cda:   0000        movs    r0, r0
 8002cdc:   6903        ldr r3, [r0, #16]
 8002cde:   685b        ldr r3, [r3, #4]
 8002ce0:   88d9        ldrh    r1, [r3, #6]
 8002ce2:   889a        ldrh    r2, [r3, #4]
 8002ce4:   b289        uxth    r1, r1
 8002ce6:   b292        uxth    r2, r2
 8002ce8:   88d8        ldrh    r0, [r3, #6]
 8002cea:   1a8a        subs    r2, r1, r2
 8002cec:   8899        ldrh    r1, [r3, #4]
 8002cee:   b280        uxth    r0, r0
 8002cf0:   b289        uxth    r1, r1
 8002cf2:   4288        cmp r0, r1
 8002cf4:   d203        bcs.n   0x8002cfe
 8002cf6:   8919        ldrh    r1, [r3, #8]
 8002cf8:   b289        uxth    r1, r1
 8002cfa:   3101        adds    r1, #1
 8002cfc:   440a        add r2, r1
 8002cfe:   b292        uxth    r2, r2
 8002d00:   b182        cbz r2, 0x8002d24
 8002d02:   8899        ldrh    r1, [r3, #4]
 8002d04:   681a        ldr r2, [r3, #0]
 8002d06:   b289        uxth    r1, r1
 8002d08:   5c50        ldrb    r0, [r2, r1]
 8002d0a:   8899        ldrh    r1, [r3, #4]
 8002d0c:   891a        ldrh    r2, [r3, #8]
 8002d0e:   b289        uxth    r1, r1
 8002d10:   b292        uxth    r2, r2
 8002d12:   4291        cmp r1, r2
 8002d14:   bf17        itett   ne
 8002d16:   889a        ldrhne  r2, [r3, #4]
 8002d18:   2200        moveq   r2, #0
 8002d1a:   3201        addne   r2, #1
 8002d1c:   b292        uxthne  r2, r2
 8002d1e:   b2c0        uxtb    r0, r0
 8002d20:   809a        strh    r2, [r3, #4]
 8002d22:   4770        bx  lr
 8002d24:   f04f 30ff   mov.w   r0, #4294967295
 8002d28:   4770        bx  lr
 8002d2a:   6903        ldr r3, [r0, #16]
 8002d2c:   685b        ldr r3, [r3, #4]
 8002d2e:   8899        ldrh    r1, [r3, #4]
 8002d30:   88da        ldrh    r2, [r3, #6]
 8002d32:   b289        uxth    r1, r1
 8002d34:   b292        uxth    r2, r2
 8002d36:   4291        cmp r1, r2
 8002d38:   d005        beq.n   0x8002d46
 8002d3a:   889a        ldrh    r2, [r3, #4]
 8002d3c:   681b        ldr r3, [r3, #0]
 8002d3e:   b292        uxth    r2, r2
 8002d40:   5c98        ldrb    r0, [r3, r2]
 8002d42:   b2c0        uxtb    r0, r0
 8002d44:   4770        bx  lr
 8002d46:   f04f 30ff   mov.w   r0, #4294967295
 8002d4a:   4770        bx  lr
 8002d4c:   6903        ldr r3, [r0, #16]
 8002d4e:   689a        ldr r2, [r3, #8]
 8002d50:   8890        ldrh    r0, [r2, #4]
 8002d52:   88d1        ldrh    r1, [r2, #6]
 8002d54:   b280        uxth    r0, r0
 8002d56:   b289        uxth    r1, r1
 8002d58:   4288        cmp r0, r1
 8002d5a:   d1f9        bne.n   0x8002d50
 8002d5c:   681a        ldr r2, [r3, #0]
 8002d5e:   6813        ldr r3, [r2, #0]
 8002d60:   065b        lsls    r3, r3, #25
 8002d62:   d5fc        bpl.n   0x8002d5e
 8002d64:   4770        bx  lr
 8002d66:   b513        push    {r0, r1, r4, lr}
 8002d68:   6904        ldr r4, [r0, #16]
 8002d6a:   f88d 1007   strb.w  r1, [sp, #7]
 8002d6e:   4620        mov r0, r4
 8002d70:   f10d 0107   add.w   r1, sp, #7
 8002d74:   2201        movs    r2, #1
 8002d76:   f000 f9b5   bl  0x80030e4
 8002d7a:   2800        cmp r0, #0
 8002d7c:   d0f7        beq.n   0x8002d6e
 8002d7e:   2001        movs    r0, #1
 8002d80:   b002        add sp, #8
 8002d82:   bd10        pop {r4, pc}
 8002d84:   6903        ldr r3, [r0, #16]
 8002d86:   685b        ldr r3, [r3, #4]
 8002d88:   88d8        ldrh    r0, [r3, #6]
 8002d8a:   889a        ldrh    r2, [r3, #4]
 8002d8c:   b280        uxth    r0, r0
 8002d8e:   b292        uxth    r2, r2
 8002d90:   88d9        ldrh    r1, [r3, #6]
 8002d92:   1a80        subs    r0, r0, r2
 8002d94:   889a        ldrh    r2, [r3, #4]
 8002d96:   b289        uxth    r1, r1
 8002d98:   b292        uxth    r2, r2
 8002d9a:   4291        cmp r1, r2
 8002d9c:   d203        bcs.n   0x8002da6
 8002d9e:   891b        ldrh    r3, [r3, #8]
 8002da0:   b29b        uxth    r3, r3
 8002da2:   3301        adds    r3, #1
 8002da4:   4418        add r0, r3
 8002da6:   b280        uxth    r0, r0
 8002da8:   4770        bx  lr
 8002daa:   0000        movs    r0, r0
 8002dac:   b530        push    {r4, r5, lr}
 8002dae:   2500        movs    r5, #0
 8002db0:   6045        str r5, [r0, #4]
 8002db2:   f44f 757a   mov.w   r5, #1000   ; 0x3e8
 8002db6:   6085        str r5, [r0, #8]
 8002db8:   4d02        ldr r5, [pc, #8]    ; (0x8002dc4)
 8002dba:   6101        str r1, [r0, #16]
 8002dbc:   6005        str r5, [r0, #0]
 8002dbe:   7502        strb    r2, [r0, #20]
 8002dc0:   7543        strb    r3, [r0, #21]
 8002dc2:   bd30        pop {r4, r5, pc}
 8002dc4:   51c8        str r0, [r1, r7]
 8002dc6:   0800        lsrs    r0, r0, #32
 8002dc8:   b570        push    {r4, r5, r6, lr}
 8002dca:   4605        mov r5, r0
 8002dcc:   460e        mov r6, r1
 8002dce:   2400        movs    r4, #0
 8002dd0:   5d31        ldrb    r1, [r6, r4]
 8002dd2:   b129        cbz r1, 0x8002de0
 8002dd4:   682a        ldr r2, [r5, #0]
 8002dd6:   4628        mov r0, r5
 8002dd8:   6812        ldr r2, [r2, #0]
 8002dda:   4790        blx r2
 8002ddc:   3401        adds    r4, #1
 8002dde:   e7f7        b.n 0x8002dd0
 8002de0:   4620        mov r0, r4
 8002de2:   bd70        pop {r4, r5, r6, pc}
 8002de4:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 8002de6:   4605        mov r5, r0
 8002de8:   460c        mov r4, r1
 8002dea:   4616        mov r6, r2
 8002dec:   188f        adds    r7, r1, r2
 8002dee:   42bc        cmp r4, r7
 8002df0:   d006        beq.n   0x8002e00
 8002df2:   682b        ldr r3, [r5, #0]
 8002df4:   4628        mov r0, r5
 8002df6:   681b        ldr r3, [r3, #0]
 8002df8:   f814 1b01   ldrb.w  r1, [r4], #1
 8002dfc:   4798        blx r3
 8002dfe:   e7f6        b.n 0x8002dee
 8002e00:   4630        mov r0, r6
 8002e02:   bdf8        pop {r3, r4, r5, r6, r7, pc}
 8002e04:   b508        push    {r3, lr}
 8002e06:   6803        ldr r3, [r0, #0]
 8002e08:   681b        ldr r3, [r3, #0]
 8002e0a:   4798        blx r3
 8002e0c:   bd08        pop {r3, pc}
 8002e0e:   b508        push    {r3, lr}
 8002e10:   6803        ldr r3, [r0, #0]
 8002e12:   685b        ldr r3, [r3, #4]
 8002e14:   4798        blx r3
 8002e16:   bd08        pop {r3, pc}
 8002e18:   b538        push    {r3, r4, r5, lr}
 8002e1a:   210d        movs    r1, #13
 8002e1c:   4605        mov r5, r0
 8002e1e:   f7ff fff1   bl  0x8002e04
 8002e22:   210a        movs    r1, #10
 8002e24:   4604        mov r4, r0
 8002e26:   4628        mov r0, r5
 8002e28:   f7ff ffec   bl  0x8002e04
 8002e2c:   4420        add r0, r4
 8002e2e:   bd38        pop {r3, r4, r5, pc}
 8002e30:   b538        push    {r3, r4, r5, lr}
 8002e32:   4604        mov r4, r0
 8002e34:   f7ff ffeb   bl  0x8002e0e
 8002e38:   4605        mov r5, r0
 8002e3a:   4620        mov r0, r4
 8002e3c:   f7ff ffec   bl  0x8002e18
 8002e40:   4428        add r0, r5
 8002e42:   bd38        pop {r3, r4, r5, pc}
 8002e44:   f7ff ba64   b.w 0x8002310
 8002e48:   b508        push    {r3, lr}
 8002e4a:   f7ff f979   bl  0x8002140
 8002e4e:   f7ff f97d   bl  0x800214c
 8002e52:   e7fc        b.n 0x8002e4e
 8002e54:   f000 bd5a   b.w 0x800390c
 8002e58:   b507        push    {r0, r1, r2, lr}
 8002e5a:   2101        movs    r1, #1
 8002e5c:   f10d 0007   add.w   r0, sp, #7
 8002e60:   f000 fd60   bl  0x8003924
 8002e64:   2801        cmp r0, #1
 8002e66:   bf0c        ite eq
 8002e68:   f89d 0007   ldrbeq.w    r0, [sp, #7]
 8002e6c:   f04f 30ff   movne.w r0, #4294967295
 8002e70:   b003        add sp, #12
 8002e72:   f85d fb04   ldr.w   pc, [sp], #4
 8002e76:   b507        push    {r0, r1, r2, lr}
 8002e78:   2101        movs    r1, #1
 8002e7a:   f10d 0007   add.w   r0, sp, #7
 8002e7e:   f000 fd6d   bl  0x800395c
 8002e82:   b110        cbz r0, 0x8002e8a
 8002e84:   f89d 0007   ldrb.w  r0, [sp, #7]
 8002e88:   e001        b.n 0x8002e8e
 8002e8a:   f04f 30ff   mov.w   r0, #4294967295
 8002e8e:   b003        add sp, #12
 8002e90:   f85d fb04   ldr.w   pc, [sp], #4
 8002e94:   b510        push    {r4, lr}
 8002e96:   780b        ldrb    r3, [r1, #0]
 8002e98:   2b22        cmp r3, #34 ; 0x22
 8002e9a:   d120        bne.n   0x8002ede
 8002e9c:   4c10        ldr r4, [pc, #64]   ; (0x8002ee0)
 8002e9e:   f000 fd97   bl  0x80039d0
 8002ea2:   7823        ldrb    r3, [r4, #0]
 8002ea4:   2b03        cmp r3, #3
 8002ea6:   d80d        bhi.n   0x8002ec4
 8002ea8:   e8df f003   tbb [pc, r3]
 8002eac:   0207        lsls    r7, r0, #8
 8002eae:   0707        lsls    r7, r0, #28
 8002eb0:   2800        cmp r0, #0
 8002eb2:   bf0c        ite eq
 8002eb4:   2302        moveq   r3, #2
 8002eb6:   2301        movne   r3, #1
 8002eb8:   e003        b.n 0x8002ec2
 8002eba:   2800        cmp r0, #0
 8002ebc:   bf0c        ite eq
 8002ebe:   2303        moveq   r3, #3
 8002ec0:   2301        movne   r3, #1
 8002ec2:   7023        strb    r3, [r4, #0]
 8002ec4:   f000 fd8c   bl  0x80039e0
 8002ec8:   f5b0 6f96   cmp.w   r0, #1200   ; 0x4b0
 8002ecc:   d107        bne.n   0x8002ede
 8002ece:   7823        ldrb    r3, [r4, #0]
 8002ed0:   2b02        cmp r3, #2
 8002ed2:   d104        bne.n   0x8002ede
 8002ed4:   2000        movs    r0, #0
 8002ed6:   210a        movs    r1, #10
 8002ed8:   f000 f8f4   bl  0x80030c4
 8002edc:   e7fe        b.n 0x8002edc
 8002ede:   bd10        pop {r4, pc}
 8002ee0:   089c        lsrs    r4, r3, #2
 8002ee2:   2000        movs    r0, #0
 8002ee4:   4b1d        ldr r3, [pc, #116]  ; (0x8002f5c)
 8002ee6:   b573        push    {r0, r1, r4, r5, r6, lr}
 8002ee8:   781a        ldrb    r2, [r3, #0]
 8002eea:   2a02        cmp r2, #2
 8002eec:   d134        bne.n   0x8002f58
 8002eee:   2203        movs    r2, #3
 8002ef0:   701a        strb    r2, [r3, #0]
 8002ef2:   f000 fd0b   bl  0x800390c
 8002ef6:   2803        cmp r0, #3
 8002ef8:   d92e        bls.n   0x8002f58
 8002efa:   f000 fd07   bl  0x800390c
 8002efe:   2204        movs    r2, #4
 8002f00:   1f01        subs    r1, r0, #4
 8002f02:   a801        add r0, sp, #4
 8002f04:   f000 fd44   bl  0x8003990
 8002f08:   f89d 3004   ldrb.w  r3, [sp, #4]
 8002f0c:   2b31        cmp r3, #49 ; 0x31
 8002f0e:   d123        bne.n   0x8002f58
 8002f10:   f89d 3005   ldrb.w  r3, [sp, #5]
 8002f14:   2b45        cmp r3, #69 ; 0x45
 8002f16:   d11f        bne.n   0x8002f58
 8002f18:   f89d 3006   ldrb.w  r3, [sp, #6]
 8002f1c:   2b41        cmp r3, #65 ; 0x41
 8002f1e:   d11b        bne.n   0x8002f58
 8002f20:   f89d 3007   ldrb.w  r3, [sp, #7]
 8002f24:   2b46        cmp r3, #70 ; 0x46
 8002f26:   d117        bne.n   0x8002f58
 8002f28:   4c0d        ldr r4, [pc, #52]   ; (0x8002f60)
 8002f2a:   f04f 46c2   mov.w   r6, #1627389952 ; 0x61000000
 8002f2e:   f06f 0506   mvn.w   r5, #6
 8002f32:   f044 0401   orr.w   r4, r4, #1
 8002f36:   4b0b        ldr r3, [pc, #44]   ; (0x8002f64)
 8002f38:   4618        mov r0, r3
 8002f3a:   4685        mov sp, r0
 8002f3c:   f04f 0001   mov.w   r0, #1
 8002f40:   4621        mov r1, r4
 8002f42:   4632        mov r2, r6
 8002f44:   b404        push    {r2}
 8002f46:   b402        push    {r1}
 8002f48:   b401        push    {r0}
 8002f4a:   b401        push    {r0}
 8002f4c:   b401        push    {r0}
 8002f4e:   b401        push    {r0}
 8002f50:   b401        push    {r0}
 8002f52:   b401        push    {r0}
 8002f54:   46ae        mov lr, r5
 8002f56:   4770        bx  lr
 8002f58:   b002        add sp, #8
 8002f5a:   bd70        pop {r4, r5, r6, pc}
 8002f5c:   089c        lsrs    r4, r3, #2
 8002f5e:   2000        movs    r0, #0
 8002f60:   2f69        cmp r7, #105    ; 0x69
 8002f62:   0800        lsrs    r0, r0, #32
 8002f64:   0800        lsrs    r0, r0, #32
 8002f66:   2000        movs    r0, #0
 8002f68:   4b02        ldr r3, [pc, #8]    ; (0x8002f74)
 8002f6a:   4618        mov r0, r3
 8002f6c:   3801        subs    r0, #1
 8002f6e:   d8fd        bhi.n   0x8002f6c
 8002f70:   f7ff bbba   b.w 0x80026e8
 8002f74:   4f7f        ldr r7, [pc, #508]  ; (0x8003174)
 8002f76:   0012        movs    r2, r2
 8002f78:   2200        movs    r2, #0
 8002f7a:   6042        str r2, [r0, #4]
 8002f7c:   f44f 727a   mov.w   r2, #1000   ; 0x3e8
 8002f80:   6082        str r2, [r0, #8]
 8002f82:   4a01        ldr r2, [pc, #4]    ; (0x8002f88)
 8002f84:   6002        str r2, [r0, #0]
 8002f86:   4770        bx  lr
 8002f88:   51f0        str r0, [r6, r7]
 8002f8a:   0800        lsrs    r0, r0, #32
 8002f8c:   4b09        ldr r3, [pc, #36]   ; (0x8002fb4)
 8002f8e:   b510        push    {r4, lr}
 8002f90:   7818        ldrb    r0, [r3, #0]
 8002f92:   b970        cbnz    r0, 0x8002fb2
 8002f94:   2401        movs    r4, #1
 8002f96:   4601        mov r1, r0
 8002f98:   701c        strb    r4, [r3, #0]
 8002f9a:   f000 fc6b   bl  0x8003874
 8002f9e:   4620        mov r0, r4
 8002fa0:   4905        ldr r1, [pc, #20]   ; (0x8002fb8)
 8002fa2:   f000 fc59   bl  0x8003858
 8002fa6:   e8bd 4010   ldmia.w sp!, {r4, lr}
 8002faa:   2002        movs    r0, #2
 8002fac:   4903        ldr r1, [pc, #12]   ; (0x8002fbc)
 8002fae:   f000 bc53   b.w 0x8003858
 8002fb2:   bd10        pop {r4, pc}
 8002fb4:   0888        lsrs    r0, r1, #2
 8002fb6:   2000        movs    r0, #0
 8002fb8:   2ee5        cmp r6, #229    ; 0xe5
 8002fba:   0800        lsrs    r0, r0, #32
 8002fbc:   2e95        cmp r6, #149    ; 0x95
 8002fbe:   0800        lsrs    r0, r0, #32
 8002fc0:   b570        push    {r4, r5, r6, lr}
 8002fc2:   460e        mov r6, r1
 8002fc4:   4615        mov r5, r2
 8002fc6:   2400        movs    r4, #0
 8002fc8:   42ac        cmp r4, r5
 8002fca:   d205        bcs.n   0x8002fd8
 8002fcc:   1930        adds    r0, r6, r4
 8002fce:   1b29        subs    r1, r5, r4
 8002fd0:   f000 fcc4   bl  0x800395c
 8002fd4:   4404        add r4, r0
 8002fd6:   e7f7        b.n 0x8002fc8
 8002fd8:   4620        mov r0, r4
 8002fda:   bd70        pop {r4, r5, r6, pc}
 8002fdc:   b513        push    {r0, r1, r4, lr}
 8002fde:   4604        mov r4, r0
 8002fe0:   f000 fc94   bl  0x800390c
 8002fe4:   b130        cbz r0, 0x8002ff4
 8002fe6:   4620        mov r0, r4
 8002fe8:   f10d 0107   add.w   r1, sp, #7
 8002fec:   2201        movs    r2, #1
 8002fee:   f7ff ffe7   bl  0x8002fc0
 8002ff2:   e7f5        b.n 0x8002fe0
 8002ff4:   b002        add sp, #8
 8002ff6:   bd10        pop {r4, pc}
 8002ff8:   b508        push    {r3, lr}
 8002ffa:   4b06        ldr r3, [pc, #24]   ; (0x8003014)
 8002ffc:   681b        ldr r3, [r3, #0]
 8002ffe:   7b1b        ldrb    r3, [r3, #12]
 8003000:   2b05        cmp r3, #5
 8003002:   d105        bne.n   0x8003010
 8003004:   f000 fce4   bl  0x80039d0
 8003008:   3000        adds    r0, #0
 800300a:   bf18        it  ne
 800300c:   2001        movne   r0, #1
 800300e:   bd08        pop {r3, pc}
 8003010:   2000        movs    r0, #0
 8003012:   bd08        pop {r3, pc}
 8003014:   02dc        lsls    r4, r3, #11
 8003016:   2000        movs    r0, #0
 8003018:   b570        push    {r4, r5, r6, lr}
 800301a:   460e        mov r6, r1
 800301c:   4615        mov r5, r2
 800301e:   f7ff ffeb   bl  0x8002ff8
 8003022:   b148        cbz r0, 0x8003038
 8003024:   b146        cbz r6, 0x8003038
 8003026:   2400        movs    r4, #0
 8003028:   42ac        cmp r4, r5
 800302a:   d205        bcs.n   0x8003038
 800302c:   1930        adds    r0, r6, r4
 800302e:   1b29        subs    r1, r5, r4
 8003030:   f000 fc3c   bl  0x80038ac
 8003034:   4404        add r4, r0
 8003036:   e7f7        b.n 0x8003028
 8003038:   2000        movs    r0, #0
 800303a:   bd70        pop {r4, r5, r6, pc}
 800303c:   b507        push    {r0, r1, r2, lr}
 800303e:   ab02        add r3, sp, #8
 8003040:   f803 1d01   strb.w  r1, [r3, #-1]!
 8003044:   4619        mov r1, r3
 8003046:   2201        movs    r2, #1
 8003048:   f7ff ffe6   bl  0x8003018
 800304c:   2000        movs    r0, #0
 800304e:   b003        add sp, #12
 8003050:   f85d fb04   ldr.w   pc, [sp], #4
 8003054:   b538        push    {r3, r4, r5, lr}
 8003056:   4605        mov r5, r0
 8003058:   4608        mov r0, r1
 800305a:   460c        mov r4, r1
 800305c:   f001 f9c8   bl  0x80043f0
 8003060:   4621        mov r1, r4
 8003062:   4602        mov r2, r0
 8003064:   4628        mov r0, r5
 8003066:   f7ff ffd7   bl  0x8003018
 800306a:   2000        movs    r0, #0
 800306c:   bd38        pop {r3, r4, r5, pc}
 800306e:   0000        movs    r0, r0
 8003070:   4801        ldr r0, [pc, #4]    ; (0x8003078)
 8003072:   f7ff bf81   b.w 0x8002f78
 8003076:   bf00        nop
 8003078:   088c        lsrs    r4, r1, #2
 800307a:   2000        movs    r0, #0
 800307c:   4b05        ldr r3, [pc, #20]   ; (0x8003094)
 800307e:   b570        push    {r4, r5, r6, lr}
 8003080:   681c        ldr r4, [r3, #0]
 8003082:   4606        mov r6, r0
 8003084:   461d        mov r5, r3
 8003086:   f000 f811   bl  0x80030ac
 800308a:   682b        ldr r3, [r5, #0]
 800308c:   1b1b        subs    r3, r3, r4
 800308e:   42b3        cmp r3, r6
 8003090:   d3f9        bcc.n   0x8003086
 8003092:   bd70        pop {r4, r5, r6, pc}
 8003094:   0ac0        lsrs    r0, r0, #11
 8003096:   2000        movs    r0, #0
 8003098:   4b03        ldr r3, [pc, #12]   ; (0x80030a8)
 800309a:   681a        ldr r2, [r3, #0]
 800309c:   f022 62e0   bic.w   r2, r2, #117440512  ; 0x7000000
 80030a0:   f042 6280   orr.w   r2, r2, #67108864   ; 0x4000000
 80030a4:   601a        str r2, [r3, #0]
 80030a6:   4770        bx  lr
 80030a8:   0004        movs    r4, r0
 80030aa:   4001        ands    r1, r0
 80030ac:   4770        bx  lr
 80030ae:   b510        push    {r4, lr}
 80030b0:   4604        mov r4, r0
 80030b2:   7900        ldrb    r0, [r0, #4]
 80030b4:   f7ff fb70   bl  0x8002798
 80030b8:   7920        ldrb    r0, [r4, #4]
 80030ba:   e8bd 4010   ldmia.w sp!, {r4, lr}
 80030be:   f7ff bb83   b.w 0x80027c8
 80030c2:   0000        movs    r0, r0
 80030c4:   4b06        ldr r3, [pc, #24]   ; (0x80030e0)
 80030c6:   f245 5255   movw    r2, #21845  ; 0x5555
 80030ca:   601a        str r2, [r3, #0]
 80030cc:   f64c 42cc   movw    r2, #52428  ; 0xcccc
 80030d0:   6058        str r0, [r3, #4]
 80030d2:   6099        str r1, [r3, #8]
 80030d4:   601a        str r2, [r3, #0]
 80030d6:   f64a 22aa   movw    r2, #43690  ; 0xaaaa
 80030da:   601a        str r2, [r3, #0]
 80030dc:   4770        bx  lr
 80030de:   bf00        nop
 80030e0:   3000        adds    r0, #0
 80030e2:   4000        ands    r0, r0
 80030e4:   b5f0        push    {r4, r5, r6, r7, lr}
 80030e6:   6883        ldr r3, [r0, #8]
 80030e8:   4605        mov r5, r0
 80030ea:   6804        ldr r4, [r0, #0]
 80030ec:   2000        movs    r0, #0
 80030ee:   889f        ldrh    r7, [r3, #4]
 80030f0:   88de        ldrh    r6, [r3, #6]
 80030f2:   b2bf        uxth    r7, r7
 80030f4:   b2b6        uxth    r6, r6
 80030f6:   42b7        cmp r7, r6
 80030f8:   d004        beq.n   0x8003104
 80030fa:   68e3        ldr r3, [r4, #12]
 80030fc:   f023 0380   bic.w   r3, r3, #128    ; 0x80
 8003100:   60e3        str r3, [r4, #12]
 8003102:   e027        b.n 0x8003154
 8003104:   6826        ldr r6, [r4, #0]
 8003106:   0636        lsls    r6, r6, #24
 8003108:   d5f7        bpl.n   0x80030fa
 800310a:   4290        cmp r0, r2
 800310c:   d0f5        beq.n   0x80030fa
 800310e:   5c0e        ldrb    r6, [r1, r0]
 8003110:   3001        adds    r0, #1
 8003112:   6066        str r6, [r4, #4]
 8003114:   e7eb        b.n 0x80030ee
 8003116:   88df        ldrh    r7, [r3, #6]
 8003118:   889e        ldrh    r6, [r3, #4]
 800311a:   b2bf        uxth    r7, r7
 800311c:   b2b6        uxth    r6, r6
 800311e:   3701        adds    r7, #1
 8003120:   42b7        cmp r7, r6
 8003122:   f811 c000   ldrb.w  r12, [r1, r0]
 8003126:   d01d        beq.n   0x8003164
 8003128:   88df        ldrh    r7, [r3, #6]
 800312a:   891e        ldrh    r6, [r3, #8]
 800312c:   b2bf        uxth    r7, r7
 800312e:   b2b6        uxth    r6, r6
 8003130:   42b7        cmp r7, r6
 8003132:   d013        beq.n   0x800315c
 8003134:   88df        ldrh    r7, [r3, #6]
 8003136:   681e        ldr r6, [r3, #0]
 8003138:   b2bf        uxth    r7, r7
 800313a:   f806 c007   strb.w  r12, [r6, r7]
 800313e:   88df        ldrh    r7, [r3, #6]
 8003140:   891e        ldrh    r6, [r3, #8]
 8003142:   b2bf        uxth    r7, r7
 8003144:   b2b6        uxth    r6, r6
 8003146:   42b7        cmp r7, r6
 8003148:   d018        beq.n   0x800317c
 800314a:   88de        ldrh    r6, [r3, #6]
 800314c:   3601        adds    r6, #1
 800314e:   b2b6        uxth    r6, r6
 8003150:   80de        strh    r6, [r3, #6]
 8003152:   3001        adds    r0, #1
 8003154:   4290        cmp r0, r2
 8003156:   68ab        ldr r3, [r5, #8]
 8003158:   d3dd        bcc.n   0x8003116
 800315a:   e003        b.n 0x8003164
 800315c:   889e        ldrh    r6, [r3, #4]
 800315e:   b2b6        uxth    r6, r6
 8003160:   2e00        cmp r6, #0
 8003162:   d1e7        bne.n   0x8003134
 8003164:   889a        ldrh    r2, [r3, #4]
 8003166:   88db        ldrh    r3, [r3, #6]
 8003168:   b292        uxth    r2, r2
 800316a:   b29b        uxth    r3, r3
 800316c:   429a        cmp r2, r3
 800316e:   d100        bne.n   0x8003172
 8003170:   bdf0        pop {r4, r5, r6, r7, pc}
 8003172:   68e3        ldr r3, [r4, #12]
 8003174:   f043 0380   orr.w   r3, r3, #128    ; 0x80
 8003178:   60e3        str r3, [r4, #12]
 800317a:   bdf0        pop {r4, r5, r6, r7, pc}
 800317c:   2600        movs    r6, #0
 800317e:   e7e7        b.n 0x8003150
 8003180:   4b29        ldr r3, [pc, #164]  ; (0x8003228)
 8003182:   2807        cmp r0, #7
 8003184:   bf18        it  ne
 8003186:   7018        strbne  r0, [r3, #0]
 8003188:   781a        ldrb    r2, [r3, #0]
 800318a:   2a05        cmp r2, #5
 800318c:   d849        bhi.n   0x8003222
 800318e:   e8df f002   tbb [pc, r2]
 8003192:   1303        asrs    r3, r0, #12
 8003194:   221e        movs    r2, #30
 8003196:   352a        adds    r5, #42 ; 0x2a
 8003198:   4a24        ldr r2, [pc, #144]  ; (0x800322c)
 800319a:   f64f 71fb   movw    r1, #65531  ; 0xfffb
 800319e:   6c10        ldr r0, [r2, #64]   ; 0x40
 80031a0:   4001        ands    r1, r0
 80031a2:   6411        str r1, [r2, #64]   ; 0x40
 80031a4:   f44f 413f   mov.w   r1, #48896  ; 0xbf00
 80031a8:   6411        str r1, [r2, #64]   ; 0x40
 80031aa:   2206        movs    r2, #6
 80031ac:   701a        strb    r2, [r3, #0]
 80031ae:   4b20        ldr r3, [pc, #128]  ; (0x8003230)
 80031b0:   681b        ldr r3, [r3, #0]
 80031b2:   7b5a        ldrb    r2, [r3, #13]
 80031b4:   731a        strb    r2, [r3, #12]
 80031b6:   4770        bx  lr
 80031b8:   4a1c        ldr r2, [pc, #112]  ; (0x800322c)
 80031ba:   f64f 71fb   movw    r1, #65531  ; 0xfffb
 80031be:   6c10        ldr r0, [r2, #64]   ; 0x40
 80031c0:   4001        ands    r1, r0
 80031c2:   6411        str r1, [r2, #64]   ; 0x40
 80031c4:   f44f 413f   mov.w   r1, #48896  ; 0xbf00
 80031c8:   6411        str r1, [r2, #64]   ; 0x40
 80031ca:   2204        movs    r2, #4
 80031cc:   e02a        b.n 0x8003224
 80031ce:   2202        movs    r2, #2
 80031d0:   705a        strb    r2, [r3, #1]
 80031d2:   2203        movs    r2, #3
 80031d4:   e026        b.n 0x8003224
 80031d6:   785a        ldrb    r2, [r3, #1]
 80031d8:   3a01        subs    r2, #1
 80031da:   b2d2        uxtb    r2, r2
 80031dc:   705a        strb    r2, [r3, #1]
 80031de:   785b        ldrb    r3, [r3, #1]
 80031e0:   bb0b        cbnz    r3, 0x8003226
 80031e2:   2204        movs    r2, #4
 80031e4:   e01b        b.n 0x800321e
 80031e6:   4a11        ldr r2, [pc, #68]   ; (0x800322c)
 80031e8:   6c11        ldr r1, [r2, #64]   ; 0x40
 80031ea:   b289        uxth    r1, r1
 80031ec:   f041 0110   orr.w   r1, r1, #16
 80031f0:   6411        str r1, [r2, #64]   ; 0x40
 80031f2:   2205        movs    r2, #5
 80031f4:   701a        strb    r2, [r3, #0]
 80031f6:   220a        movs    r2, #10
 80031f8:   705a        strb    r2, [r3, #1]
 80031fa:   4770        bx  lr
 80031fc:   785a        ldrb    r2, [r3, #1]
 80031fe:   3a01        subs    r2, #1
 8003200:   b2d2        uxtb    r2, r2
 8003202:   705a        strb    r2, [r3, #1]
 8003204:   785b        ldrb    r3, [r3, #1]
 8003206:   b973        cbnz    r3, 0x8003226
 8003208:   4a08        ldr r2, [pc, #32]   ; (0x800322c)
 800320a:   f64f 73ef   movw    r3, #65519  ; 0xffef
 800320e:   6c11        ldr r1, [r2, #64]   ; 0x40
 8003210:   400b        ands    r3, r1
 8003212:   6413        str r3, [r2, #64]   ; 0x40
 8003214:   4b06        ldr r3, [pc, #24]   ; (0x8003230)
 8003216:   681b        ldr r3, [r3, #0]
 8003218:   7b5a        ldrb    r2, [r3, #13]
 800321a:   731a        strb    r2, [r3, #12]
 800321c:   2206        movs    r2, #6
 800321e:   4b02        ldr r3, [pc, #8]    ; (0x8003228)
 8003220:   e000        b.n 0x8003224
 8003222:   2206        movs    r2, #6
 8003224:   701a        strb    r2, [r3, #0]
 8003226:   4770        bx  lr
 8003228:   0ac8        lsrs    r0, r1, #11
 800322a:   2000        movs    r0, #0
 800322c:   .word USB_BASE // 0x40005c00
 8003230:   02dc        lsls    r4, r3, #11
 8003232:   2000        movs    r0, #0
 8003234:   b570        push    {r4, r5, r6, lr}
 8003236:   4604        mov r4, r0
 8003238:   7b80        ldrb    r0, [r0, #14]
 800323a:   460d        mov r5, r1
 800323c:   4616        mov r6, r2
 800323e:   f7ff faab   bl  0x8002798
 8003242:   4a08        ldr r2, [pc, #32]   ; (0x8003264)
 8003244:   4b08        ldr r3, [pc, #32]   ; (0x8003268)
 8003246:   4909        ldr r1, [pc, #36]   ; (0x800326c)
 8003248:   601a        str r2, [r3, #0]
 800324a:   4b09        ldr r3, [pc, #36]   ; (0x8003270)
 800324c:   4809        ldr r0, [pc, #36]   ; (0x8003274)
 800324e:   600b        str r3, [r1, #0]
 8003250:   4909        ldr r1, [pc, #36]   ; (0x8003278)
 8003252:   6065        str r5, [r4, #4]
 8003254:   6008        str r0, [r1, #0]
 8003256:   2102        movs    r1, #2
 8003258:   60a6        str r6, [r4, #8]
 800325a:   681b        ldr r3, [r3, #0]
 800325c:   7211        strb    r1, [r2, #8]
 800325e:   4798        blx r3
 8003260:   bd70        pop {r4, r5, r6, pc}
 8003262:   bf00        nop
 8003264:   0ad8        lsrs    r0, r3, #11
 8003266:   2000        movs    r0, #0
 8003268:   0af8        lsrs    r0, r7, #11
 800326a:   2000        movs    r0, #0
 800326c:   0ad0        lsrs    r0, r2, #11
 800326e:   2000        movs    r0, #0
 8003270:   02f8        lsls    r0, r7, #11
 8003272:   2000        movs    r0, #0
 8003274:   0380        lsls    r0, r0, #14
 8003276:   2000        movs    r0, #0
 8003278:   0af4        lsrs    r4, r6, #11
 800327a:   2000        movs    r0, #0
 800327c:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 800327e:   4d6c        ldr r5, [pc, #432]  ; (0x8003430)
 8003280:   4b6c        ldr r3, [pc, #432]  ; (0x8003434)
 8003282:   682a        ldr r2, [r5, #0]
 8003284:   6c5c        ldr r4, [r3, #68]   ; 0x44
 8003286:   6812        ldr r2, [r2, #0]
 8003288:   b2a4        uxth    r4, r4
 800328a:   f402 6280   and.w   r2, r2, #1024   ; 0x400
 800328e:   4222        tst r2, r4
 8003290:   d006        beq.n   0x80032a0
 8003292:   f46f 6280   mvn.w   r2, #1024   ; 0x400
 8003296:   645a        str r2, [r3, #68]   ; 0x44
 8003298:   4b67        ldr r3, [pc, #412]  ; (0x8003438)
 800329a:   681b        ldr r3, [r3, #0]
 800329c:   685b        ldr r3, [r3, #4]
 800329e:   4798        blx r3
 80032a0:   682b        ldr r3, [r5, #0]
 80032a2:   681b        ldr r3, [r3, #0]
 80032a4:   4023        ands    r3, r4
 80032a6:   049f        lsls    r7, r3, #18
 80032a8:   d503        bpl.n   0x80032b2
 80032aa:   4a62        ldr r2, [pc, #392]  ; (0x8003434)
 80032ac:   f46f 5100   mvn.w   r1, #8192   ; 0x2000
 80032b0:   6451        str r1, [r2, #68]   ; 0x44
 80032b2:   04de        lsls    r6, r3, #19
 80032b4:   d506        bpl.n   0x80032c4
 80032b6:   4b5f        ldr r3, [pc, #380]  ; (0x8003434)
 80032b8:   f46f 52c0   mvn.w   r2, #6144   ; 0x1800
 80032bc:   645a        str r2, [r3, #68]   ; 0x44
 80032be:   2000        movs    r0, #0
 80032c0:   f7ff ff5e   bl  0x8003180
 80032c4:   682a        ldr r2, [r5, #0]
 80032c6:   6811        ldr r1, [r2, #0]
 80032c8:   4021        ands    r1, r4
 80032ca:   0508        lsls    r0, r1, #20
 80032cc:   d50f        bpl.n   0x80032ee
 80032ce:   4b59        ldr r3, [pc, #356]  ; (0x8003434)
 80032d0:   6c18        ldr r0, [r3, #64]   ; 0x40
 80032d2:   b280        uxth    r0, r0
 80032d4:   f040 0608   orr.w   r6, r0, #8
 80032d8:   f040 000c   orr.w   r0, r0, #12
 80032dc:   641e        str r6, [r3, #64]   ; 0x40
 80032de:   6418        str r0, [r3, #64]   ; 0x40
 80032e0:   7b10        ldrb    r0, [r2, #12]
 80032e2:   7350        strb    r0, [r2, #13]
 80032e4:   2003        movs    r0, #3
 80032e6:   7310        strb    r0, [r2, #12]
 80032e8:   f46f 52c0   mvn.w   r2, #6144   ; 0x1800
 80032ec:   645a        str r2, [r3, #68]   ; 0x44
 80032ee:   058b        lsls    r3, r1, #22
 80032f0:   d503        bpl.n   0x80032fa
 80032f2:   4b50        ldr r3, [pc, #320]  ; (0x8003434)
 80032f4:   f46f 7200   mvn.w   r2, #512    ; 0x200
 80032f8:   645a        str r2, [r3, #68]   ; 0x44
 80032fa:   05cf        lsls    r7, r1, #23
 80032fc:   d506        bpl.n   0x800330c
 80032fe:   4b4d        ldr r3, [pc, #308]  ; (0x8003434)
 8003300:   f46f 7280   mvn.w   r2, #256    ; 0x100
 8003304:   645a        str r2, [r3, #68]   ; 0x44
 8003306:   2007        movs    r0, #7
 8003308:   f7ff ff3a   bl  0x8003180
 800330c:   682b        ldr r3, [r5, #0]
 800330e:   681b        ldr r3, [r3, #0]
 8003310:   f403 4300   and.w   r3, r3, #32768  ; 0x8000
 8003314:   4223        tst r3, r4
 8003316:   f000 8089   beq.w   0x800342c
 800331a:   4b46        ldr r3, [pc, #280]  ; (0x8003434)
 800331c:   6c5a        ldr r2, [r3, #68]   ; 0x44
 800331e:   0411        lsls    r1, r2, #16
 8003320:   f140 8084   bpl.w   0x800342c
 8003324:   f46f 4100   mvn.w   r1, #32768  ; 0x8000
 8003328:   f012 060f   ands.w  r6, r2, #15
 800332c:   6459        str r1, [r3, #68]   ; 0x44
 800332e:   d158        bne.n   0x80033e2
 8003330:   6819        ldr r1, [r3, #0]
 8003332:   f648 0080   movw    r0, #34944  ; 0x8880
 8003336:   4008        ands    r0, r1
 8003338:   2800        cmp r0, #0
 800333a:   d0ee        beq.n   0x800331a
 800333c:   b288        uxth    r0, r1
 800333e:   4c3f        ldr r4, [pc, #252]  ; (0x800343c)
 8003340:   f400 5540   and.w   r5, r0, #12288  ; 0x3000
 8003344:   8025        strh    r5, [r4, #0]
 8003346:   4d3e        ldr r5, [pc, #248]  ; (0x8003440)
 8003348:   f000 0030   and.w   r0, r0, #48 ; 0x30
 800334c:   8028        strh    r0, [r5, #0]
 800334e:   6818        ldr r0, [r3, #0]
 8003350:   06d6        lsls    r6, r2, #27
 8003352:   f420 4080   bic.w   r0, r0, #16384  ; 0x4000
 8003356:   f020 0070   bic.w   r0, r0, #112    ; 0x70
 800335a:   f440 4000   orr.w   r0, r0, #32768  ; 0x8000
 800335e:   f040 0080   orr.w   r0, r0, #128    ; 0x80
 8003362:   f480 5000   eor.w   r0, r0, #8192   ; 0x2000
 8003366:   6018        str r0, [r3, #0]
 8003368:   6818        ldr r0, [r3, #0]
 800336a:   f420 40e0   bic.w   r0, r0, #28672  ; 0x7000
 800336e:   f020 0040   bic.w   r0, r0, #64 ; 0x40
 8003372:   f440 4000   orr.w   r0, r0, #32768  ; 0x8000
 8003376:   f040 0080   orr.w   r0, r0, #128    ; 0x80
 800337a:   f080 0020   eor.w   r0, r0, #32
 800337e:   6018        str r0, [r3, #0]
 8003380:   d501        bpl.n   0x8003386
 8003382:   0608        lsls    r0, r1, #24
 8003384:   d507        bpl.n   0x8003396
 8003386:   6819        ldr r1, [r3, #0]
 8003388:   f648 720f   movw    r2, #36623  ; 0x8f0f
 800338c:   400a        ands    r2, r1
 800338e:   601a        str r2, [r3, #0]
 8003390:   f000 ff1e   bl  0x80041d0
 8003394:   e00b        b.n 0x80033ae
 8003396:   6818        ldr r0, [r3, #0]
 8003398:   f640 728f   movw    r2, #3983   ; 0xf8f
 800339c:   4002        ands    r2, r0
 800339e:   601a        str r2, [r3, #0]
 80033a0:   050a        lsls    r2, r1, #20
 80033a2:   d502        bpl.n   0x80033aa
 80033a4:   f000 fd2c   bl  0x8003e00
 80033a8:   e001        b.n 0x80033ae
 80033aa:   f000 fe91   bl  0x80040d0
 80033ae:   4b21        ldr r3, [pc, #132]  ; (0x8003434)
 80033b0:   8822        ldrh    r2, [r4, #0]
 80033b2:   6819        ldr r1, [r3, #0]
 80033b4:   8828        ldrh    r0, [r5, #0]
 80033b6:   f421 4180   bic.w   r1, r1, #16384  ; 0x4000
 80033ba:   f021 0170   bic.w   r1, r1, #112    ; 0x70
 80033be:   f441 4100   orr.w   r1, r1, #32768  ; 0x8000
 80033c2:   f041 0180   orr.w   r1, r1, #128    ; 0x80
 80033c6:   4051        eors    r1, r2
 80033c8:   6019        str r1, [r3, #0]
 80033ca:   681a        ldr r2, [r3, #0]
 80033cc:   f422 42e0   bic.w   r2, r2, #28672  ; 0x7000
 80033d0:   f022 0240   bic.w   r2, r2, #64 ; 0x40
 80033d4:   f442 4200   orr.w   r2, r2, #32768  ; 0x8000
 80033d8:   f042 0280   orr.w   r2, r2, #128    ; 0x80
 80033dc:   4042        eors    r2, r0
 80033de:   601a        str r2, [r3, #0]
 80033e0:   bdf8        pop {r3, r4, r5, r6, r7, pc}
 80033e2:   00b4        lsls    r4, r6, #2
 80033e4:   f104 4480   add.w   r4, r4, #1073741824 ; 0x40000000
 80033e8:   f504 44b8   add.w   r4, r4, #23552  ; 0x5c00
 80033ec:   6827        ldr r7, [r4, #0]
 80033ee:   043b        lsls    r3, r7, #16
 80033f0:   d50c        bpl.n   0x800340c
 80033f2:   6822        ldr r2, [r4, #0]
 80033f4:   f640 738f   movw    r3, #3983   ; 0xf8f
 80033f8:   4013        ands    r3, r2
 80033fa:   682a        ldr r2, [r5, #0]
 80033fc:   6023        str r3, [r4, #0]
 80033fe:   6892        ldr r2, [r2, #8]
 8003400:   f106 4380   add.w   r3, r6, #1073741824 ; 0x40000000
 8003404:   3b01        subs    r3, #1
 8003406:   f852 3023   ldr.w   r3, [r2, r3, lsl #2]
 800340a:   4798        blx r3
 800340c:   0638        lsls    r0, r7, #24
 800340e:   d584        bpl.n   0x800331a
 8003410:   6822        ldr r2, [r4, #0]
 8003412:   f648 730f   movw    r3, #36623  ; 0x8f0f
 8003416:   4013        ands    r3, r2
 8003418:   6023        str r3, [r4, #0]
 800341a:   682b        ldr r3, [r5, #0]
 800341c:   f106 4680   add.w   r6, r6, #1073741824 ; 0x40000000
 8003420:   685b        ldr r3, [r3, #4]
 8003422:   3e01        subs    r6, #1
 8003424:   f853 3026   ldr.w   r3, [r3, r6, lsl #2]
 8003428:   4798        blx r3
 800342a:   e776        b.n 0x800331a
 800342c:   bdf8        pop {r3, r4, r5, r6, r7, pc}
 800342e:   bf00        nop
 8003430:   02dc        lsls    r4, r3, #11
 8003432:   2000        movs    r0, #0
 8003434:   .word USB_BASE // 0x40005c00
 8003438:   0ad0        lsrs    r0, r2, #11
 800343a:   2000        movs    r0, #0
 800343c:   0ac4        lsrs    r4, r0, #11
 800343e:   2000        movs    r0, #0
 8003440:   0ac6        lsrs    r6, r0, #11
 8003442:   2000        movs    r0, #0
 8003444:   0080        lsls    r0, r0, #2
 8003446:   f100 4080   add.w   r0, r0, #1073741824 ; 0x40000000
 800344a:   f500 40b8   add.w   r0, r0, #23552  ; 0x5c00
 800344e:   6803        ldr r3, [r0, #0]
 8003450:   f423 4380   bic.w   r3, r3, #16384  ; 0x4000
 8003454:   f023 0370   bic.w   r3, r3, #112    ; 0x70
 8003458:   f443 4300   orr.w   r3, r3, #32768  ; 0x8000
 800345c:   f043 0380   orr.w   r3, r3, #128    ; 0x80
 8003460:   4059        eors    r1, r3
 8003462:   6001        str r1, [r0, #0]
 8003464:   4770        bx  lr
 8003466:   0000        movs    r0, r0
 8003468:   b918        cbnz    r0, 0x8003472
 800346a:   4b03        ldr r3, [pc, #12]   ; (0x8003478)
 800346c:   2207        movs    r2, #7
 800346e:   681b        ldr r3, [r3, #0]
 8003470:   821a        strh    r2, [r3, #16]
 8003472:   4802        ldr r0, [pc, #8]    ; (0x800347c)
 8003474:   4770        bx  lr
 8003476:   bf00        nop
 8003478:   0af8        lsrs    r0, r7, #11
 800347a:   2000        movs    r0, #0
 800347c:   0378        lsls    r0, r7, #13
 800347e:   2000        movs    r0, #0
 8003480:   b537        push    {r0, r1, r2, r4, r5, lr}
 8003482:   4b11        ldr r3, [pc, #68]   ; (0x80034c8)
 8003484:   681a        ldr r2, [r3, #0]
 8003486:   461d        mov r5, r3
 8003488:   7812        ldrb    r2, [r2, #0]
 800348a:   f002 027f   and.w   r2, r2, #127    ; 0x7f
 800348e:   2a21        cmp r2, #33 ; 0x21
 8003490:   d001        beq.n   0x8003496
 8003492:   2002        movs    r0, #2
 8003494:   e016        b.n 0x80034c4
 8003496:   f1a0 0320   sub.w   r3, r0, #32
 800349a:   2b01        cmp r3, #1
 800349c:   4b0b        ldr r3, [pc, #44]   ; (0x80034cc)
 800349e:   4c0c        ldr r4, [pc, #48]   ; (0x80034d0)
 80034a0:   681b        ldr r3, [r3, #0]
 80034a2:   bf88        it  hi
 80034a4:   2400        movhi   r4, #0
 80034a6:   b123        cbz r3, 0x80034b2
 80034a8:   a902        add r1, sp, #8
 80034aa:   f801 0d01   strb.w  r0, [r1, #-1]!
 80034ae:   2002        movs    r0, #2
 80034b0:   4798        blx r3
 80034b2:   2c00        cmp r4, #0
 80034b4:   d0ed        beq.n   0x8003492
 80034b6:   682b        ldr r3, [r5, #0]
 80034b8:   2500        movs    r5, #0
 80034ba:   4628        mov r0, r5
 80034bc:   619c        str r4, [r3, #24]
 80034be:   825d        strh    r5, [r3, #18]
 80034c0:   47a0        blx r4
 80034c2:   4628        mov r0, r5
 80034c4:   b003        add sp, #12
 80034c6:   bd30        pop {r4, r5, pc}
 80034c8:   0af8        lsrs    r0, r7, #11
 80034ca:   2000        movs    r0, #0
 80034cc:   0ab0        lsrs    r0, r6, #10
 80034ce:   2000        movs    r0, #0
 80034d0:   3469        adds    r4, #105    ; 0x69
 80034d2:   0800        lsrs    r0, r0, #32
 80034d4:   b513        push    {r0, r1, r4, lr}
 80034d6:   4b10        ldr r3, [pc, #64]   ; (0x8003518)
 80034d8:   681b        ldr r3, [r3, #0]
 80034da:   781a        ldrb    r2, [r3, #0]
 80034dc:   f002 027f   and.w   r2, r2, #127    ; 0x7f
 80034e0:   2a21        cmp r2, #33 ; 0x21
 80034e2:   d114        bne.n   0x800350e
 80034e4:   2802        cmp r0, #2
 80034e6:   d006        beq.n   0x80034f6
 80034e8:   2822        cmp r0, #34 ; 0x22
 80034ea:   d106        bne.n   0x80034fa
 80034ec:   789a        ldrb    r2, [r3, #2]
 80034ee:   4b0b        ldr r3, [pc, #44]   ; (0x800351c)
 80034f0:   f002 0203   and.w   r2, r2, #3
 80034f4:   701a        strb    r2, [r3, #0]
 80034f6:   2400        movs    r4, #0
 80034f8:   e000        b.n 0x80034fc
 80034fa:   2402        movs    r4, #2
 80034fc:   4b08        ldr r3, [pc, #32]   ; (0x8003520)
 80034fe:   681b        ldr r3, [r3, #0]
 8003500:   b133        cbz r3, 0x8003510
 8003502:   a902        add r1, sp, #8
 8003504:   f801 0d01   strb.w  r0, [r1, #-1]!
 8003508:   2002        movs    r0, #2
 800350a:   4798        blx r3
 800350c:   e000        b.n 0x8003510
 800350e:   2402        movs    r4, #2
 8003510:   4620        mov r0, r4
 8003512:   b002        add sp, #8
 8003514:   bd10        pop {r4, pc}
 8003516:   bf00        nop
 8003518:   0af8        lsrs    r0, r7, #11
 800351a:   2000        movs    r0, #0
 800351c:   089d        lsrs    r5, r3, #2
 800351e:   2000        movs    r0, #0
 8003520:   0ab0        lsrs    r0, r6, #10
 8003522:   2000        movs    r0, #0
 8003524:   b921        cbnz    r1, 0x8003530
 8003526:   2802        cmp r0, #2
 8003528:   bf34        ite cc
 800352a:   2000        movcc   r0, #0
 800352c:   2002        movcs   r0, #2
 800352e:   4770        bx  lr
 8003530:   2002        movs    r0, #2
 8003532:   4770        bx  lr
 8003534:   4b04        ldr r3, [pc, #16]   ; (0x8003548)
 8003536:   681b        ldr r3, [r3, #0]
 8003538:   7a9b        ldrb    r3, [r3, #10]
 800353a:   b11b        cbz r3, 0x8003544
 800353c:   4b03        ldr r3, [pc, #12]   ; (0x800354c)
 800353e:   2205        movs    r2, #5
 8003540:   681b        ldr r3, [r3, #0]
 8003542:   731a        strb    r2, [r3, #12]
 8003544:   4770        bx  lr
 8003546:   bf00        nop
 8003548:   0af8        lsrs    r0, r7, #11
 800354a:   2000        movs    r0, #0
 800354c:   02dc        lsls    r4, r3, #11
 800354e:   2000        movs    r0, #0
 8003550:   4b02        ldr r3, [pc, #8]    ; (0x800355c)
 8003552:   2204        movs    r2, #4
 8003554:   681b        ldr r3, [r3, #0]
 8003556:   731a        strb    r2, [r3, #12]
 8003558:   4770        bx  lr
 800355a:   bf00        nop
 800355c:   02dc        lsls    r4, r3, #11
 800355e:   2000        movs    r0, #0
 8003560:   4b05        ldr r3, [pc, #20]   ; (0x8003578)
 8003562:   681b        ldr r3, [r3, #0]
 8003564:   789b        ldrb    r3, [r3, #2]
 8003566:   2b03        cmp r3, #3
 8003568:   d804        bhi.n   0x8003574
 800356a:   4904        ldr r1, [pc, #16]   ; (0x800357c)
 800356c:   eb01 01c3   add.w   r1, r1, r3, lsl #3
 8003570:   f000 bc18   b.w 0x8003da4
 8003574:   2000        movs    r0, #0
 8003576:   4770        bx  lr
 8003578:   0af8        lsrs    r0, r7, #11
 800357a:   2000        movs    r0, #0
 800357c:   0344        lsls    r4, r0, #13
 800357e:   2000        movs    r0, #0
 8003580:   4901        ldr r1, [pc, #4]    ; (0x8003588)
 8003582:   f000 bc0f   b.w 0x8003da4
 8003586:   bf00        nop
 8003588:   02f0        lsls    r0, r6, #11
 800358a:   2000        movs    r0, #0
 800358c:   4901        ldr r1, [pc, #4]    ; (0x8003594)
 800358e:   f000 bc09   b.w 0x8003da4
 8003592:   bf00        nop
 8003594:   03a4        lsls    r4, r4, #14
 8003596:   2000        movs    r0, #0
 8003598:   4b0c        ldr r3, [pc, #48]   ; (0x80035cc)
 800359a:   2200        movs    r2, #0
 800359c:   681b        ldr r3, [r3, #0]
 800359e:   2101        movs    r1, #1
 80035a0:   729a        strb    r2, [r3, #10]
 80035a2:   4b0b        ldr r3, [pc, #44]   ; (0x80035d0)
 80035a4:   f44f 50e0   mov.w   r0, #7168   ; 0x1c00
 80035a8:   6419        str r1, [r3, #64]   ; 0x40
 80035aa:   490a        ldr r1, [pc, #40]   ; (0x80035d4)
 80035ac:   6809        ldr r1, [r1, #0]
 80035ae:   641a        str r2, [r3, #64]   ; 0x40
 80035b0:   645a        str r2, [r3, #68]   ; 0x44
 80035b2:   6418        str r0, [r3, #64]   ; 0x40
 80035b4:   f44f 403f   mov.w   r0, #48896  ; 0xbf00
 80035b8:   645a        str r2, [r3, #68]   ; 0x44
 80035ba:   6008        str r0, [r1, #0]
 80035bc:   6418        str r0, [r3, #64]   ; 0x40
 80035be:   4b06        ldr r3, [pc, #24]   ; (0x80035d8)
 80035c0:   f44f 1080   mov.w   r0, #1048576    ; 0x100000
 80035c4:   6018        str r0, [r3, #0]
 80035c6:   730a        strb    r2, [r1, #12]
 80035c8:   4770        bx  lr
 80035ca:   bf00        nop
 80035cc:   0af8        lsrs    r0, r7, #11
 80035ce:   2000        movs    r0, #0
 80035d0:   .word USB_BASE // 0x40005c00
 80035d4:   02dc        lsls    r4, r3, #11
 80035d6:   2000        movs    r0, #0
 80035d8:   e100        b.n 0x80037dc
 80035da:   e000        b.n 0x80035de
 80035dc:   4920        ldr r1, [pc, #128]  ; (0x8003660)
 80035de:   4b21        ldr r3, [pc, #132]  ; (0x8003664)
 80035e0:   680a        ldr r2, [r1, #0]
 80035e2:   681b        ldr r3, [r3, #0]
 80035e4:   b570        push    {r4, r5, r6, lr}
 80035e6:   1a9b        subs    r3, r3, r2
 80035e8:   f013 03ff   ands.w  r3, r3, #255    ; 0xff
 80035ec:   460e        mov r6, r1
 80035ee:   491e        ldr r1, [pc, #120]  ; (0x8003668)
 80035f0:   d105        bne.n   0x80035fe
 80035f2:   780a        ldrb    r2, [r1, #0]
 80035f4:   3a01        subs    r2, #1
 80035f6:   b2d2        uxtb    r2, r2
 80035f8:   700a        strb    r2, [r1, #0]
 80035fa:   b1fa        cbz r2, 0x800363c
 80035fc:   bd70        pop {r4, r5, r6, pc}
 80035fe:   2001        movs    r0, #1
 8003600:   7008        strb    r0, [r1, #0]
 8003602:   2100        movs    r1, #0
 8003604:   4819        ldr r0, [pc, #100]  ; (0x800366c)
 8003606:   2b40        cmp r3, #64 ; 0x40
 8003608:   bf28        it  cs
 800360a:   2340        movcs   r3, #64 ; 0x40
 800360c:   460c        mov r4, r1
 800360e:   4d18        ldr r5, [pc, #96]   ; (0x8003670)
 8003610:   f011 0f01   tst.w   r1, #1
 8003614:   5cad        ldrb    r5, [r5, r2]
 8003616:   f101 0101   add.w   r1, r1, #1
 800361a:   b2ed        uxtb    r5, r5
 800361c:   bf1c        itt ne
 800361e:   ea44 2505   orrne.w r5, r4, r5, lsl #8
 8003622:   6005        strne   r5, [r0, #0]
 8003624:   f102 0201   add.w   r2, r2, #1
 8003628:   bf0c        ite eq
 800362a:   462c        moveq   r4, r5
 800362c:   3004        addne   r0, #4
 800362e:   4299        cmp r1, r3
 8003630:   b2d2        uxtb    r2, r2
 8003632:   d1ec        bne.n   0x800360e
 8003634:   07d9        lsls    r1, r3, #31
 8003636:   bf48        it  mi
 8003638:   6004        strmi   r4, [r0, #0]
 800363a:   6032        str r2, [r6, #0]
 800363c:   4a0d        ldr r2, [pc, #52]   ; (0x8003674)
 800363e:   490e        ldr r1, [pc, #56]   ; (0x8003678)
 8003640:   6d10        ldr r0, [r2, #80]   ; 0x50
 8003642:   0040        lsls    r0, r0, #1
 8003644:   500b        str r3, [r1, r0]
 8003646:   6853        ldr r3, [r2, #4]
 8003648:   f423 43e0   bic.w   r3, r3, #28672  ; 0x7000
 800364c:   f023 0340   bic.w   r3, r3, #64 ; 0x40
 8003650:   f443 4300   orr.w   r3, r3, #32768  ; 0x8000
 8003654:   f043 0380   orr.w   r3, r3, #128    ; 0x80
 8003658:   f083 0330   eor.w   r3, r3, #48 ; 0x30
 800365c:   6053        str r3, [r2, #4]
 800365e:   bd70        pop {r4, r5, r6, pc}
 8003660:   0ab8        lsrs    r0, r7, #10
 8003662:   2000        movs    r0, #0
 8003664:   09a0        lsrs    r0, r4, #6
 8003666:   2000        movs    r0, #0
 8003668:   0aa8        lsrs    r0, r5, #10
 800366a:   2000        movs    r0, #0
 800366c:   6180        str r0, [r0, #24]
 800366e:   4000        ands    r0, r0
 8003670:   089e        lsrs    r6, r3, #2
 8003672:   2000        movs    r0, #0
 8003674:   .word USB_BASE // 0x40005c00
 8003678:   6014        str r4, [r2, #0]
 800367a:   4000        ands    r0, r0
 800367c:   e92d 43f8   stmdb   sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8003680:   4b49        ldr r3, [pc, #292]  ; (0x80037a8)
 8003682:   4c4a        ldr r4, [pc, #296]  ; (0x80037ac)
 8003684:   681b        ldr r3, [r3, #0]
 8003686:   2500        movs    r5, #0
 8003688:   f04f 08c0   mov.w   r8, #192    ; 0xc0
 800368c:   729d        strb    r5, [r3, #10]
 800368e:   f883 8009   strb.w  r8, [r3, #9]
 8003692:   6525        str r5, [r4, #80]   ; 0x50
 8003694:   6823        ldr r3, [r4, #0]
 8003696:   f648 168f   movw    r6, #35215  ; 0x898f
 800369a:   4033        ands    r3, r6
 800369c:   f443 7300   orr.w   r3, r3, #512    ; 0x200
 80036a0:   6023        str r3, [r4, #0]
 80036a2:   6823        ldr r3, [r4, #0]
 80036a4:   f248 0780   movw    r7, #32896  ; 0x8080
 80036a8:   f423 43e0   bic.w   r3, r3, #28672  ; 0x7000
 80036ac:   f023 0340   bic.w   r3, r3, #64 ; 0x40
 80036b0:   433b        orrs    r3, r7
 80036b2:   f083 0310   eor.w   r3, r3, #16
 80036b6:   6023        str r3, [r4, #0]
 80036b8:   6d22        ldr r2, [r4, #80]   ; 0x50
 80036ba:   4b3d        ldr r3, [pc, #244]  ; (0x80037b0)
 80036bc:   0052        lsls    r2, r2, #1
 80036be:   f04f 0940   mov.w   r9, #64 ; 0x40
 80036c2:   f843 9002   str.w   r9, [r3, r2]
 80036c6:   6d23        ldr r3, [r4, #80]   ; 0x50
 80036c8:   2280        movs    r2, #128    ; 0x80
 80036ca:   005b        lsls    r3, r3, #1
            // r3 += USB_PMA_BASE
 80036cc:   f103 4380   add.w   r3, r3, #1073741824 ; 0x40000000
 80036d0:   f503 43c0   add.w   r3, r3, #24576  ; 0x6000
 80036d4:   601a        str r2, [r3, #0]
 80036d6:   6823        ldr r3, [r4, #0]
 80036d8:   4628        mov r0, r5
 80036da:   f423 43e2   bic.w   r3, r3, #28928  ; 0x7100
 80036de:   f023 0370   bic.w   r3, r3, #112    ; 0x70
 80036e2:   041b        lsls    r3, r3, #16
 80036e4:   0c1b        lsrs    r3, r3, #16
 80036e6:   6023        str r3, [r4, #0]
 80036e8:   4b32        ldr r3, [pc, #200]  ; (0x80037b4)
 80036ea:   681b        ldr r3, [r3, #0]
 80036ec:   f893 102c   ldrb.w  r1, [r3, #44]   ; 0x2c
 80036f0:   f000 f97c   bl  0x80039ec
 80036f4:   4628        mov r0, r5
 80036f6:   f44f 5140   mov.w   r1, #12288  ; 0x3000
 80036fa:   f7ff fea3   bl  0x8003444
 80036fe:   68a3        ldr r3, [r4, #8]
 8003700:   2002        movs    r0, #2
 8003702:   4033        ands    r3, r6
 8003704:   f443 63c0   orr.w   r3, r3, #1536   ; 0x600
 8003708:   60a3        str r3, [r4, #8]
 800370a:   6d22        ldr r2, [r4, #80]   ; 0x50
 800370c:   4b2a        ldr r3, [pc, #168]  ; (0x80037b8)
 800370e:   0052        lsls    r2, r2, #1
 8003710:   4413        add r3, r2
 8003712:   f44f 7280   mov.w   r2, #256    ; 0x100
 8003716:   601a        str r2, [r3, #0]
 8003718:   68a3        ldr r3, [r4, #8]
 800371a:   4629        mov r1, r5
 800371c:   f423 43e0   bic.w   r3, r3, #28672  ; 0x7000
 8003720:   f023 0340   bic.w   r3, r3, #64 ; 0x40
 8003724:   433b        orrs    r3, r7
 8003726:   f083 0320   eor.w   r3, r3, #32
 800372a:   60a3        str r3, [r4, #8]
 800372c:   f7ff fe8a   bl  0x8003444
 8003730:   68e3        ldr r3, [r4, #12]
 8003732:   2003        movs    r0, #3
 8003734:   4033        ands    r3, r6
 8003736:   60e3        str r3, [r4, #12]
 8003738:   6d22        ldr r2, [r4, #80]   ; 0x50
 800373a:   4b20        ldr r3, [pc, #128]  ; (0x80037bc)
 800373c:   0052        lsls    r2, r2, #1
 800373e:   4413        add r3, r2
 8003740:   f44f 7288   mov.w   r2, #272    ; 0x110
 8003744:   601a        str r2, [r3, #0]
 8003746:   4649        mov r1, r9
 8003748:   f000 f950   bl  0x80039ec
 800374c:   2003        movs    r0, #3
 800374e:   f44f 5140   mov.w   r1, #12288  ; 0x3000
 8003752:   f7ff fe77   bl  0x8003444
 8003756:   6863        ldr r3, [r4, #4]
 8003758:   2001        movs    r0, #1
 800375a:   401e        ands    r6, r3
 800375c:   6066        str r6, [r4, #4]
 800375e:   6d22        ldr r2, [r4, #80]   ; 0x50
 8003760:   4b17        ldr r3, [pc, #92]   ; (0x80037c0)
 8003762:   0052        lsls    r2, r2, #1
 8003764:   f843 8002   str.w   r8, [r3, r2]
 8003768:   6863        ldr r3, [r4, #4]
 800376a:   4629        mov r1, r5
 800376c:   f423 43e0   bic.w   r3, r3, #28672  ; 0x7000
 8003770:   f023 0340   bic.w   r3, r3, #64 ; 0x40
 8003774:   433b        orrs    r3, r7
 8003776:   f083 0320   eor.w   r3, r3, #32
 800377a:   6063        str r3, [r4, #4]
 800377c:   f7ff fe62   bl  0x8003444
 8003780:   4b10        ldr r3, [pc, #64]   ; (0x80037c4)
 8003782:   2201        movs    r2, #1
 8003784:   681b        ldr r3, [r3, #0]
 8003786:   4628        mov r0, r5
 8003788:   731a        strb    r2, [r3, #12]
 800378a:   f000 fd05   bl  0x8004198
 800378e:   4b0e        ldr r3, [pc, #56]   ; (0x80037c8)
 8003790:   22ff        movs    r2, #255    ; 0xff
 8003792:   601d        str r5, [r3, #0]
 8003794:   4b0d        ldr r3, [pc, #52]   ; (0x80037cc)
 8003796:   601d        str r5, [r3, #0]
 8003798:   4b0d        ldr r3, [pc, #52]   ; (0x80037d0)
 800379a:   601d        str r5, [r3, #0]
 800379c:   4b0d        ldr r3, [pc, #52]   ; (0x80037d4)
 800379e:   601d        str r5, [r3, #0]
 80037a0:   4b0d        ldr r3, [pc, #52]   ; (0x80037d8)
 80037a2:   701a        strb    r2, [r3, #0]
 80037a4:   e8bd 83f8   ldmia.w sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 80037a8:   0af8        lsrs    r0, r7, #11
 80037aa:   2000        movs    r0, #0
 80037ac:   .word USB_BASE // 0x40005c00
 80037b0:   6008        str r0, [r1, #0]
 80037b2:   4000        ands    r0, r0
 80037b4:   0ad0        lsrs    r0, r2, #11
 80037b6:   2000        movs    r0, #0
 80037b8:   6020        str r0, [r4, #0]
 80037ba:   4000        ands    r0, r0
 80037bc:   6038        str r0, [r7, #0]
 80037be:   4000        ands    r0, r0
 80037c0:   6010        str r0, [r2, #0]
 80037c2:   4000        ands    r0, r0
 80037c4:   02dc        lsls    r4, r3, #11
 80037c6:   2000        movs    r0, #0
 80037c8:   0ab4        lsrs    r4, r6, #10
 80037ca:   2000        movs    r0, #0
 80037cc:   0aac        lsrs    r4, r5, #10
 80037ce:   2000        movs    r0, #0
 80037d0:   09a0        lsrs    r0, r4, #6
 80037d2:   2000        movs    r0, #0
 80037d4:   0ab8        lsrs    r0, r7, #10
 80037d6:   2000        movs    r0, #0
 80037d8:   0aa8        lsrs    r0, r5, #10
 80037da:   2000        movs    r0, #0
 80037dc:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 80037de:   4a18        ldr r2, [pc, #96]   ; (0x8003840)
 80037e0:   4c18        ldr r4, [pc, #96]   ; (0x8003844)
 80037e2:   6823        ldr r3, [r4, #0]
 80037e4:   6d11        ldr r1, [r2, #80]   ; 0x50
 80037e6:   f202 423c   addw    r2, r2, #1084   ; 0x43c
 80037ea:   0049        lsls    r1, r1, #1
 80037ec:   5856        ldr r6, [r2, r1]
 80037ee:   2200        movs    r2, #0
 80037f0:   4915        ldr r1, [pc, #84]   ; (0x8003848)
 80037f2:   f3c6 0609   ubfx    r6, r6, #0, #10
 80037f6:   4610        mov r0, r2
 80037f8:   4625        mov r5, r4
 80037fa:   42b2        cmp r2, r6
 80037fc:   d20d        bcs.n   0x800381a
 80037fe:   07d4        lsls    r4, r2, #31
 8003800:   d501        bpl.n   0x8003806
 8003802:   0a04        lsrs    r4, r0, #8
 8003804:   e003        b.n 0x800380e
 8003806:   680c        ldr r4, [r1, #0]
 8003808:   3104        adds    r1, #4
 800380a:   b2a0        uxth    r0, r4
 800380c:   b2e4        uxtb    r4, r4
 800380e:   4f0f        ldr r7, [pc, #60]   ; (0x800384c)
 8003810:   3201        adds    r2, #1
 8003812:   54fc        strb    r4, [r7, r3]
 8003814:   3301        adds    r3, #1
 8003816:   b2db        uxtb    r3, r3
 8003818:   e7ef        b.n 0x80037fa
 800381a:   4a0d        ldr r2, [pc, #52]   ; (0x8003850)
 800381c:   602b        str r3, [r5, #0]
 800381e:   6812        ldr r2, [r2, #0]
 8003820:   1a9b        subs    r3, r3, r2
 8003822:   b2db        uxtb    r3, r3
 8003824:   2bbf        cmp r3, #191    ; 0xbf
 8003826:   d804        bhi.n   0x8003832
 8003828:   2003        movs    r0, #3
 800382a:   f44f 5140   mov.w   r1, #12288  ; 0x3000
 800382e:   f7ff fe09   bl  0x8003444
 8003832:   4b08        ldr r3, [pc, #32]   ; (0x8003854)
 8003834:   681b        ldr r3, [r3, #0]
 8003836:   b113        cbz r3, 0x800383e
 8003838:   2001        movs    r0, #1
 800383a:   2100        movs    r1, #0
 800383c:   4798        blx r3
 800383e:   bdf8        pop {r3, r4, r5, r6, r7, pc}
 8003840:   .word USB_BASE // 0x40005c00
 8003844:   0ab4        lsrs    r4, r6, #10
 8003846:   2000        movs    r0, #0
 8003848:   6220        str r0, [r4, #32]
 800384a:   4000        ands    r0, r0
 800384c:   09a8        lsrs    r0, r5, #6
 800384e:   2000        movs    r0, #0
 8003850:   0aac        lsrs    r4, r5, #10
 8003852:   2000        movs    r0, #0
 8003854:   09a4        lsrs    r4, r4, #6
 8003856:   2000        movs    r0, #0
 8003858:   07c2        lsls    r2, r0, #31
 800385a:   bf44        itt mi
 800385c:   4b03        ldrmi   r3, [pc, #12]   ; (0x800386c)
 800385e:   6019        strmi   r1, [r3, #0]
 8003860:   0783        lsls    r3, r0, #30
 8003862:   bf44        itt mi
 8003864:   4b02        ldrmi   r3, [pc, #8]    ; (0x8003870)
 8003866:   6019        strmi   r1, [r3, #0]
 8003868:   4770        bx  lr
 800386a:   bf00        nop
 800386c:   09a4        lsrs    r4, r4, #6
 800386e:   2000        movs    r0, #0
 8003870:   0ab0        lsrs    r0, r6, #10
 8003872:   2000        movs    r0, #0
 8003874:   b538        push    {r3, r4, r5, lr}
 8003876:   460d        mov r5, r1
 8003878:   4604        mov r4, r0
 800387a:   b140        cbz r0, 0x800388e
 800387c:   2203        movs    r2, #3
 800387e:   f7fe fed5   bl  0x800262c
 8003882:   f44f 3280   mov.w   r2, #65536  ; 0x10000
 8003886:   fa02 f505   lsl.w   r5, r2, r5
 800388a:   6823        ldr r3, [r4, #0]
 800388c:   611d        str r5, [r3, #16]
 800388e:   4b04        ldr r3, [pc, #16]   ; (0x80038a0)
 8003890:   4904        ldr r1, [pc, #16]   ; (0x80038a4)
 8003892:   6818        ldr r0, [r3, #0]
 8003894:   4a04        ldr r2, [pc, #16]   ; (0x80038a8)
 8003896:   e8bd 4038   ldmia.w sp!, {r3, r4, r5, lr}
 800389a:   f7ff bccb   b.w 0x8003234
 800389e:   bf00        nop
 80038a0:   02dc        lsls    r4, r3, #11
 80038a2:   2000        movs    r0, #0
 80038a4:   0328        lsls    r0, r5, #12
 80038a6:   2000        movs    r0, #0
 80038a8:   035c        lsls    r4, r3, #13
 80038aa:   2000        movs    r0, #0
 80038ac:   b570        push    {r4, r5, r6, lr}
 80038ae:   460c        mov r4, r1
 80038b0:   b311        cbz r1, 0x80038f8
 80038b2:   4912        ldr r1, [pc, #72]   ; (0x80038fc)
 80038b4:   4a12        ldr r2, [pc, #72]   ; (0x8003900)
 80038b6:   680b        ldr r3, [r1, #0]
 80038b8:   6812        ldr r2, [r2, #0]
 80038ba:   460d        mov r5, r1
 80038bc:   1a9a        subs    r2, r3, r2
 80038be:   b2d2        uxtb    r2, r2
 80038c0:   f1c2 02ff   rsb r2, r2, #255    ; 0xff
 80038c4:   4294        cmp r4, r2
 80038c6:   d901        bls.n   0x80038cc
 80038c8:   b1a2        cbz r2, 0x80038f4
 80038ca:   4614        mov r4, r2
 80038cc:   2200        movs    r2, #0
 80038ce:   b291        uxth    r1, r2
 80038d0:   42a1        cmp r1, r4
 80038d2:   f102 0201   add.w   r2, r2, #1
 80038d6:   d205        bcs.n   0x80038e4
 80038d8:   5c46        ldrb    r6, [r0, r1]
 80038da:   490a        ldr r1, [pc, #40]   ; (0x8003904)
 80038dc:   54ce        strb    r6, [r1, r3]
 80038de:   3301        adds    r3, #1
 80038e0:   b2db        uxtb    r3, r3
 80038e2:   e7f4        b.n 0x80038ce
 80038e4:   602b        str r3, [r5, #0]
 80038e6:   4b08        ldr r3, [pc, #32]   ; (0x8003908)
 80038e8:   781b        ldrb    r3, [r3, #0]
 80038ea:   061b        lsls    r3, r3, #24
 80038ec:   d504        bpl.n   0x80038f8
 80038ee:   f7ff fe75   bl  0x80035dc
 80038f2:   e001        b.n 0x80038f8
 80038f4:   4610        mov r0, r2
 80038f6:   bd70        pop {r4, r5, r6, pc}
 80038f8:   4620        mov r0, r4
 80038fa:   bd70        pop {r4, r5, r6, pc}
 80038fc:   09a0        lsrs    r0, r4, #6
 80038fe:   2000        movs    r0, #0
 8003900:   0ab8        lsrs    r0, r7, #10
 8003902:   2000        movs    r0, #0
 8003904:   089e        lsrs    r6, r3, #2
 8003906:   2000        movs    r0, #0
 8003908:   0aa8        lsrs    r0, r5, #10
 800390a:   2000        movs    r0, #0
 800390c:   4b03        ldr r3, [pc, #12]   ; (0x800391c)
 800390e:   6818        ldr r0, [r3, #0]
 8003910:   4b03        ldr r3, [pc, #12]   ; (0x8003920)
 8003912:   681b        ldr r3, [r3, #0]
 8003914:   1ac0        subs    r0, r0, r3
 8003916:   b2c0        uxtb    r0, r0
 8003918:   4770        bx  lr
 800391a:   bf00        nop
 800391c:   0ab4        lsrs    r4, r6, #10
 800391e:   2000        movs    r0, #0
 8003920:   0aac        lsrs    r4, r5, #10
 8003922:   2000        movs    r0, #0
 8003924:   4b0a        ldr r3, [pc, #40]   ; (0x8003950)
 8003926:   b510        push    {r4, lr}
 8003928:   681a        ldr r2, [r3, #0]
 800392a:   4b0a        ldr r3, [pc, #40]   ; (0x8003954)
 800392c:   681b        ldr r3, [r3, #0]
 800392e:   1a9b        subs    r3, r3, r2
 8003930:   b2db        uxtb    r3, r3
 8003932:   4299        cmp r1, r3
 8003934:   bf28        it  cs
 8003936:   4619        movcs   r1, r3
 8003938:   2300        movs    r3, #0
 800393a:   428b        cmp r3, r1
 800393c:   d006        beq.n   0x800394c
 800393e:   4c06        ldr r4, [pc, #24]   ; (0x8003958)
 8003940:   5ca4        ldrb    r4, [r4, r2]
 8003942:   3201        adds    r2, #1
 8003944:   54c4        strb    r4, [r0, r3]
 8003946:   b2d2        uxtb    r2, r2
 8003948:   3301        adds    r3, #1
 800394a:   e7f6        b.n 0x800393a
 800394c:   4618        mov r0, r3
 800394e:   bd10        pop {r4, pc}
 8003950:   0aac        lsrs    r4, r5, #10
 8003952:   2000        movs    r0, #0
 8003954:   0ab4        lsrs    r4, r6, #10
 8003956:   2000        movs    r0, #0
 8003958:   09a8        lsrs    r0, r5, #6
 800395a:   2000        movs    r0, #0
 800395c:   b510        push    {r4, lr}
 800395e:   f7ff ffe1   bl  0x8003924
 8003962:   4a09        ldr r2, [pc, #36]   ; (0x8003988)
 8003964:   4604        mov r4, r0
 8003966:   6813        ldr r3, [r2, #0]
 8003968:   4403        add r3, r0
 800396a:   b2db        uxtb    r3, r3
 800396c:   6013        str r3, [r2, #0]
 800396e:   4a07        ldr r2, [pc, #28]   ; (0x800398c)
 8003970:   6812        ldr r2, [r2, #0]
 8003972:   1ad3        subs    r3, r2, r3
 8003974:   b2db        uxtb    r3, r3
 8003976:   2b40        cmp r3, #64 ; 0x40
 8003978:   d804        bhi.n   0x8003984
 800397a:   2003        movs    r0, #3
 800397c:   f44f 5140   mov.w   r1, #12288  ; 0x3000
 8003980:   f7ff fd60   bl  0x8003444
 8003984:   4620        mov r0, r4
 8003986:   bd10        pop {r4, pc}
 8003988:   0aac        lsrs    r4, r5, #10
 800398a:   2000        movs    r0, #0
 800398c:   0ab4        lsrs    r4, r6, #10
 800398e:   2000        movs    r0, #0
 8003990:   4b0c        ldr r3, [pc, #48]   ; (0x80039c4)
 8003992:   b530        push    {r4, r5, lr}
 8003994:   681c        ldr r4, [r3, #0]
 8003996:   4b0c        ldr r3, [pc, #48]   ; (0x80039c8)
 8003998:   440c        add r4, r1
 800399a:   681b        ldr r3, [r3, #0]
 800399c:   b2e4        uxtb    r4, r4
 800399e:   1b1b        subs    r3, r3, r4
 80039a0:   b2db        uxtb    r3, r3
 80039a2:   188d        adds    r5, r1, r2
 80039a4:   429d        cmp r5, r3
 80039a6:   bf88        it  hi
 80039a8:   ebc1 0203   rsbhi   r2, r1, r3
 80039ac:   2300        movs    r3, #0
 80039ae:   4293        cmp r3, r2
 80039b0:   d006        beq.n   0x80039c0
 80039b2:   4906        ldr r1, [pc, #24]   ; (0x80039cc)
 80039b4:   5d09        ldrb    r1, [r1, r4]
 80039b6:   3401        adds    r4, #1
 80039b8:   54c1        strb    r1, [r0, r3]
 80039ba:   b2e4        uxtb    r4, r4
 80039bc:   3301        adds    r3, #1
 80039be:   e7f6        b.n 0x80039ae
 80039c0:   4618        mov r0, r3
 80039c2:   bd30        pop {r4, r5, pc}
 80039c4:   0aac        lsrs    r4, r5, #10
 80039c6:   2000        movs    r0, #0
 80039c8:   0ab4        lsrs    r4, r6, #10
 80039ca:   2000        movs    r0, #0
 80039cc:   09a8        lsrs    r0, r5, #6
 80039ce:   2000        movs    r0, #0
 80039d0:   4b02        ldr r3, [pc, #8]    ; (0x80039dc)
 80039d2:   7818        ldrb    r0, [r3, #0]
 80039d4:   f000 0001   and.w   r0, r0, #1
 80039d8:   4770        bx  lr
 80039da:   bf00        nop
 80039dc:   089d        lsrs    r5, r3, #2
 80039de:   2000        movs    r0, #0
 80039e0:   4b01        ldr r3, [pc, #4]    ; (0x80039e8)
 80039e2:   6818        ldr r0, [r3, #0]
 80039e4:   4770        bx  lr
 80039e6:   bf00        nop
 80039e8:   0378        lsls    r0, r7, #13
 80039ea:   2000        movs    r0, #0
 80039ec:   4b0d        ldr r3, [pc, #52]   ; (0x8003a24)
 80039ee:   293e        cmp r1, #62 ; 0x3e
 80039f0:   6d1b        ldr r3, [r3, #80]   ; 0x50
 80039f2:   eb03 00c0   add.w   r0, r3, r0, lsl #3
 80039f6:   4b0c        ldr r3, [pc, #48]   ; (0x8003a28)
 80039f8:   ea4f 0040   mov.w   r0, r0, lsl #1
 80039fc:   4403        add r3, r0
 80039fe:   d909        bls.n   0x8003a14
 8003a00:   094a        lsrs    r2, r1, #5
 8003a02:   06c8        lsls    r0, r1, #27
 8003a04:   bf04        itt eq
 8003a06:   f102 32ff   addeq.w r2, r2, #4294967295
 8003a0a:   b292        uxtheq  r2, r2
 8003a0c:   0292        lsls    r2, r2, #10
 8003a0e:   f442 4200   orr.w   r2, r2, #32768  ; 0x8000
 8003a12:   e004        b.n 0x8003a1e
 8003a14:   084a        lsrs    r2, r1, #1
 8003a16:   07c9        lsls    r1, r1, #31
 8003a18:   bf48        it  mi
 8003a1a:   3201        addmi   r2, #1
 8003a1c:   0292        lsls    r2, r2, #10
 8003a1e:   601a        str r2, [r3, #0]
 8003a20:   4770        bx  lr
 8003a22:   bf00        nop
 8003a24:   .word USB_BASE // 0x40005c00
 8003a28:   600c        str r4, [r1, #0]
 8003a2a:   4000        ands    r0, r0
 8003a2c:   b510        push    {r4, lr}
 8003a2e:   4c06        ldr r4, [pc, #24]   ; (0x8003a48)
 8003a30:   b918        cbnz    r0, 0x8003a3a
 8003a32:   6823        ldr r3, [r4, #0]
 8003a34:   2201        movs    r2, #1
 8003a36:   821a        strh    r2, [r3, #16]
 8003a38:   bd10        pop {r4, pc}
 8003a3a:   4b04        ldr r3, [pc, #16]   ; (0x8003a4c)
 8003a3c:   681b        ldr r3, [r3, #0]
 8003a3e:   681b        ldr r3, [r3, #0]
 8003a40:   4798        blx r3
 8003a42:   6820        ldr r0, [r4, #0]
 8003a44:   300a        adds    r0, #10
 8003a46:   bd10        pop {r4, pc}
 8003a48:   0af8        lsrs    r0, r7, #11
 8003a4a:   2000        movs    r0, #0
 8003a4c:   0af4        lsrs    r4, r6, #11
 8003a4e:   2000        movs    r0, #0
 8003a50:   b510        push    {r4, lr}
 8003a52:   4c06        ldr r4, [pc, #24]   ; (0x8003a6c)
 8003a54:   b918        cbnz    r0, 0x8003a5e
 8003a56:   6823        ldr r3, [r4, #0]
 8003a58:   2201        movs    r2, #1
 8003a5a:   821a        strh    r2, [r3, #16]
 8003a5c:   bd10        pop {r4, pc}
 8003a5e:   4b04        ldr r3, [pc, #16]   ; (0x8003a70)
 8003a60:   681b        ldr r3, [r3, #0]
 8003a62:   689b        ldr r3, [r3, #8]
 8003a64:   4798        blx r3
 8003a66:   6820        ldr r0, [r4, #0]
 8003a68:   300c        adds    r0, #12
 8003a6a:   bd10        pop {r4, pc}
 8003a6c:   0af8        lsrs    r0, r7, #11
 8003a6e:   2000        movs    r0, #0
 8003a70:   0af4        lsrs    r4, r6, #11
 8003a72:   2000        movs    r0, #0
 8003a74:   b510        push    {r4, lr}
 8003a76:   4b20        ldr r3, [pc, #128]  ; (0x8003af8)
 8003a78:   b918        cbnz    r0, 0x8003a82
 8003a7a:   681b        ldr r3, [r3, #0]
 8003a7c:   2202        movs    r2, #2
 8003a7e:   821a        strh    r2, [r3, #16]
 8003a80:   bd10        pop {r4, pc}
 8003a82:   4a1e        ldr r2, [pc, #120]  ; (0x8003afc)
 8003a84:   6819        ldr r1, [r3, #0]
 8003a86:   2000        movs    r0, #0
 8003a88:   8010        strh    r0, [r2, #0]
 8003a8a:   780c        ldrb    r4, [r1, #0]
 8003a8c:   4613        mov r3, r2
 8003a8e:   f014 047f   ands.w  r4, r4, #127    ; 0x7f
 8003a92:   d10d        bne.n   0x8003ab0
 8003a94:   7a4a        ldrb    r2, [r1, #9]
 8003a96:   0691        lsls    r1, r2, #26
 8003a98:   bf44        itt mi
 8003a9a:   2102        movmi   r1, #2
 8003a9c:   7019        strbmi  r1, [r3, #0]
 8003a9e:   f012 0f40   tst.w   r2, #64 ; 0x40
 8003aa2:   781a        ldrb    r2, [r3, #0]
 8003aa4:   bf14        ite ne
 8003aa6:   f022 0201   bicne.w r2, r2, #1
 8003aaa:   f042 0201   orreq.w r2, r2, #1
 8003aae:   e014        b.n 0x8003ada
 8003ab0:   2c01        cmp r4, #1
 8003ab2:   d01f        beq.n   0x8003af4
 8003ab4:   2c02        cmp r4, #2
 8003ab6:   d11e        bne.n   0x8003af6
 8003ab8:   7909        ldrb    r1, [r1, #4]
 8003aba:   f001 020f   and.w   r2, r1, #15
 8003abe:   0092        lsls    r2, r2, #2
 8003ac0:   f102 4280   add.w   r2, r2, #1073741824 ; 0x40000000
 8003ac4:   f502 42b8   add.w   r2, r2, #23552  ; 0x5c00
 8003ac8:   f011 0f80   tst.w   r1, #128    ; 0x80
 8003acc:   6812        ldr r2, [r2, #0]
 8003ace:   d006        beq.n   0x8003ade
 8003ad0:   f002 0230   and.w   r2, r2, #48 ; 0x30
 8003ad4:   2a10        cmp r2, #16
 8003ad6:   d107        bne.n   0x8003ae8
 8003ad8:   2201        movs    r2, #1
 8003ada:   701a        strb    r2, [r3, #0]
 8003adc:   e004        b.n 0x8003ae8
 8003ade:   f402 5240   and.w   r2, r2, #12288  ; 0x3000
 8003ae2:   f5b2 5f80   cmp.w   r2, #4096   ; 0x1000
 8003ae6:   e7f6        b.n 0x8003ad6
 8003ae8:   4b05        ldr r3, [pc, #20]   ; (0x8003b00)
 8003aea:   681b        ldr r3, [r3, #0]
 8003aec:   691b        ldr r3, [r3, #16]
 8003aee:   4798        blx r3
 8003af0:   4802        ldr r0, [pc, #8]    ; (0x8003afc)
 8003af2:   bd10        pop {r4, pc}
 8003af4:   4610        mov r0, r2
 8003af6:   bd10        pop {r4, pc}
 8003af8:   0af8        lsrs    r0, r7, #11
 8003afa:   2000        movs    r0, #0
 8003afc:   0aca        lsrs    r2, r1, #11
 8003afe:   2000        movs    r0, #0
 8003b00:   0af4        lsrs    r4, r6, #11
 8003b02:   2000        movs    r0, #0
 8003b04:   4a23        ldr r2, [pc, #140]  ; (0x8003b94)
 8003b06:   e92d 43f8   stmdb   sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8003b0a:   6814        ldr r4, [r2, #0]
 8003b0c:   4690        mov r8, r2
 8003b0e:   8a23        ldrh    r3, [r4, #16]
 8003b10:   7a26        ldrb    r6, [r4, #8]
 8003b12:   4f21        ldr r7, [pc, #132]  ; (0x8003b98)
 8003b14:   b9a3        cbnz    r3, 0x8003b40
 8003b16:   2e04        cmp r6, #4
 8003b18:   d112        bne.n   0x8003b40
 8003b1a:   4920        ldr r1, [pc, #128]  ; (0x8003b9c)
 8003b1c:   780a        ldrb    r2, [r1, #0]
 8003b1e:   2a01        cmp r2, #1
 8003b20:   d10a        bne.n   0x8003b38
 8003b22:   4a1f        ldr r2, [pc, #124]  ; (0x8003ba0)
 8003b24:   6810        ldr r0, [r2, #0]
 8003b26:   4a1f        ldr r2, [pc, #124]  ; (0x8003ba4)
 8003b28:   b280        uxth    r0, r0
 8003b2a:   4402        add r2, r0
 8003b2c:   0052        lsls    r2, r2, #1
 8003b2e:   6013        str r3, [r2, #0]
 8003b30:   2230        movs    r2, #48 ; 0x30
 8003b32:   803a        strh    r2, [r7, #0]
 8003b34:   700b        strb    r3, [r1, #0]
 8003b36:   e027        b.n 0x8003b88
 8003b38:   2310        movs    r3, #16
 8003b3a:   803b        strh    r3, [r7, #0]
 8003b3c:   2607        movs    r6, #7
 8003b3e:   e023        b.n 0x8003b88
 8003b40:   8aa5        ldrh    r5, [r4, #20]
 8003b42:   42ab        cmp r3, r5
 8003b44:   bf8c        ite hi
 8003b46:   2602        movhi   r6, #2
 8003b48:   2604        movls   r6, #4
 8003b4a:   429d        cmp r5, r3
 8003b4c:   bf28        it  cs
 8003b4e:   461d        movcs   r5, r3
 8003b50:   4628        mov r0, r5
 8003b52:   69a3        ldr r3, [r4, #24]
 8003b54:   4798        blx r3
 8003b56:   4681        mov r9, r0
 8003b58:   2000        movs    r0, #0
 8003b5a:   f000 fbc7   bl  0x80042ec
 8003b5e:   462a        mov r2, r5
 8003b60:   4601        mov r1, r0
 8003b62:   4648        mov r0, r9
 8003b64:   f000 fb63   bl  0x800422e
 8003b68:   4629        mov r1, r5
 8003b6a:   2000        movs    r0, #0
 8003b6c:   f000 fbda   bl  0x8004324
 8003b70:   8a23        ldrh    r3, [r4, #16]
 8003b72:   f44f 5240   mov.w   r2, #12288  ; 0x3000
 8003b76:   1b5b        subs    r3, r3, r5
 8003b78:   8223        strh    r3, [r4, #16]
 8003b7a:   8a63        ldrh    r3, [r4, #18]
 8003b7c:   441d        add r5, r3
 8003b7e:   2330        movs    r3, #48 ; 0x30
 8003b80:   803b        strh    r3, [r7, #0]
 8003b82:   4b09        ldr r3, [pc, #36]   ; (0x8003ba8)
 8003b84:   8265        strh    r5, [r4, #18]
 8003b86:   801a        strh    r2, [r3, #0]
 8003b88:   f8d8 3000   ldr.w   r3, [r8]
 8003b8c:   721e        strb    r6, [r3, #8]
 8003b8e:   e8bd 83f8   ldmia.w sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8003b92:   bf00        nop
 8003b94:   0af8        lsrs    r0, r7, #11
 8003b96:   2000        movs    r0, #0
 8003b98:   0ac6        lsrs    r6, r0, #11
 8003b9a:   2000        movs    r0, #0
 8003b9c:   0abc        lsrs    r4, r7, #10
 8003b9e:   2000        movs    r0, #0
 8003ba0:   .word USB_BASE + USB_BTABLE // 0x40005c50
 8003ba4:   3002        adds    r0, #2
 8003ba6:   2000        movs    r0, #0
 8003ba8:   0ac4        lsrs    r4, r0, #11
 8003baa:   2000        movs    r0, #0
 8003bac:   b510        push    {r4, lr}
 8003bae:   4b0a        ldr r3, [pc, #40]   ; (0x8003bd8)
 8003bb0:   490a        ldr r1, [pc, #40]   ; (0x8003bdc)
 8003bb2:   681b        ldr r3, [r3, #0]
 8003bb4:   7849        ldrb    r1, [r1, #1]
 8003bb6:   789a        ldrb    r2, [r3, #2]
 8003bb8:   4291        cmp r1, r2
 8003bba:   d30a        bcc.n   0x8003bd2
 8003bbc:   78d9        ldrb    r1, [r3, #3]
 8003bbe:   b941        cbnz    r1, 0x8003bd2
 8003bc0:   889c        ldrh    r4, [r3, #4]
 8003bc2:   b934        cbnz    r4, 0x8003bd2
 8003bc4:   729a        strb    r2, [r3, #10]
 8003bc6:   4b06        ldr r3, [pc, #24]   ; (0x8003be0)
 8003bc8:   681b        ldr r3, [r3, #0]
 8003bca:   685b        ldr r3, [r3, #4]
 8003bcc:   4798        blx r3
 8003bce:   4620        mov r0, r4
 8003bd0:   bd10        pop {r4, pc}
 8003bd2:   2002        movs    r0, #2
 8003bd4:   bd10        pop {r4, pc}
 8003bd6:   bf00        nop
 8003bd8:   0af8        lsrs    r0, r7, #11
 8003bda:   2000        movs    r0, #0
 8003bdc:   03ac        lsls    r4, r5, #14
 8003bde:   2000        movs    r0, #0
 8003be0:   0af4        lsrs    r4, r6, #11
 8003be2:   2000        movs    r0, #0
 8003be4:   b538        push    {r3, r4, r5, lr}
 8003be6:   4a0e        ldr r2, [pc, #56]   ; (0x8003c20)
 8003be8:   4c0e        ldr r4, [pc, #56]   ; (0x8003c24)
 8003bea:   6812        ldr r2, [r2, #0]
 8003bec:   6823        ldr r3, [r4, #0]
 8003bee:   6992        ldr r2, [r2, #24]
 8003bf0:   7918        ldrb    r0, [r3, #4]
 8003bf2:   7899        ldrb    r1, [r3, #2]
 8003bf4:   4790        blx r2
 8003bf6:   6823        ldr r3, [r4, #0]
 8003bf8:   7a9a        ldrb    r2, [r3, #10]
 8003bfa:   b17a        cbz r2, 0x8003c1c
 8003bfc:   b970        cbnz    r0, 0x8003c1c
 8003bfe:   795a        ldrb    r2, [r3, #5]
 8003c00:   b962        cbnz    r2, 0x8003c1c
 8003c02:   78dd        ldrb    r5, [r3, #3]
 8003c04:   b955        cbnz    r5, 0x8003c1c
 8003c06:   4b08        ldr r3, [pc, #32]   ; (0x8003c28)
 8003c08:   681b        ldr r3, [r3, #0]
 8003c0a:   68db        ldr r3, [r3, #12]
 8003c0c:   4798        blx r3
 8003c0e:   6823        ldr r3, [r4, #0]
 8003c10:   4628        mov r0, r5
 8003c12:   791a        ldrb    r2, [r3, #4]
 8003c14:   72da        strb    r2, [r3, #11]
 8003c16:   789a        ldrb    r2, [r3, #2]
 8003c18:   731a        strb    r2, [r3, #12]
 8003c1a:   bd38        pop {r3, r4, r5, pc}
 8003c1c:   2002        movs    r0, #2
 8003c1e:   bd38        pop {r3, r4, r5, pc}
 8003c20:   0ad0        lsrs    r0, r2, #11
 8003c22:   2000        movs    r0, #0
 8003c24:   0af8        lsrs    r0, r7, #11
 8003c26:   2000        movs    r0, #0
 8003c28:   0af4        lsrs    r4, r6, #11
 8003c2a:   2000        movs    r0, #0
 8003c2c:   b538        push    {r3, r4, r5, lr}
 8003c2e:   4b2f        ldr r3, [pc, #188]  ; (0x8003cec)
 8003c30:   681b        ldr r3, [r3, #0]
 8003c32:   7818        ldrb    r0, [r3, #0]
 8003c34:   f010 007f   ands.w  r0, r0, #127    ; 0x7f
 8003c38:   d104        bne.n   0x8003c44
 8003c3a:   7a5a        ldrb    r2, [r3, #9]
 8003c3c:   f022 0220   bic.w   r2, r2, #32
 8003c40:   725a        strb    r2, [r3, #9]
 8003c42:   bd38        pop {r3, r4, r5, pc}
 8003c44:   2802        cmp r0, #2
 8003c46:   d14e        bne.n   0x8003ce6
 8003c48:   885a        ldrh    r2, [r3, #2]
 8003c4a:   2a00        cmp r2, #0
 8003c4c:   d14c        bne.n   0x8003ce8
 8003c4e:   795a        ldrb    r2, [r3, #5]
 8003c50:   2a00        cmp r2, #0
 8003c52:   d149        bne.n   0x8003ce8
 8003c54:   791a        ldrb    r2, [r3, #4]
 8003c56:   4d26        ldr r5, [pc, #152]  ; (0x8003cf0)
 8003c58:   f022 0080   bic.w   r0, r2, #128    ; 0x80
 8003c5c:   0084        lsls    r4, r0, #2
 8003c5e:   f104 4180   add.w   r1, r4, #1073741824 ; 0x40000000
 8003c62:   f501 41b8   add.w   r1, r1, #23552  ; 0x5c00
 8003c66:   6809        ldr r1, [r1, #0]
 8003c68:   782d        ldrb    r5, [r5, #0]
 8003c6a:   f012 0f80   tst.w   r2, #128    ; 0x80
 8003c6e:   bf14        ite ne
 8003c70:   f001 0130   andne.w r1, r1, #48 ; 0x30
 8003c74:   f401 5140   andeq.w r1, r1, #12288  ; 0x3000
 8003c78:   42a8        cmp r0, r5
 8003c7a:   d234        bcs.n   0x8003ce6
 8003c7c:   2900        cmp r1, #0
 8003c7e:   d032        beq.n   0x8003ce6
 8003c80:   7a9b        ldrb    r3, [r3, #10]
 8003c82:   b383        cbz r3, 0x8003ce6
 8003c84:   f104 4480   add.w   r4, r4, #1073741824 ; 0x40000000
 8003c88:   f504 44b8   add.w   r4, r4, #23552  ; 0x5c00
 8003c8c:   0612        lsls    r2, r2, #24
 8003c8e:   6823        ldr r3, [r4, #0]
 8003c90:   d50c        bpl.n   0x8003cac
 8003c92:   f003 0330   and.w   r3, r3, #48 ; 0x30
 8003c96:   2b10        cmp r3, #16
 8003c98:   d11f        bne.n   0x8003cda
 8003c9a:   b2c4        uxtb    r4, r0
 8003c9c:   4620        mov r0, r4
 8003c9e:   f000 fb15   bl  0x80042cc
 8003ca2:   4620        mov r0, r4
 8003ca4:   2130        movs    r1, #48 ; 0x30
 8003ca6:   f000 faec   bl  0x8004282
 8003caa:   e016        b.n 0x8003cda
 8003cac:   f403 5340   and.w   r3, r3, #12288  ; 0x3000
 8003cb0:   f5b3 5f80   cmp.w   r3, #4096   ; 0x1000
 8003cb4:   d111        bne.n   0x8003cda
 8003cb6:   b928        cbnz    r0, 0x8003cc4
 8003cb8:   4b0e        ldr r3, [pc, #56]   ; (0x8003cf4)
 8003cba:   f893 102c   ldrb.w  r1, [r3, #44]   ; 0x2c
 8003cbe:   f000 fb3f   bl  0x8004340
 8003cc2:   e001        b.n 0x8003cc8
 8003cc4:   f000 faf2   bl  0x80042ac
 8003cc8:   6823        ldr r3, [r4, #0]
 8003cca:   f423 4380   bic.w   r3, r3, #16384  ; 0x4000
 8003cce:   f023 0370   bic.w   r3, r3, #112    ; 0x70
 8003cd2:   b29b        uxth    r3, r3
 8003cd4:   f483 5340   eor.w   r3, r3, #12288  ; 0x3000
 8003cd8:   6023        str r3, [r4, #0]
 8003cda:   4b07        ldr r3, [pc, #28]   ; (0x8003cf8)
 8003cdc:   681b        ldr r3, [r3, #0]
 8003cde:   695b        ldr r3, [r3, #20]
 8003ce0:   4798        blx r3
 8003ce2:   2000        movs    r0, #0
 8003ce4:   bd38        pop {r3, r4, r5, pc}
 8003ce6:   2002        movs    r0, #2
 8003ce8:   bd38        pop {r3, r4, r5, pc}
 8003cea:   bf00        nop
 8003cec:   0af8        lsrs    r0, r7, #11
 8003cee:   2000        movs    r0, #0
 8003cf0:   03ac        lsls    r4, r5, #14
 8003cf2:   2000        movs    r0, #0
 8003cf4:   02f8        lsls    r0, r7, #11
 8003cf6:   2000        movs    r0, #0
 8003cf8:   0af4        lsrs    r4, r6, #11
 8003cfa:   2000        movs    r0, #0
 8003cfc:   b538        push    {r3, r4, r5, lr}
 8003cfe:   4b1d        ldr r3, [pc, #116]  ; (0x8003d74)
 8003d00:   4d1d        ldr r5, [pc, #116]  ; (0x8003d78)
 8003d02:   6819        ldr r1, [r3, #0]
 8003d04:   782d        ldrb    r5, [r5, #0]
 8003d06:   790a        ldrb    r2, [r1, #4]
 8003d08:   f022 0480   bic.w   r4, r2, #128    ; 0x80
 8003d0c:   00a3        lsls    r3, r4, #2
 8003d0e:   f103 4080   add.w   r0, r3, #1073741824 ; 0x40000000
 8003d12:   f500 40b8   add.w   r0, r0, #23552  ; 0x5c00
 8003d16:   6800        ldr r0, [r0, #0]
 8003d18:   f012 0f80   tst.w   r2, #128    ; 0x80
 8003d1c:   bf14        ite ne
 8003d1e:   f000 0030   andne.w r0, r0, #48 ; 0x30
 8003d22:   f400 5040   andeq.w r0, r0, #12288  ; 0x3000
 8003d26:   42ac        cmp r4, r5
 8003d28:   d222        bcs.n   0x8003d70
 8003d2a:   884c        ldrh    r4, [r1, #2]
 8003d2c:   bb04        cbnz    r4, 0x8003d70
 8003d2e:   b1f8        cbz r0, 0x8003d70
 8003d30:   7a89        ldrb    r1, [r1, #10]
 8003d32:   b1e9        cbz r1, 0x8003d70
 8003d34:   f103 4380   add.w   r3, r3, #1073741824 ; 0x40000000
 8003d38:   f503 43b8   add.w   r3, r3, #23552  ; 0x5c00
 8003d3c:   f012 0f80   tst.w   r2, #128    ; 0x80
 8003d40:   681a        ldr r2, [r3, #0]
 8003d42:   d007        beq.n   0x8003d54
 8003d44:   f422 42e0   bic.w   r2, r2, #28672  ; 0x7000
 8003d48:   f022 0240   bic.w   r2, r2, #64 ; 0x40
 8003d4c:   b292        uxth    r2, r2
 8003d4e:   f082 0210   eor.w   r2, r2, #16
 8003d52:   e006        b.n 0x8003d62
 8003d54:   f422 4280   bic.w   r2, r2, #16384  ; 0x4000
 8003d58:   f022 0270   bic.w   r2, r2, #112    ; 0x70
 8003d5c:   b292        uxth    r2, r2
 8003d5e:   f482 5280   eor.w   r2, r2, #4096   ; 0x1000
 8003d62:   601a        str r2, [r3, #0]
 8003d64:   4b05        ldr r3, [pc, #20]   ; (0x8003d7c)
 8003d66:   681b        ldr r3, [r3, #0]
 8003d68:   699b        ldr r3, [r3, #24]
 8003d6a:   4798        blx r3
 8003d6c:   2000        movs    r0, #0
 8003d6e:   bd38        pop {r3, r4, r5, pc}
 8003d70:   2002        movs    r0, #2
 8003d72:   bd38        pop {r3, r4, r5, pc}
 8003d74:   0af8        lsrs    r0, r7, #11
 8003d76:   2000        movs    r0, #0
 8003d78:   03ac        lsls    r4, r5, #14
 8003d7a:   2000        movs    r0, #0
 8003d7c:   0af4        lsrs    r4, r6, #11
 8003d7e:   2000        movs    r0, #0
 8003d80:   b508        push    {r3, lr}
 8003d82:   4b06        ldr r3, [pc, #24]   ; (0x8003d9c)
 8003d84:   681b        ldr r3, [r3, #0]
 8003d86:   7a5a        ldrb    r2, [r3, #9]
 8003d88:   f042 0220   orr.w   r2, r2, #32
 8003d8c:   725a        strb    r2, [r3, #9]
 8003d8e:   4b04        ldr r3, [pc, #16]   ; (0x8003da0)
 8003d90:   681b        ldr r3, [r3, #0]
 8003d92:   69db        ldr r3, [r3, #28]
 8003d94:   4798        blx r3
 8003d96:   2000        movs    r0, #0
 8003d98:   bd08        pop {r3, pc}
 8003d9a:   bf00        nop
 8003d9c:   0af8        lsrs    r0, r7, #11
 8003d9e:   2000        movs    r0, #0
 8003da0:   0af4        lsrs    r4, r6, #11
 8003da2:   2000        movs    r0, #0
 8003da4:   4b05        ldr r3, [pc, #20]   ; (0x8003dbc)
 8003da6:   681a        ldr r2, [r3, #0]
 8003da8:   8a53        ldrh    r3, [r2, #18]
 8003daa:   b918        cbnz    r0, 0x8003db4
 8003dac:   8889        ldrh    r1, [r1, #4]
 8003dae:   1acb        subs    r3, r1, r3
 8003db0:   8213        strh    r3, [r2, #16]
 8003db2:   4770        bx  lr
 8003db4:   6808        ldr r0, [r1, #0]
 8003db6:   4418        add r0, r3
 8003db8:   4770        bx  lr
 8003dba:   bf00        nop
 8003dbc:   0af8        lsrs    r0, r7, #11
 8003dbe:   2000        movs    r0, #0
 8003dc0:   b508        push    {r3, lr}
 8003dc2:   4b0b        ldr r3, [pc, #44]   ; (0x8003df0)
 8003dc4:   2000        movs    r0, #0
 8003dc6:   f893 102c   ldrb.w  r1, [r3, #44]   ; 0x2c
 8003dca:   f000 fab9   bl  0x8004340
 8003dce:   4b09        ldr r3, [pc, #36]   ; (0x8003df4)
 8003dd0:   681b        ldr r3, [r3, #0]
 8003dd2:   7a18        ldrb    r0, [r3, #8]
 8003dd4:   2808        cmp r0, #8
 8003dd6:   d106        bne.n   0x8003de6
 8003dd8:   4b07        ldr r3, [pc, #28]   ; (0x8003df8)
 8003dda:   f44f 5280   mov.w   r2, #4096   ; 0x1000
 8003dde:   801a        strh    r2, [r3, #0]
 8003de0:   4b06        ldr r3, [pc, #24]   ; (0x8003dfc)
 8003de2:   2210        movs    r2, #16
 8003de4:   801a        strh    r2, [r3, #0]
 8003de6:   f1b0 0309   subs.w  r3, r0, #9
 8003dea:   4258        negs    r0, r3
 8003dec:   4158        adcs    r0, r3
 8003dee:   bd08        pop {r3, pc}
 8003df0:   02f8        lsls    r0, r7, #11
 8003df2:   2000        movs    r0, #0
 8003df4:   0af8        lsrs    r0, r7, #11
 8003df6:   2000        movs    r0, #0
 8003df8:   0ac4        lsrs    r4, r0, #11
 8003dfa:   2000        movs    r0, #0
 8003dfc:   0ac6        lsrs    r6, r0, #11
 8003dfe:   2000        movs    r0, #0
 8003e00:   b573        push    {r0, r1, r4, r5, r6, lr}
 8003e02:   4e93        ldr r6, [pc, #588]  ; (0x8004050)
 8003e04:   4b93        ldr r3, [pc, #588]  ; (0x8004054)
 8003e06:   6832        ldr r2, [r6, #0]
 8003e08:   4d93        ldr r5, [pc, #588]  ; (0x8004058)
 8003e0a:   b292        uxth    r2, r2
 8003e0c:   4413        add r3, r2
 8003e0e:   005b        lsls    r3, r3, #1
 8003e10:   681a        ldr r2, [r3, #0]
 8003e12:   682b        ldr r3, [r5, #0]
 8003e14:   7a19        ldrb    r1, [r3, #8]
 8003e16:   2909        cmp r1, #9
 8003e18:   d00f        beq.n   0x8003e3a
 8003e1a:   b292        uxth    r2, r2
 8003e1c:   0052        lsls    r2, r2, #1
            // r2 += USB_PMA_BASE
 8003e1e:   f102 4280   add.w   r2, r2, #1073741824 ; 0x40000000
 8003e22:   f502 42c0   add.w   r2, r2, #24576  ; 0x6000
 8003e26:   7811        ldrb    r1, [r2, #0]
 8003e28:   7019        strb    r1, [r3, #0]
 8003e2a:   7851        ldrb    r1, [r2, #1]
 8003e2c:   7059        strb    r1, [r3, #1]
 8003e2e:   8891        ldrh    r1, [r2, #4]
 8003e30:   8059        strh    r1, [r3, #2]
 8003e32:   8911        ldrh    r1, [r2, #8]
 8003e34:   8099        strh    r1, [r3, #4]
 8003e36:   8992        ldrh    r2, [r2, #12]
 8003e38:   80da        strh    r2, [r3, #6]
 8003e3a:   2201        movs    r2, #1
 8003e3c:   721a        strb    r2, [r3, #8]
 8003e3e:   88da        ldrh    r2, [r3, #6]
 8003e40:   785c        ldrb    r4, [r3, #1]
 8003e42:   2a00        cmp r2, #0
 8003e44:   d161        bne.n   0x8003f0a
 8003e46:   781a        ldrb    r2, [r3, #0]
 8003e48:   f012 027f   ands.w  r2, r2, #127    ; 0x7f
 8003e4c:   d13a        bne.n   0x8003ec4
 8003e4e:   2c09        cmp r4, #9
 8003e50:   d102        bne.n   0x8003e58
 8003e52:   f7ff feab   bl  0x8003bac
 8003e56:   e044        b.n 0x8003ee2
 8003e58:   2c05        cmp r4, #5
 8003e5a:   d10f        bne.n   0x8003e7c
 8003e5c:   f993 2002   ldrsb.w r2, [r3, #2]
 8003e60:   2a00        cmp r2, #0
 8003e62:   da01        bge.n   0x8003e68
 8003e64:   2308        movs    r3, #8
 8003e66:   e04d        b.n 0x8003f04
 8003e68:   78da        ldrb    r2, [r3, #3]
 8003e6a:   2a00        cmp r2, #0
 8003e6c:   d1fa        bne.n   0x8003e64
 8003e6e:   889a        ldrh    r2, [r3, #4]
 8003e70:   2a00        cmp r2, #0
 8003e72:   d1f7        bne.n   0x8003e64
 8003e74:   7a9b        ldrb    r3, [r3, #10]
 8003e76:   2b00        cmp r3, #0
 8003e78:   d037        beq.n   0x8003eea
 8003e7a:   e7f3        b.n 0x8003e64
 8003e7c:   2c03        cmp r4, #3
 8003e7e:   d113        bne.n   0x8003ea8
 8003e80:   789a        ldrb    r2, [r3, #2]
 8003e82:   2a01        cmp r2, #1
 8003e84:   d007        beq.n   0x8003e96
 8003e86:   4b75        ldr r3, [pc, #468]  ; (0x800405c)
 8003e88:   4620        mov r0, r4
 8003e8a:   681b        ldr r3, [r3, #0]
 8003e8c:   695b        ldr r3, [r3, #20]
 8003e8e:   4798        blx r3
 8003e90:   2803        cmp r0, #3
 8003e92:   d128        bne.n   0x8003ee6
 8003e94:   e035        b.n 0x8003f02
 8003e96:   889a        ldrh    r2, [r3, #4]
 8003e98:   2a00        cmp r2, #0
 8003e9a:   d1f4        bne.n   0x8003e86
 8003e9c:   7a5b        ldrb    r3, [r3, #9]
 8003e9e:   0698        lsls    r0, r3, #26
 8003ea0:   d5f1        bpl.n   0x8003e86
 8003ea2:   f7ff ff6d   bl  0x8003d80
 8003ea6:   e01c        b.n 0x8003ee2
 8003ea8:   2c01        cmp r4, #1
 8003eaa:   d1ec        bne.n   0x8003e86
 8003eac:   789a        ldrb    r2, [r3, #2]
 8003eae:   2a01        cmp r2, #1
 8003eb0:   d1e9        bne.n   0x8003e86
 8003eb2:   889a        ldrh    r2, [r3, #4]
 8003eb4:   2a00        cmp r2, #0
 8003eb6:   d1e6        bne.n   0x8003e86
 8003eb8:   7a5b        ldrb    r3, [r3, #9]
 8003eba:   0699        lsls    r1, r3, #26
 8003ebc:   d5e3        bpl.n   0x8003e86
 8003ebe:   f7ff feb5   bl  0x8003c2c
 8003ec2:   e00e        b.n 0x8003ee2
 8003ec4:   2a01        cmp r2, #1
 8003ec6:   d104        bne.n   0x8003ed2
 8003ec8:   2c0b        cmp r4, #11
 8003eca:   d1dc        bne.n   0x8003e86
 8003ecc:   f7ff fe8a   bl  0x8003be4
 8003ed0:   e007        b.n 0x8003ee2
 8003ed2:   2a02        cmp r2, #2
 8003ed4:   d1d7        bne.n   0x8003e86
 8003ed6:   2c01        cmp r4, #1
 8003ed8:   d0f1        beq.n   0x8003ebe
 8003eda:   2c03        cmp r4, #3
 8003edc:   d1d3        bne.n   0x8003e86
 8003ede:   f7ff ff0d   bl  0x8003cfc
 8003ee2:   b110        cbz r0, 0x8003eea
 8003ee4:   e7cf        b.n 0x8003e86
 8003ee6:   2800        cmp r0, #0
 8003ee8:   d1bc        bne.n   0x8003e64
 8003eea:   6832        ldr r2, [r6, #0]
 8003eec:   4b5c        ldr r3, [pc, #368]  ; (0x8004060)
 8003eee:   b292        uxth    r2, r2
 8003ef0:   4413        add r3, r2
 8003ef2:   005b        lsls    r3, r3, #1
 8003ef4:   2200        movs    r2, #0
 8003ef6:   601a        str r2, [r3, #0]
 8003ef8:   4b5a        ldr r3, [pc, #360]  ; (0x8004064)
 8003efa:   2230        movs    r2, #48 ; 0x30
 8003efc:   801a        strh    r2, [r3, #0]
 8003efe:   2306        movs    r3, #6
 8003f00:   e000        b.n 0x8003f04
 8003f02:   2309        movs    r3, #9
 8003f04:   682a        ldr r2, [r5, #0]
 8003f06:   7213        strb    r3, [r2, #8]
 8003f08:   e0ce        b.n 0x80040a8
 8003f0a:   2c06        cmp r4, #6
 8003f0c:   d113        bne.n   0x8003f36
 8003f0e:   781a        ldrb    r2, [r3, #0]
 8003f10:   0652        lsls    r2, r2, #25
 8003f12:   d177        bne.n   0x8004004
 8003f14:   78da        ldrb    r2, [r3, #3]
 8003f16:   4b51        ldr r3, [pc, #324]  ; (0x800405c)
 8003f18:   2a01        cmp r2, #1
 8003f1a:   d102        bne.n   0x8003f22
 8003f1c:   681b        ldr r3, [r3, #0]
 8003f1e:   69db        ldr r3, [r3, #28]
 8003f20:   e067        b.n 0x8003ff2
 8003f22:   2a02        cmp r2, #2
 8003f24:   d102        bne.n   0x8003f2c
 8003f26:   681b        ldr r3, [r3, #0]
 8003f28:   6a1b        ldr r3, [r3, #32]
 8003f2a:   e062        b.n 0x8003ff2
 8003f2c:   2a03        cmp r2, #3
 8003f2e:   d169        bne.n   0x8004004
 8003f30:   681b        ldr r3, [r3, #0]
 8003f32:   6a5b        ldr r3, [r3, #36]   ; 0x24
 8003f34:   e05d        b.n 0x8003ff2
 8003f36:   2c00        cmp r4, #0
 8003f38:   d13c        bne.n   0x8003fb4
 8003f3a:   8859        ldrh    r1, [r3, #2]
 8003f3c:   2900        cmp r1, #0
 8003f3e:   d161        bne.n   0x8004004
 8003f40:   685a        ldr r2, [r3, #4]
 8003f42:   f022 02ff   bic.w   r2, r2, #255    ; 0xff
 8003f46:   f5b2 3f00   cmp.w   r2, #131072 ; 0x20000
 8003f4a:   d15b        bne.n   0x8004004
 8003f4c:   781a        ldrb    r2, [r3, #0]
 8003f4e:   f012 027f   ands.w  r2, r2, #127    ; 0x7f
 8003f52:   d104        bne.n   0x8003f5e
 8003f54:   889b        ldrh    r3, [r3, #4]
 8003f56:   2b00        cmp r3, #0
 8003f58:   f000 80aa   beq.w   0x80040b0
 8003f5c:   e052        b.n 0x8004004
 8003f5e:   2a01        cmp r2, #1
 8003f60:   d10c        bne.n   0x8003f7c
 8003f62:   4a3e        ldr r2, [pc, #248]  ; (0x800405c)
 8003f64:   7918        ldrb    r0, [r3, #4]
 8003f66:   6812        ldr r2, [r2, #0]
 8003f68:   6992        ldr r2, [r2, #24]
 8003f6a:   4790        blx r2
 8003f6c:   2800        cmp r0, #0
 8003f6e:   d149        bne.n   0x8004004
 8003f70:   682b        ldr r3, [r5, #0]
 8003f72:   7a9b        ldrb    r3, [r3, #10]
 8003f74:   2b00        cmp r3, #0
 8003f76:   f040 809b   bne.w   0x80040b0
 8003f7a:   e043        b.n 0x8004004
 8003f7c:   2a02        cmp r2, #2
 8003f7e:   d141        bne.n   0x8004004
 8003f80:   791b        ldrb    r3, [r3, #4]
 8003f82:   4839        ldr r0, [pc, #228]  ; (0x8004068)
 8003f84:   f003 010f   and.w   r1, r3, #15
 8003f88:   008a        lsls    r2, r1, #2
 8003f8a:   f102 4280   add.w   r2, r2, #1073741824 ; 0x40000000
 8003f8e:   f502 42b8   add.w   r2, r2, #23552  ; 0x5c00
 8003f92:   6812        ldr r2, [r2, #0]
 8003f94:   7800        ldrb    r0, [r0, #0]
 8003f96:   f013 0f80   tst.w   r3, #128    ; 0x80
 8003f9a:   bf14        ite ne
 8003f9c:   f002 0230   andne.w r2, r2, #48 ; 0x30
 8003fa0:   f402 5240   andeq.w r2, r2, #12288  ; 0x3000
 8003fa4:   4281        cmp r1, r0
 8003fa6:   d22d        bcs.n   0x8004004
 8003fa8:   f013 0f70   tst.w   r3, #112    ; 0x70
 8003fac:   d12a        bne.n   0x8004004
 8003fae:   2a00        cmp r2, #0
 8003fb0:   d17e        bne.n   0x80040b0
 8003fb2:   e027        b.n 0x8004004
 8003fb4:   2c08        cmp r4, #8
 8003fb6:   d103        bne.n   0x8003fc0
 8003fb8:   781b        ldrb    r3, [r3, #0]
 8003fba:   065b        lsls    r3, r3, #25
 8003fbc:   d07a        beq.n   0x80040b4
 8003fbe:   e021        b.n 0x8004004
 8003fc0:   2c0a        cmp r4, #10
 8003fc2:   d11f        bne.n   0x8004004
 8003fc4:   781a        ldrb    r2, [r3, #0]
 8003fc6:   f002 027f   and.w   r2, r2, #127    ; 0x7f
 8003fca:   2a01        cmp r2, #1
 8003fcc:   d11a        bne.n   0x8004004
 8003fce:   7a9a        ldrb    r2, [r3, #10]
 8003fd0:   b1c2        cbz r2, 0x8004004
 8003fd2:   8859        ldrh    r1, [r3, #2]
 8003fd4:   b9b1        cbnz    r1, 0x8004004
 8003fd6:   685a        ldr r2, [r3, #4]
 8003fd8:   f022 02ff   bic.w   r2, r2, #255    ; 0xff
 8003fdc:   f5b2 3f80   cmp.w   r2, #65536  ; 0x10000
 8003fe0:   d110        bne.n   0x8004004
 8003fe2:   4a1e        ldr r2, [pc, #120]  ; (0x800405c)
 8003fe4:   7918        ldrb    r0, [r3, #4]
 8003fe6:   6812        ldr r2, [r2, #0]
 8003fe8:   6992        ldr r2, [r2, #24]
 8003fea:   4790        blx r2
 8003fec:   2800        cmp r0, #0
 8003fee:   d063        beq.n   0x80040b8
 8003ff0:   e008        b.n 0x8004004
 8003ff2:   b13b        cbz r3, 0x8004004
 8003ff4:   682a        ldr r2, [r5, #0]
 8003ff6:   2400        movs    r4, #0
 8003ff8:   8254        strh    r4, [r2, #18]
 8003ffa:   6193        str r3, [r2, #24]
 8003ffc:   4620        mov r0, r4
 8003ffe:   4798        blx r3
 8004000:   4620        mov r0, r4
 8004002:   e00a        b.n 0x800401a
 8004004:   4b15        ldr r3, [pc, #84]   ; (0x800405c)
 8004006:   681a        ldr r2, [r3, #0]
 8004008:   682b        ldr r3, [r5, #0]
 800400a:   6912        ldr r2, [r2, #16]
 800400c:   7858        ldrb    r0, [r3, #1]
 800400e:   4790        blx r2
 8004010:   2803        cmp r0, #3
 8004012:   d102        bne.n   0x800401a
 8004014:   4b10        ldr r3, [pc, #64]   ; (0x8004058)
 8004016:   681b        ldr r3, [r3, #0]
 8004018:   e005        b.n 0x8004026
 800401a:   682b        ldr r3, [r5, #0]
 800401c:   f64f 71ff   movw    r1, #65535  ; 0xffff
 8004020:   8a1a        ldrh    r2, [r3, #16]
 8004022:   428a        cmp r2, r1
 8004024:   d101        bne.n   0x800402a
 8004026:   2209        movs    r2, #9
 8004028:   e003        b.n 0x8004032
 800402a:   2802        cmp r0, #2
 800402c:   d000        beq.n   0x8004030
 800402e:   b912        cbnz    r2, 0x8004036
 8004030:   2208        movs    r2, #8
 8004032:   721a        strb    r2, [r3, #8]
 8004034:   e038        b.n 0x80040a8
 8004036:   f993 1000   ldrsb.w r1, [r3]
 800403a:   2900        cmp r1, #0
 800403c:   da2e        bge.n   0x800409c
 800403e:   88d9        ldrh    r1, [r3, #6]
 8004040:   9101        str r1, [sp, #4]
 8004042:   9801        ldr r0, [sp, #4]
 8004044:   4282        cmp r2, r0
 8004046:   4805        ldr r0, [pc, #20]   ; (0x800405c)
 8004048:   d910        bls.n   0x800406c
 800404a:   9a01        ldr r2, [sp, #4]
 800404c:   821a        strh    r2, [r3, #16]
 800404e:   e01e        b.n 0x800408e
 8004050:   .word USB_BASE + USB_BTABLE // 0x40005c50
 8004054:   .word SRAM_3004 // 0x20003004
 8004058:   0af8        lsrs    r0, r7, #11
 800405a:   2000        movs    r0, #0
 800405c:   0ad0        lsrs    r0, r2, #11
 800405e:   2000        movs    r0, #0
 8004060:   3002        adds    r0, #2
 8004062:   2000        movs    r0, #0
 8004064:   0ac6        lsrs    r6, r0, #11
 8004066:   2000        movs    r0, #0
 8004068:   03ac        lsls    r4, r5, #14
 800406a:   2000        movs    r0, #0
 800406c:   428a        cmp r2, r1
 800406e:   d20e        bcs.n   0x800408e
 8004070:   6801        ldr r1, [r0, #0]
 8004072:   f891 102c   ldrb.w  r1, [r1, #44]   ; 0x2c
 8004076:   428a        cmp r2, r1
 8004078:   d201        bcs.n   0x800407e
 800407a:   2100        movs    r1, #0
 800407c:   e005        b.n 0x800408a
 800407e:   fb92 f4f1   sdiv    r4, r2, r1
 8004082:   fb01 2214   mls r2, r1, r4, r2
 8004086:   b912        cbnz    r2, 0x800408e
 8004088:   2101        movs    r1, #1
 800408a:   4a0c        ldr r2, [pc, #48]   ; (0x80040bc)
 800408c:   7011        strb    r1, [r2, #0]
 800408e:   6802        ldr r2, [r0, #0]
 8004090:   f892 202c   ldrb.w  r2, [r2, #44]   ; 0x2c
 8004094:   829a        strh    r2, [r3, #20]
 8004096:   f7ff fd35   bl  0x8003b04
 800409a:   e005        b.n 0x80040a8
 800409c:   2203        movs    r2, #3
 800409e:   721a        strb    r2, [r3, #8]
 80040a0:   4b07        ldr r3, [pc, #28]   ; (0x80040c0)
 80040a2:   f44f 5240   mov.w   r2, #12288  ; 0x3000
 80040a6:   801a        strh    r2, [r3, #0]
 80040a8:   f7ff fe8a   bl  0x8003dc0
 80040ac:   b002        add sp, #8
 80040ae:   bd70        pop {r4, r5, r6, pc}
 80040b0:   4b04        ldr r3, [pc, #16]   ; (0x80040c4)
 80040b2:   e79f        b.n 0x8003ff4
 80040b4:   4b04        ldr r3, [pc, #16]   ; (0x80040c8)
 80040b6:   e79d        b.n 0x8003ff4
 80040b8:   4b04        ldr r3, [pc, #16]   ; (0x80040cc)
 80040ba:   e79b        b.n 0x8003ff4
 80040bc:   0abc        lsrs    r4, r7, #10
 80040be:   2000        movs    r0, #0
 80040c0:   0ac4        lsrs    r4, r0, #11
 80040c2:   2000        movs    r0, #0
 80040c4:   3a75        subs    r2, #117    ; 0x75
 80040c6:   0800        lsrs    r0, r0, #32
 80040c8:   3a2d        subs    r2, #45 ; 0x2d
 80040ca:   0800        lsrs    r0, r0, #32
 80040cc:   3a51        subs    r2, #81 ; 0x51
 80040ce:   0800        lsrs    r0, r0, #32
 80040d0:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 80040d2:   4d2b        ldr r5, [pc, #172]  ; (0x8004180)
 80040d4:   682c        ldr r4, [r5, #0]
 80040d6:   7a23        ldrb    r3, [r4, #8]
 80040d8:   2b03        cmp r3, #3
 80040da:   d001        beq.n   0x80040e0
 80040dc:   2b05        cmp r3, #5
 80040de:   d141        bne.n   0x8004164
 80040e0:   69a3        ldr r3, [r4, #24]
 80040e2:   8a22        ldrh    r2, [r4, #16]
 80040e4:   b1ab        cbz r3, 0x8004112
 80040e6:   b1a2        cbz r2, 0x8004112
 80040e8:   8aa6        ldrh    r6, [r4, #20]
 80040ea:   4296        cmp r6, r2
 80040ec:   bf28        it  cs
 80040ee:   4616        movcs   r6, r2
 80040f0:   4630        mov r0, r6
 80040f2:   4798        blx r3
 80040f4:   8a23        ldrh    r3, [r4, #16]
 80040f6:   4607        mov r7, r0
 80040f8:   1b9b        subs    r3, r3, r6
 80040fa:   8223        strh    r3, [r4, #16]
 80040fc:   8a63        ldrh    r3, [r4, #18]
 80040fe:   2000        movs    r0, #0
 8004100:   4433        add r3, r6
 8004102:   8263        strh    r3, [r4, #18]
 8004104:   f000 f900   bl  0x8004308
 8004108:   4632        mov r2, r6
 800410a:   4601        mov r1, r0
 800410c:   4638        mov r0, r7
 800410e:   f000 f8a6   bl  0x800425e
 8004112:   8a23        ldrh    r3, [r4, #16]
 8004114:   b153        cbz r3, 0x800412c
 8004116:   4b1b        ldr r3, [pc, #108]  ; (0x8004184)
 8004118:   2000        movs    r0, #0
 800411a:   f44f 5240   mov.w   r2, #12288  ; 0x3000
 800411e:   4601        mov r1, r0
 8004120:   801a        strh    r2, [r3, #0]
 8004122:   f000 f8ff   bl  0x8004324
 8004126:   4b18        ldr r3, [pc, #96]   ; (0x8004188)
 8004128:   2230        movs    r2, #48 ; 0x30
 800412a:   801a        strh    r2, [r3, #0]
 800412c:   8a23        ldrh    r3, [r4, #16]
 800412e:   8aa2        ldrh    r2, [r4, #20]
 8004130:   429a        cmp r2, r3
 8004132:   d802        bhi.n   0x800413a
 8004134:   682b        ldr r3, [r5, #0]
 8004136:   2203        movs    r2, #3
 8004138:   e002        b.n 0x8004140
 800413a:   b11b        cbz r3, 0x8004144
 800413c:   682b        ldr r3, [r5, #0]
 800413e:   2205        movs    r2, #5
 8004140:   721a        strb    r2, [r3, #8]
 8004142:   e00c        b.n 0x800415e
 8004144:   682a        ldr r2, [r5, #0]
 8004146:   2106        movs    r1, #6
 8004148:   7211        strb    r1, [r2, #8]
 800414a:   4a10        ldr r2, [pc, #64]   ; (0x800418c)
 800414c:   6811        ldr r1, [r2, #0]
 800414e:   4a10        ldr r2, [pc, #64]   ; (0x8004190)
 8004150:   b289        uxth    r1, r1
 8004152:   440a        add r2, r1
 8004154:   0052        lsls    r2, r2, #1
 8004156:   6013        str r3, [r2, #0]
 8004158:   4b0b        ldr r3, [pc, #44]   ; (0x8004188)
 800415a:   2230        movs    r2, #48 ; 0x30
 800415c:   801a        strh    r2, [r3, #0]
 800415e:   682b        ldr r3, [r5, #0]
 8004160:   7a1b        ldrb    r3, [r3, #8]
 8004162:   e006        b.n 0x8004172
 8004164:   2b07        cmp r3, #7
 8004166:   d103        bne.n   0x8004170
 8004168:   4b0a        ldr r3, [pc, #40]   ; (0x8004194)
 800416a:   681b        ldr r3, [r3, #0]
 800416c:   68db        ldr r3, [r3, #12]
 800416e:   4798        blx r3
 8004170:   2308        movs    r3, #8
 8004172:   682a        ldr r2, [r5, #0]
 8004174:   7213        strb    r3, [r2, #8]
 8004176:   e8bd 40f8   ldmia.w sp!, {r3, r4, r5, r6, r7, lr}
 800417a:   f7ff be21   b.w 0x8003dc0
 800417e:   bf00        nop
 8004180:   0af8        lsrs    r0, r7, #11
 8004182:   2000        movs    r0, #0
 8004184:   0ac4        lsrs    r4, r0, #11
 8004186:   2000        movs    r0, #0
 8004188:   0ac6        lsrs    r6, r0, #11
 800418a:   2000        movs    r0, #0
 800418c:   .word USB_BASE + USB_BTABLE // 0x40005c50
 8004190:   3002        adds    r0, #2
 8004192:   2000        movs    r0, #0
 8004194:   0ad0        lsrs    r0, r2, #11
 8004196:   2000        movs    r0, #0
 8004198:   b530        push    {r4, r5, lr}
 800419a:   4b0b        ldr r3, [pc, #44]   ; (0x80041c8)
 800419c:   781c        ldrb    r4, [r3, #0]
 800419e:   2300        movs    r3, #0
 80041a0:   42a3        cmp r3, r4
 80041a2:   d20c        bcs.n   0x80041be
 80041a4:   f103 5280   add.w   r2, r3, #268435456  ; 0x10000000
 80041a8:   f502 52b8   add.w   r2, r2, #5888   ; 0x1700
 80041ac:   0091        lsls    r1, r2, #2
 80041ae:   680d        ldr r5, [r1, #0]
 80041b0:   f648 728f   movw    r2, #36751  ; 0x8f8f
 80041b4:   402a        ands    r2, r5
 80041b6:   431a        orrs    r2, r3
 80041b8:   600a        str r2, [r1, #0]
 80041ba:   3301        adds    r3, #1
 80041bc:   e7f0        b.n 0x80041a0
 80041be:   4b03        ldr r3, [pc, #12]   ; (0x80041cc)
 80041c0:   f040 0080   orr.w   r0, r0, #128    ; 0x80
 80041c4:   6018        str r0, [r3, #0]
 80041c6:   bd30        pop {r4, r5, pc}
 80041c8:   03ac        lsls    r4, r5, #14
 80041ca:   2000        movs    r0, #0
 80041cc:   .word USB_BASE + USB_DADDR // 0x40005c4c
 80041d0:   b510        push    {r4, lr}
 80041d2:   4c13        ldr r4, [pc, #76]   ; (0x8004220)
 80041d4:   6823        ldr r3, [r4, #0]
 80041d6:   7a1a        ldrb    r2, [r3, #8]
 80041d8:   2a02        cmp r2, #2
 80041da:   d001        beq.n   0x80041e0
 80041dc:   2a04        cmp r2, #4
 80041de:   d104        bne.n   0x80041ea
 80041e0:   f7ff fc90   bl  0x8003b04
 80041e4:   6823        ldr r3, [r4, #0]
 80041e6:   7a1b        ldrb    r3, [r3, #8]
 80041e8:   e013        b.n 0x8004212
 80041ea:   2a06        cmp r2, #6
 80041ec:   d110        bne.n   0x8004210
 80041ee:   785a        ldrb    r2, [r3, #1]
 80041f0:   2a05        cmp r2, #5
 80041f2:   d109        bne.n   0x8004208
 80041f4:   781a        ldrb    r2, [r3, #0]
 80041f6:   0652        lsls    r2, r2, #25
 80041f8:   d106        bne.n   0x8004208
 80041fa:   7898        ldrb    r0, [r3, #2]
 80041fc:   f7ff ffcc   bl  0x8004198
 8004200:   4b08        ldr r3, [pc, #32]   ; (0x8004224)
 8004202:   681b        ldr r3, [r3, #0]
 8004204:   6a1b        ldr r3, [r3, #32]
 8004206:   4798        blx r3
 8004208:   4b07        ldr r3, [pc, #28]   ; (0x8004228)
 800420a:   681b        ldr r3, [r3, #0]
 800420c:   689b        ldr r3, [r3, #8]
 800420e:   4798        blx r3
 8004210:   2308        movs    r3, #8
 8004212:   6822        ldr r2, [r4, #0]
 8004214:   7213        strb    r3, [r2, #8]
 8004216:   e8bd 4010   ldmia.w sp!, {r4, lr}
 800421a:   f7ff bdd1   b.w 0x8003dc0
 800421e:   bf00        nop
 8004220:   0af8        lsrs    r0, r7, #11
 8004222:   2000        movs    r0, #0
 8004224:   0af4        lsrs    r4, r6, #11
 8004226:   2000        movs    r0, #0
 8004228:   0ad0        lsrs    r0, r2, #11
 800422a:   2000        movs    r0, #0
 800422c:   4770        bx  lr
 800422e:   b530        push    {r4, r5, lr}
 8004230:   f101 5100   add.w   r1, r1, #536870912  ; 0x20000000
 8004234:   3201        adds    r2, #1
 8004236:   f501 5140   add.w   r1, r1, #12288  ; 0x3000
 800423a:   1052        asrs    r2, r2, #1
 800423c:   0049        lsls    r1, r1, #1
 800423e:   2300        movs    r3, #0
 8004240:   4293        cmp r3, r2
 8004242:   f100 0002   add.w   r0, r0, #2
 8004246:   d009        beq.n   0x800425c
 8004248:   f810 5c01   ldrb.w  r5, [r0, #-1]
 800424c:   f810 4c02   ldrb.w  r4, [r0, #-2]
 8004250:   ea44 2405   orr.w   r4, r4, r5, lsl #8
 8004254:   f821 4023   strh.w  r4, [r1, r3, lsl #2]
 8004258:   3301        adds    r3, #1
 800425a:   e7f1        b.n 0x8004240
 800425c:   bd30        pop {r4, r5, pc}
 800425e:   b510        push    {r4, lr}
 8004260:   f101 5100   add.w   r1, r1, #536870912  ; 0x20000000
 8004264:   3201        adds    r2, #1
 8004266:   f501 5140   add.w   r1, r1, #12288  ; 0x3000
 800426a:   1052        asrs    r2, r2, #1
 800426c:   0049        lsls    r1, r1, #1
 800426e:   2300        movs    r3, #0
 8004270:   4293        cmp r3, r2
 8004272:   d005        beq.n   0x8004280
 8004274:   f851 4023   ldr.w   r4, [r1, r3, lsl #2]
 8004278:   f820 4013   strh.w  r4, [r0, r3, lsl #1]
 800427c:   3301        adds    r3, #1
 800427e:   e7f7        b.n 0x8004270
 8004280:   bd10        pop {r4, pc}
 8004282:   0080        lsls    r0, r0, #2
 8004284:   f100 4080   add.w   r0, r0, #1073741824 ; 0x40000000
 8004288:   f500 40b8   add.w   r0, r0, #23552  ; 0x5c00
 800428c:   6803        ldr r3, [r0, #0]
 800428e:   06ca        lsls    r2, r1, #27
 8004290:   f423 43e0   bic.w   r3, r3, #28672  ; 0x7000
 8004294:   f023 0340   bic.w   r3, r3, #64 ; 0x40
 8004298:   b29b        uxth    r3, r3
 800429a:   bf48        it  mi
 800429c:   f083 0310   eormi.w r3, r3, #16
 80042a0:   068a        lsls    r2, r1, #26
 80042a2:   bf48        it  mi
 80042a4:   f083 0320   eormi.w r3, r3, #32
 80042a8:   6003        str r3, [r0, #0]
 80042aa:   4770        bx  lr
 80042ac:   0080        lsls    r0, r0, #2
 80042ae:   f100 4080   add.w   r0, r0, #1073741824 ; 0x40000000
 80042b2:   f500 40b8   add.w   r0, r0, #23552  ; 0x5c00
 80042b6:   6803        ldr r3, [r0, #0]
 80042b8:   045b        lsls    r3, r3, #17
 80042ba:   d506        bpl.n   0x80042ca
 80042bc:   6802        ldr r2, [r0, #0]
 80042be:   f648 738f   movw    r3, #36751  ; 0x8f8f
 80042c2:   4013        ands    r3, r2
 80042c4:   f443 4380   orr.w   r3, r3, #16384  ; 0x4000
 80042c8:   6003        str r3, [r0, #0]
 80042ca:   4770        bx  lr
 80042cc:   0080        lsls    r0, r0, #2
 80042ce:   f100 4080   add.w   r0, r0, #1073741824 ; 0x40000000
 80042d2:   f500 40b8   add.w   r0, r0, #23552  ; 0x5c00
 80042d6:   6803        ldr r3, [r0, #0]
 80042d8:   065b        lsls    r3, r3, #25
 80042da:   d506        bpl.n   0x80042ea
 80042dc:   6802        ldr r2, [r0, #0]
 80042de:   f648 738f   movw    r3, #36751  ; 0x8f8f
 80042e2:   4013        ands    r3, r2
 80042e4:   f043 0340   orr.w   r3, r3, #64 ; 0x40
 80042e8:   6003        str r3, [r0, #0]
 80042ea:   4770        bx  lr
 80042ec:   4b05        ldr r3, [pc, #20]   ; (0x8004304)
 80042ee:   681b        ldr r3, [r3, #0]
 80042f0:   b29b        uxth    r3, r3
 80042f2:   eb03 00c0   add.w   r0, r3, r0, lsl #3
 80042f6:   f100 5000   add.w   r0, r0, #536870912  ; 0x20000000
 80042fa:   f500 5040   add.w   r0, r0, #12288  ; 0x3000
 80042fe:   0040        lsls    r0, r0, #1
 8004300:   8800        ldrh    r0, [r0, #0]
 8004302:   4770        bx  lr
 8004304:   .word USB_BASE + USB_BTABLE // 0x40005c50
 8004308:   4b04        ldr r3, [pc, #16]   ; (0x800431c)
 800430a:   681b        ldr r3, [r3, #0]
 800430c:   b29b        uxth    r3, r3
 800430e:   eb03 00c0   add.w   r0, r3, r0, lsl #3
 8004312:   4b03        ldr r3, [pc, #12]   ; (0x8004320)
 8004314:   4403        add r3, r0
 8004316:   005b        lsls    r3, r3, #1
 8004318:   8818        ldrh    r0, [r3, #0]
 800431a:   4770        bx  lr
 800431c:   .word USB_BASE + USB_BTABLE // 0x40005c50
 8004320:   .word SRAM_3004 // 0x20003004
 8004324:   4b04        ldr r3, [pc, #16]   ; (0x8004338)
 8004326:   681b        ldr r3, [r3, #0]
 8004328:   b29b        uxth    r3, r3
 800432a:   eb03 00c0   add.w   r0, r3, r0, lsl #3
 800432e:   4b03        ldr r3, [pc, #12]   ; (0x800433c)
 8004330:   4403        add r3, r0
 8004332:   005b        lsls    r3, r3, #1
 8004334:   6019        str r1, [r3, #0]
 8004336:   4770        bx  lr
 8004338:   .word USB_BASE + USB_BTABLE // 0x40005c50
 800433c:   3002        adds    r0, #2
 800433e:   2000        movs    r0, #0
 8004340:   4b0d        ldr r3, [pc, #52]   ; (0x8004378)
 8004342:   293e        cmp r1, #62 ; 0x3e
 8004344:   681b        ldr r3, [r3, #0]
 8004346:   b29b        uxth    r3, r3
 8004348:   eb03 00c0   add.w   r0, r3, r0, lsl #3
 800434c:   4b0b        ldr r3, [pc, #44]   ; (0x800437c)
 800434e:   4403        add r3, r0
 8004350:   ea4f 0243   mov.w   r2, r3, lsl #1
 8004354:   d909        bls.n   0x800436a
 8004356:   094b        lsrs    r3, r1, #5
 8004358:   06c8        lsls    r0, r1, #27
 800435a:   bf04        itt eq
 800435c:   f103 33ff   addeq.w r3, r3, #4294967295
 8004360:   b29b        uxtheq  r3, r3
 8004362:   029b        lsls    r3, r3, #10
 8004364:   f443 4300   orr.w   r3, r3, #32768  ; 0x8000
 8004368:   e004        b.n 0x8004374
 800436a:   084b        lsrs    r3, r1, #1
 800436c:   07c9        lsls    r1, r1, #31
 800436e:   bf48        it  mi
 8004370:   3301        addmi   r3, #1
 8004372:   029b        lsls    r3, r3, #10
 8004374:   6013        str r3, [r2, #0]
 8004376:   4770        bx  lr
 8004378:   .word USB_BASE + USB_BTABLE // 0x40005c50
 800437c:   3006        adds    r0, #6
 800437e:   2000        movs    r0, #0
 8004380:   b508        push    {r3, lr}
 8004382:   2100        movs    r1, #0
 8004384:   4604        mov r4, r0
 8004386:   f000 f86d   bl  0x8004464
 800438a:   4b04        ldr r3, [pc, #16]   ; (0x800439c)
 800438c:   6818        ldr r0, [r3, #0]
 800438e:   6bc3        ldr r3, [r0, #60]   ; 0x3c
 8004390:   b103        cbz r3, 0x8004394
 8004392:   4798        blx r3
 8004394:   4620        mov r0, r4
 8004396:   f7fd ff35   bl  0x8002204
 800439a:   bf00        nop
 800439c:   528c        strh    r4, [r1, r2]
 800439e:   0800        lsrs    r0, r0, #32
 80043a0:   b570        push    {r4, r5, r6, lr}
 80043a2:   4e0f        ldr r6, [pc, #60]   ; (0x80043e0)
 80043a4:   4d0f        ldr r5, [pc, #60]   ; (0x80043e4)
 80043a6:   1b76        subs    r6, r6, r5
 80043a8:   10b6        asrs    r6, r6, #2
 80043aa:   d007        beq.n   0x80043bc
 80043ac:   3d04        subs    r5, #4
 80043ae:   2400        movs    r4, #0
 80043b0:   3401        adds    r4, #1
 80043b2:   f855 3f04   ldr.w   r3, [r5, #4]!
 80043b6:   4798        blx r3
 80043b8:   42a6        cmp r6, r4
 80043ba:   d1f9        bne.n   0x80043b0
 80043bc:   4e0a        ldr r6, [pc, #40]   ; (0x80043e8)
 80043be:   4d0b        ldr r5, [pc, #44]   ; (0x80043ec)
 80043c0:   f000 f93a   bl  0x8004638
 80043c4:   1b76        subs    r6, r6, r5
 80043c6:   10b6        asrs    r6, r6, #2
 80043c8:   d008        beq.n   0x80043dc
 80043ca:   3d04        subs    r5, #4
 80043cc:   2400        movs    r4, #0
 80043ce:   3401        adds    r4, #1
 80043d0:   f855 3f04   ldr.w   r3, [r5, #4]!
 80043d4:   4798        blx r3
 80043d6:   42a6        cmp r6, r4
 80043d8:   d1f9        bne.n   0x80043ce
 80043da:   bd70        pop {r4, r5, r6, pc}
 80043dc:   bd70        pop {r4, r5, r6, pc}
 80043de:   bf00        nop
 80043e0:   4644        mov r4, r8
 80043e2:   0800        lsrs    r0, r0, #32
 80043e4:   4644        mov r4, r8
 80043e6:   0800        lsrs    r0, r0, #32
 80043e8:   4658        mov r0, r11
 80043ea:   0800        lsrs    r0, r0, #32
 80043ec:   4644        mov r4, r8
 80043ee:   0800        lsrs    r0, r0, #32
 80043f0:   f020 0103   bic.w   r1, r0, #3
 80043f4:   f010 0003   ands.w  r0, r0, #3
 80043f8:   f1c0 0000   rsb r0, r0, #0
 80043fc:   f851 3b04   ldr.w   r3, [r1], #4
 8004400:   f100 0c04   add.w   r12, r0, #4
 8004404:   ea4f 0ccc   mov.w   r12, r12, lsl #3
 8004408:   f06f 0200   mvn.w   r2, #0
 800440c:   bf1c        itt ne
 800440e:   fa22 f20c   lsrne.w r2, r2, r12
 8004412:   4313        orrne   r3, r2
 8004414:   f04f 0c01   mov.w   r12, #1
 8004418:   ea4c 2c0c   orr.w   r12, r12, r12, lsl #8
 800441c:   ea4c 4c0c   orr.w   r12, r12, r12, lsl #16
 8004420:   eba3 020c   sub.w   r2, r3, r12
 8004424:   ea22 0203   bic.w   r2, r2, r3
 8004428:   ea12 12cc   ands.w  r2, r2, r12, lsl #7
 800442c:   bf04        itt eq
 800442e:   f851 3b04   ldreq.w r3, [r1], #4
 8004432:   3004        addeq   r0, #4
 8004434:   d0f4        beq.n   0x8004420
 8004436:   f013 0fff   tst.w   r3, #255    ; 0xff
 800443a:   bf1f        itttt   ne
 800443c:   3001        addne   r0, #1
 800443e:   f413 4f7f   tstne.w r3, #65280  ; 0xff00
 8004442:   3001        addne   r0, #1
 8004444:   f413 0f7f   tstne.w r3, #16711680   ; 0xff0000
 8004448:   bf18        it  ne
 800444a:   3001        addne   r0, #1
 800444c:   4770        bx  lr
 800444e:   bf00        nop
 8004450:   4b02        ldr r3, [pc, #8]    ; (0x800445c)
 8004452:   b113        cbz r3, 0x800445a
 8004454:   4802        ldr r0, [pc, #8]    ; (0x8004460)
 8004456:   f000 b87d   b.w 0x8004554
 800445a:   4770        bx  lr
 800445c:   0000        movs    r0, r0
 800445e:   0000        movs    r0, r0
 8004460:   4561        cmp r1, r12
 8004462:   0800        lsrs    r0, r0, #32
 8004464:   e92d 4ff0   stmdb   sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
 8004468:   4b38        ldr r3, [pc, #224]  ; (0x800454c)
 800446a:   b085        sub sp, #20
 800446c:   681b        ldr r3, [r3, #0]
 800446e:   9002        str r0, [sp, #8]
 8004470:   f503 72a4   add.w   r2, r3, #328    ; 0x148
 8004474:   9301        str r3, [sp, #4]
 8004476:   460f        mov r7, r1
 8004478:   9203        str r2, [sp, #12]
 800447a:   9b01        ldr r3, [sp, #4]
 800447c:   f8d3 8148   ldr.w   r8, [r3, #328]  ; 0x148
 8004480:   f1b8 0f00   cmp.w   r8, #0
 8004484:   d01c        beq.n   0x80044c0
 8004486:   f8dd b00c   ldr.w   r11, [sp, #12]
 800448a:   f04f 0901   mov.w   r9, #1
 800448e:   46da        mov r10, r11
 8004490:   f8d8 3004   ldr.w   r3, [r8, #4]
 8004494:   1e5c        subs    r4, r3, #1
 8004496:   d411        bmi.n   0x80044bc
 8004498:   f108 0588   add.w   r5, r8, #136    ; 0x88
 800449c:   1c9e        adds    r6, r3, #2
 800449e:   eb05 0583   add.w   r5, r5, r3, lsl #2
 80044a2:   eb08 0686   add.w   r6, r8, r6, lsl #2
 80044a6:   b177        cbz r7, 0x80044c6
 80044a8:   6feb        ldr r3, [r5, #124]  ; 0x7c
 80044aa:   42bb        cmp r3, r7
 80044ac:   d00b        beq.n   0x80044c6
 80044ae:   3c01        subs    r4, #1
 80044b0:   1c63        adds    r3, r4, #1
 80044b2:   f1a5 0504   sub.w   r5, r5, #4
 80044b6:   f1a6 0604   sub.w   r6, r6, #4
 80044ba:   d1f4        bne.n   0x80044a6
 80044bc:   4a24        ldr r2, [pc, #144]  ; (0x8004550)
 80044be:   bb7a        cbnz    r2, 0x8004520
 80044c0:   b005        add sp, #20
 80044c2:   e8bd 8ff0   ldmia.w sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
 80044c6:   f8d8 2004   ldr.w   r2, [r8, #4]
 80044ca:   f856 3c04   ldr.w   r3, [r6, #-4]
 80044ce:   3a01        subs    r2, #1
 80044d0:   42a2        cmp r2, r4
 80044d2:   bf16        itet    ne
 80044d4:   2200        movne   r2, #0
 80044d6:   f8c8 4004   streq.w r4, [r8, #4]
 80044da:   f846 2c04   strne.w r2, [r6, #-4]
 80044de:   2b00        cmp r3, #0
 80044e0:   d0e5        beq.n   0x80044ae
 80044e2:   fa09 f204   lsl.w   r2, r9, r4
 80044e6:   f8d8 1188   ldr.w   r1, [r8, #392]  ; 0x188
 80044ea:   f8d8 b004   ldr.w   r11, [r8, #4]
 80044ee:   420a        tst r2, r1
 80044f0:   d010        beq.n   0x8004514
 80044f2:   f8d8 118c   ldr.w   r1, [r8, #396]  ; 0x18c
 80044f6:   420a        tst r2, r1
 80044f8:   d10e        bne.n   0x8004518
 80044fa:   9802        ldr r0, [sp, #8]
 80044fc:   f855 1c04   ldr.w   r1, [r5, #-4]
 8004500:   4798        blx r3
 8004502:   f8d8 3004   ldr.w   r3, [r8, #4]
 8004506:   455b        cmp r3, r11
 8004508:   d1b7        bne.n   0x800447a
 800450a:   f8da 3000   ldr.w   r3, [r10]
 800450e:   4543        cmp r3, r8
 8004510:   d0cd        beq.n   0x80044ae
 8004512:   e7b2        b.n 0x800447a
 8004514:   4798        blx r3
 8004516:   e7f4        b.n 0x8004502
 8004518:   f855 0c04   ldr.w   r0, [r5, #-4]
 800451c:   4798        blx r3
 800451e:   e7f0        b.n 0x8004502
 8004520:   f8d8 3004   ldr.w   r3, [r8, #4]
 8004524:   b96b        cbnz    r3, 0x8004542
 8004526:   f8d8 3000   ldr.w   r3, [r8]
 800452a:   b163        cbz r3, 0x8004546
 800452c:   4640        mov r0, r8
 800452e:   f8ca 3000   str.w   r3, [r10]
 8004532:   f3af 8000   nop.w
 8004536:   f8da 8000   ldr.w   r8, [r10]
 800453a:   f1b8 0f00   cmp.w   r8, #0
 800453e:   d1a7        bne.n   0x8004490
 8004540:   e7be        b.n 0x80044c0
 8004542:   f8d8 3000   ldr.w   r3, [r8]
 8004546:   46c2        mov r10, r8
 8004548:   4698        mov r8, r3
 800454a:   e7f6        b.n 0x800453a
 800454c:   528c        strh    r4, [r1, r2]
 800454e:   0800        lsrs    r0, r0, #32
 8004550:   0000        movs    r0, r0
 8004552:   0000        movs    r0, r0
 8004554:   4601        mov r1, r0
 8004556:   2000        movs    r0, #0
 8004558:   4602        mov r2, r0
 800455a:   4603        mov r3, r0
 800455c:   f000 b818   b.w 0x8004590
 8004560:   b538        push    {r3, r4, r5, lr}
 8004562:   4d09        ldr r5, [pc, #36]   ; (0x8004588)
 8004564:   4c09        ldr r4, [pc, #36]   ; (0x800458c)
 8004566:   1b64        subs    r4, r4, r5
 8004568:   10a4        asrs    r4, r4, #2
 800456a:   bf18        it  ne
 800456c:   eb05 0584   addne.w r5, r5, r4, lsl #2
 8004570:   d005        beq.n   0x800457e
 8004572:   3c01        subs    r4, #1
 8004574:   f855 3d04   ldr.w   r3, [r5, #-4]!
 8004578:   4798        blx r3
 800457a:   2c00        cmp r4, #0
 800457c:   d1f9        bne.n   0x8004572
 800457e:   e8bd 4038   ldmia.w sp!, {r3, r4, r5, lr}
 8004582:   f000 b869   b.w 0x8004658
 8004586:   bf00        nop
 8004588:   4664        mov r4, r12
 800458a:   0800        lsrs    r0, r0, #32
 800458c:   4668        mov r0, sp
 800458e:   0800        lsrs    r0, r0, #32
 8004590:   b5f0        push    {r4, r5, r6, r7, lr}
 8004592:   4c27        ldr r4, [pc, #156]  ; (0x8004630)
 8004594:   b085        sub sp, #20
 8004596:   6826        ldr r6, [r4, #0]
 8004598:   4607        mov r7, r0
 800459a:   f8d6 4148   ldr.w   r4, [r6, #328]  ; 0x148
 800459e:   2c00        cmp r4, #0
 80045a0:   d040        beq.n   0x8004624
 80045a2:   6865        ldr r5, [r4, #4]
 80045a4:   2d1f        cmp r5, #31
 80045a6:   dd1e        ble.n   0x80045e6
 80045a8:   4822        ldr r0, [pc, #136]  ; (0x8004634)
 80045aa:   b918        cbnz    r0, 0x80045b4
 80045ac:   f04f 30ff   mov.w   r0, #4294967295
 80045b0:   b005        add sp, #20
 80045b2:   bdf0        pop {r4, r5, r6, r7, pc}
 80045b4:   f44f 70c8   mov.w   r0, #400    ; 0x190
 80045b8:   9103        str r1, [sp, #12]
 80045ba:   9202        str r2, [sp, #8]
 80045bc:   9301        str r3, [sp, #4]
 80045be:   f3af 8000   nop.w
 80045c2:   9903        ldr r1, [sp, #12]
 80045c4:   4604        mov r4, r0
 80045c6:   9a02        ldr r2, [sp, #8]
 80045c8:   9b01        ldr r3, [sp, #4]
 80045ca:   2800        cmp r0, #0
 80045cc:   d0ee        beq.n   0x80045ac
 80045ce:   f8d6 5148   ldr.w   r5, [r6, #328]  ; 0x148
 80045d2:   2000        movs    r0, #0
 80045d4:   6025        str r5, [r4, #0]
 80045d6:   6060        str r0, [r4, #4]
 80045d8:   4605        mov r5, r0
 80045da:   f8c6 4148   str.w   r4, [r6, #328]  ; 0x148
 80045de:   f8c4 0188   str.w   r0, [r4, #392]  ; 0x188
 80045e2:   f8c4 018c   str.w   r0, [r4, #396]  ; 0x18c
 80045e6:   b93f        cbnz    r7, 0x80045f8
 80045e8:   1c6b        adds    r3, r5, #1
 80045ea:   2000        movs    r0, #0
 80045ec:   3502        adds    r5, #2
 80045ee:   6063        str r3, [r4, #4]
 80045f0:   f844 1025   str.w   r1, [r4, r5, lsl #2]
 80045f4:   b005        add sp, #20
 80045f6:   bdf0        pop {r4, r5, r6, r7, pc}
 80045f8:   2601        movs    r6, #1
 80045fa:   40ae        lsls    r6, r5
 80045fc:   eb04 0085   add.w   r0, r4, r5, lsl #2
 8004600:   f8c0 2088   str.w   r2, [r0, #136]  ; 0x88
 8004604:   f8d4 2188   ldr.w   r2, [r4, #392]  ; 0x188
 8004608:   2f02        cmp r7, #2
 800460a:   ea42 0206   orr.w   r2, r2, r6
 800460e:   f8c4 2188   str.w   r2, [r4, #392]  ; 0x188
 8004612:   f8c0 3108   str.w   r3, [r0, #264]  ; 0x108
 8004616:   d1e7        bne.n   0x80045e8
 8004618:   f8d4 318c   ldr.w   r3, [r4, #396]  ; 0x18c
 800461c:   431e        orrs    r6, r3
 800461e:   f8c4 618c   str.w   r6, [r4, #396]  ; 0x18c
 8004622:   e7e1        b.n 0x80045e8
 8004624:   f506 74a6   add.w   r4, r6, #332    ; 0x14c
 8004628:   f8c6 4148   str.w   r4, [r6, #328]  ; 0x148
 800462c:   e7b9        b.n 0x80045a2
 800462e:   bf00        nop
 8004630:   528c        strh    r4, [r1, r2]
 8004632:   0800        lsrs    r0, r0, #32
 8004634:   0000        movs    r0, r0
 8004636:   0000        movs    r0, r0
 8004638:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 800463a:   bf00        nop
 800463c:   bcf8        pop {r3, r4, r5, r6, r7}
 800463e:   bc08        pop {r3}
 8004640:   469e        mov lr, r3
 8004642:   4770        bx  lr
 8004644:   4451        add r1, r10
 8004646:   0800        lsrs    r0, r0, #32
 8004648:   2e45        cmp r6, #69 ; 0x45
 800464a:   0800        lsrs    r0, r0, #32
 800464c:   2111        movs    r1, #17
 800464e:   0800        lsrs    r0, r0, #32
 8004650:   220d        movs    r2, #13
 8004652:   0800        lsrs    r0, r0, #32
 8004654:   3071        adds    r0, #113    ; 0x71
 8004656:   0800        lsrs    r0, r0, #32
 8004658:   b5f8        push    {r3, r4, r5, r6, r7, lr}
 800465a:   bf00        nop
 800465c:   bcf8        pop {r3, r4, r5, r6, r7}
 800465e:   bc08        pop {r3}
 8004660:   469e        mov lr, r3
 8004662:   4770        bx  lr
 8004664:   20ed        movs    r0, #237    ; 0xed
 8004666:   0800        lsrs    r0, r0, #32
 8004668:   db28        blt.n   0x80046bc
 800466a:   7fff        ldrb    r7, [r7, #31]
 800466c:   0001        movs    r1, r0
    ...
 800467a:   001c        movs    r4, r3
 800467c:   0005        movs    r5, r0
 800467e:   8000        strh    r0, [r0, #0]
 8004680:   0000        movs    r0, r0
 8004682:   0001        movs    r1, r0
 8004684:   0008        movs    r0, r1
 8004686:   2000        movs    r0, #0
 8004688:   2800        cmp r0, #0
 800468a:   4001        ands    r1, r0
 800468c:   0001        movs    r1, r0
 800468e:   0000        movs    r0, r0
 8004690:   2400        movs    r4, #0
 8004692:   4001        ands    r1, r0
 8004694:   1200        asrs    r0, r0, #8
    ...
 80046a6:   0000        movs    r0, r0
 80046a8:   0018        movs    r0, r3
 80046aa:   2000        movs    r0, #0
 80046ac:   0020        movs    r0, r4
 80046ae:   2000        movs    r0, #0
 80046b0:   0800        lsrs    r0, r0, #32
 80046b2:   4001        ands    r1, r0
 80046b4:   000b        movs    r3, r1
 80046b6:   0000        movs    r0, r0
 80046b8:   0c00        lsrs    r0, r0, #16
 80046ba:   4001        ands    r1, r0
 80046bc:   010c        lsls    r4, r1, #4
 80046be:   0000        movs    r0, r0
 80046c0:   1000        asrs    r0, r0, #32
 80046c2:   4001        ands    r1, r0
 80046c4:   020d        lsls    r5, r1, #8
 80046c6:   0000        movs    r0, r0
 80046c8:   1400        asrs    r0, r0, #16
 80046ca:   4001        ands    r1, r0
 80046cc:   030e        lsls    r6, r1, #12
 80046ce:   0000        movs    r0, r0
 80046d0:   101c        asrs    r4, r3, #32
 80046d2:   4002        ands    r2, r0
 80046d4:   1018        asrs    r0, r3, #32
 80046d6:   4002        ands    r2, r0
 80046d8:   1014        asrs    r4, r2, #32
 80046da:   4002        ands    r2, r0
 80046dc:   1010        asrs    r0, r2, #32
 80046de:   4002        ands    r2, r0
 80046e0:   100c        asrs    r4, r1, #32
 80046e2:   4002        ands    r2, r0
 80046e4:   101c        asrs    r4, r3, #32
 80046e6:   4002        ands    r2, r0
 80046e8:   1018        asrs    r0, r3, #32
 80046ea:   4002        ands    r2, r0
 80046ec:   1014        asrs    r4, r2, #32
 80046ee:   4002        ands    r2, r0
 80046f0:   0400        lsls    r0, r0, #16
 80046f2:   4000        ands    r0, r0
 80046f4:   011c        lsls    r4, r3, #4
    ...
 8004712:   0000        movs    r0, r0
 8004714:   0800        lsrs    r0, r0, #32
 8004716:   4000        ands    r0, r0
 8004718:   011d        lsls    r5, r3, #4
    ...
 8004736:   0000        movs    r0, r0
 8004738:   2c00        cmp r4, #0
 800473a:   4001        ands    r1, r0
 800473c:   001a        movs    r2, r3
    ...
 8004762:   4000        ands    r0, r0
 8004764:   011b        lsls    r3, r3, #4
    ...
 8004782:   0000        movs    r0, r0
 8004784:   0120        lsls    r0, r4, #4
 8004786:   2000        movs    r0, #0
 8004788:   01b4        lsls    r4, r6, #6
 800478a:   2000        movs    r0, #0
 800478c:   0248        lsls    r0, r1, #9
 800478e:   2000        movs    r0, #0
 8004790:   3800        subs    r0, #0
 8004792:   4001        ands    r1, r0
 8004794:   084c        lsrs    r4, r1, #1
 8004796:   2000        movs    r0, #0
 8004798:   0840        lsrs    r0, r0, #1
 800479a:   2000        movs    r0, #0
 800479c:   aa20        add r2, sp, #128    ; 0x80
 800479e:   0044        lsls    r4, r0, #1
    ...
 8004820:   2528        movs    r5, #40 ; 0x28
 8004822:   0000        movs    r0, r0
 8004824:   4400        add r0, r0
 8004826:   4000        ands    r0, r0
 8004828:   0858        lsrs    r0, r3, #1
 800482a:   2000        movs    r0, #0
 800482c:   0870        lsrs    r0, r6, #1
 800482e:   2000        movs    r0, #0
 8004830:   5510        strb    r0, [r2, r4]
 8004832:   0022        movs    r2, r4
    ...
 80048b4:   2629        movs    r6, #41 ; 0x29
 80048b6:   0000        movs    r0, r0
 80048b8:   4800        ldr r0, [pc, #0]    ; (0x80048bc)
 80048ba:   4000        ands    r0, r0
 80048bc:   0864        lsrs    r4, r4, #1
 80048be:   2000        movs    r0, #0
 80048c0:   087c        lsrs    r4, r7, #1
 80048c2:   2000        movs    r0, #0
 80048c4:   5510        strb    r0, [r2, r4]
 80048c6:   0022        movs    r2, r4
    ...
 8004948:   272a        movs    r7, #42 ; 0x2a
 800494a:   0000        movs    r0, r0
 800494c:   02e0        lsls    r0, r4, #11
 800494e:   2000        movs    r0, #0
 8004950:   bf00        nop
    ...
 800495e:   002d        movs    r5, r5
 8004960:   5240        strh    r0, [r0, r1]
 8004962:   0800        lsrs    r0, r0, #32
 8004964:   0043        lsls    r3, r0, #1
 8004966:   0000        movs    r0, r0
 8004968:   3599        adds    r5, #153    ; 0x99
 800496a:   0800        lsrs    r0, r0, #32
 800496c:   367d        adds    r6, #125    ; 0x7d
 800496e:   0800        lsrs    r0, r0, #32
 8004970:   422d        tst r5, r5
 8004972:   0800        lsrs    r0, r0, #32
 8004974:   422d        tst r5, r5
 8004976:   0800        lsrs    r0, r0, #32
 8004978:   3481        adds    r4, #129    ; 0x81
 800497a:   0800        lsrs    r0, r0, #32
 800497c:   34d5        adds    r4, #213    ; 0xd5
 800497e:   0800        lsrs    r0, r0, #32
 8004980:   3525        adds    r5, #37 ; 0x25
 8004982:   0800        lsrs    r0, r0, #32
 8004984:   358d        adds    r5, #141    ; 0x8d
 8004986:   0800        lsrs    r0, r0, #32
 8004988:   3581        adds    r5, #129    ; 0x81
 800498a:   0800        lsrs    r0, r0, #32
 800498c:   3561        adds    r5, #97 ; 0x61
 800498e:   0800        lsrs    r0, r0, #32
 8004990:   0000        movs    r0, r0
 8004992:   0000        movs    r0, r0
 8004994:   0040        lsls    r0, r0, #1
 8004996:   0000        movs    r0, r0
 8004998:   35dd        adds    r5, #221    ; 0xdd
 800499a:   0800        lsrs    r0, r0, #32
 800499c:   422d        tst r5, r5
 800499e:   0800        lsrs    r0, r0, #32
 80049a0:   422d        tst r5, r5
 80049a2:   0800        lsrs    r0, r0, #32
 80049a4:   422d        tst r5, r5
 80049a6:   0800        lsrs    r0, r0, #32
 80049a8:   422d        tst r5, r5
 80049aa:   0800        lsrs    r0, r0, #32
 80049ac:   422d        tst r5, r5
 80049ae:   0800        lsrs    r0, r0, #32
 80049b0:   422d        tst r5, r5
 80049b2:   0800        lsrs    r0, r0, #32
 80049b4:   5283        strh    r3, [r0, r2]
 80049b6:   0800        lsrs    r0, r0, #32
 80049b8:   0004        movs    r4, r0
 80049ba:   0000        movs    r0, r0
 80049bc:   521c        strh    r4, [r3, r0]
 80049be:   0800        lsrs    r0, r0, #32
 80049c0:   0012        movs    r2, r2
 80049c2:   0000        movs    r0, r0
 80049c4:   5210        strh    r0, [r2, r0]
 80049c6:   0800        lsrs    r0, r0, #32
 80049c8:   000c        movs    r4, r1
 80049ca:   0000        movs    r0, r0
 80049cc:   422d        tst r5, r5
 80049ce:   0800        lsrs    r0, r0, #32
 80049d0:   422d        tst r5, r5
 80049d2:   0800        lsrs    r0, r0, #32
 80049d4:   37dd        adds    r7, #221    ; 0xdd
 80049d6:   0800        lsrs    r0, r0, #32
 80049d8:   422d        tst r5, r5
 80049da:   0800        lsrs    r0, r0, #32
 80049dc:   422d        tst r5, r5
 80049de:   0800        lsrs    r0, r0, #32
 80049e0:   422d        tst r5, r5
 80049e2:   0800        lsrs    r0, r0, #32
 80049e4:   422d        tst r5, r5
 80049e6:   0800        lsrs    r0, r0, #32
 80049e8:   c200        stmia   r2!, {}
 80049ea:   0001        movs    r1, r0
 80049ec:   0000        movs    r0, r0
 80049ee:   0008        movs    r0, r1
 80049f0:   422d        tst r5, r5
 80049f2:   0800        lsrs    r0, r0, #32
 80049f4:   3535        adds    r5, #53 ; 0x35
 80049f6:   0800        lsrs    r0, r0, #32
 80049f8:   422d        tst r5, r5
 80049fa:   0800        lsrs    r0, r0, #32
 80049fc:   422d        tst r5, r5
 80049fe:   0800        lsrs    r0, r0, #32
 8004a00:   422d        tst r5, r5
 8004a02:   0800        lsrs    r0, r0, #32
 8004a04:   422d        tst r5, r5
 8004a06:   0800        lsrs    r0, r0, #32
 8004a08:   422d        tst r5, r5
 8004a0a:   0800        lsrs    r0, r0, #32
 8004a0c:   422d        tst r5, r5
 8004a0e:   0800        lsrs    r0, r0, #32
 8004a10:   3551        adds    r5, #81 ; 0x51
 8004a12:   0800        lsrs    r0, r0, #32
 8004a14:   522e        strh    r6, [r5, r0]
 8004a16:   0800        lsrs    r0, r0, #32
 8004a18:   0012        movs    r2, r2
 8004a1a:   0000        movs    r0, r0
 8004a1c:   0104        lsls    r4, r0, #4
 8004a1e:   0000        movs    r0, r0
 8004a20:   0000        movs    r0, r0
 8004a22:   0000        movs    r0, r0
 8004a24:   069c        lsls    r4, r3, #26
 8004a26:   2000        movs    r0, #0
 8004a28:   0704        lsls    r4, r0, #28
 8004a2a:   2000        movs    r0, #0
 8004a2c:   076c        lsls    r4, r5, #29
 8004a2e:   2000        movs    r0, #0
    ...
 8004a54:   5288        strh    r0, [r1, r2]
 8004a56:   0800        lsrs    r0, r0, #32
    ...
 8004ac8:   0001        movs    r1, r0
 8004aca:   0000        movs    r0, r0
 8004acc:   0000        movs    r0, r0
 8004ace:   0000        movs    r0, r0
 8004ad0:   330e        adds    r3, #14
 8004ad2:   abcd        add r3, sp, #820    ; 0x334
 8004ad4:   1234        asrs    r4, r6, #8
 8004ad6:   e66d        b.n 0x80047b4
 8004ad8:   deec        udf #236    ; 0xec
 8004ada:   0005        movs    r5, r0
 8004adc:   000b        movs    r3, r1
    ...
 8004e46:   0000        movs    r0, r0
 8004e48:   6f43        ldr r3, [r0, #116]  ; 0x74
 8004e4a:   676e        str r6, [r5, #116]  ; 0x74
 8004e4c:   6172        str r2, [r6, #20]
 8004e4e:   7574        strb    r4, [r6, #21]
 8004e50:   616c        str r4, [r5, #20]
 8004e52:   6974        ldr r4, [r6, #20]
 8004e54:   6e6f        ldr r7, [r5, #100]  ; 0x64
 8004e56:   2c73        cmp r4, #115    ; 0x73
 8004e58:   7920        ldrb    r0, [r4, #4]
 8004e5a:   756f        strb    r7, [r5, #21]
 8004e5c:   6820        ldr r0, [r4, #0]
 8004e5e:   7661        strb    r1, [r4, #25]
 8004e60:   2065        movs    r0, #101    ; 0x65
 8004e62:   6e69        ldr r1, [r5, #100]  ; 0x64
 8004e64:   7473        strb    r3, [r6, #17]
 8004e66:   6c61        ldr r1, [r4, #68]   ; 0x44
 8004e68:   656c        str r4, [r5, #84]   ; 0x54
 8004e6a:   2064        movs    r0, #100    ; 0x64
 8004e6c:   6874        ldr r4, [r6, #4]
 8004e6e:   2065        movs    r0, #101    ; 0x65
 8004e70:   5453        strb    r3, [r2, r1]
 8004e72:   334d        adds    r3, #77 ; 0x4d
 8004e74:   6432        str r2, [r6, #64]   ; 0x40
 8004e76:   6975        ldr r5, [r6, #20]
 8004e78:   6f6e        ldr r6, [r5, #116]  ; 0x74
 8004e7a:   6220        str r0, [r4, #32]
 8004e7c:   6f6f        ldr r7, [r5, #116]  ; 0x74
 8004e7e:   6c74        ldr r4, [r6, #68]   ; 0x44
 8004e80:   616f        str r7, [r5, #20]
 8004e82:   6564        str r4, [r4, #84]   ; 0x54
 8004e84:   0072        lsls    r2, r6, #1
 8004e86:   6553        str r3, [r2, #84]   ; 0x54
 8004e88:   2065        movs    r0, #101    ; 0x65
 8004e8a:   7468        strb    r0, [r5, #17]
 8004e8c:   7074        strb    r4, [r6, #1]
 8004e8e:   3a73        subs    r2, #115    ; 0x73
 8004e90:   2f2f        cmp r7, #47 ; 0x2f
 8004e92:   6967        ldr r7, [r4, #20]
 8004e94:   6874        ldr r4, [r6, #4]
 8004e96:   6275        str r5, [r6, #36]   ; 0x24
 8004e98:   632e        str r6, [r5, #48]   ; 0x30
 8004e9a:   6d6f        ldr r7, [r5, #84]   ; 0x54
 8004e9c:   722f        strb    r7, [r5, #8]
 8004e9e:   676f        str r7, [r5, #116]  ; 0x74
 8004ea0:   7265        strb    r5, [r4, #9]
 8004ea2:   6c63        ldr r3, [r4, #68]   ; 0x44
 8004ea4:   7261        strb    r1, [r4, #9]
 8004ea6:   6d6b        ldr r3, [r5, #84]   ; 0x54
 8004ea8:   6c65        ldr r5, [r4, #68]   ; 0x44
 8004eaa:   6f62        ldr r2, [r4, #116]  ; 0x74
 8004eac:   7275        strb    r5, [r6, #9]
 8004eae:   656e        str r6, [r5, #84]   ; 0x54
 8004eb0:   532f        strh    r7, [r5, r4]
 8004eb2:   4d54        ldr r5, [pc, #336]  ; (0x8005004)
 8004eb4:   3233        adds    r2, #51 ; 0x33
 8004eb6:   7564        strb    r4, [r4, #21]
 8004eb8:   6e69        ldr r1, [r5, #100]  ; 0x64
 8004eba:   2d6f        cmp r5, #111    ; 0x6f
 8004ebc:   6f62        ldr r2, [r4, #116]  ; 0x74
 8004ebe:   746f        strb    r7, [r5, #17]
 8004ec0:   6f6c        ldr r4, [r5, #116]  ; 0x74
 8004ec2:   6461        str r1, [r4, #68]   ; 0x44
 8004ec4:   7265        strb    r5, [r4, #9]
 8004ec6:   0a0a        lsrs    r2, r1, #8
 8004ec8:   4600        mov r0, r0
 8004eca:   726f        strb    r7, [r5, #9]
 8004ecc:   6d20        ldr r0, [r4, #80]   ; 0x50
 8004ece:   726f        strb    r7, [r5, #9]
 8004ed0:   2065        movs    r0, #101    ; 0x65
 8004ed2:   6e69        ldr r1, [r5, #100]  ; 0x64
 8004ed4:   6f66        ldr r6, [r4, #116]  ; 0x74
 8004ed6:   6d72        ldr r2, [r6, #84]   ; 0x54
 8004ed8:   7461        strb    r1, [r4, #17]
 8004eda:   6f69        ldr r1, [r5, #116]  ; 0x74
 8004edc:   206e        movs    r0, #110    ; 0x6e
 8004ede:   6261        str r1, [r4, #36]   ; 0x24
 8004ee0:   756f        strb    r7, [r5, #21]
 8004ee2:   2074        movs    r0, #116    ; 0x74
 8004ee4:   7241        strb    r1, [r0, #9]
 8004ee6:   7564        strb    r4, [r4, #21]
 8004ee8:   6e69        ldr r1, [r5, #100]  ; 0x64
 8004eea:   206f        movs    r0, #111    ; 0x6f
 8004eec:   6e6f        ldr r7, [r5, #100]  ; 0x64
 8004eee:   5320        strh    r0, [r4, r4]
 8004ef0:   4d54        ldr r5, [pc, #336]  ; (0x8005044)
 8004ef2:   3233        adds    r2, #51 ; 0x33
 8004ef4:   6100        str r0, [r0, #16]
 8004ef6:   646e        str r6, [r5, #68]   ; 0x44
 8004ef8:   6820        ldr r0, [r4, #0]
 8004efa:   7474        strb    r4, [r6, #17]
 8004efc:   3a70        subs    r2, #112    ; 0x70
 8004efe:   2f2f        cmp r7, #47 ; 0x2f
 8004f00:   7777        strb    r7, [r6, #29]
 8004f02:   2e77        cmp r6, #119    ; 0x77
 8004f04:   7473        strb    r3, [r6, #17]
 8004f06:   336d        adds    r3, #109    ; 0x6d
 8004f08:   6432        str r2, [r6, #64]   ; 0x40
 8004f0a:   6975        ldr r5, [r6, #20]
 8004f0c:   6f6e        ldr r6, [r5, #116]  ; 0x74
 8004f0e:   632e        str r6, [r5, #48]   ; 0x30
 8004f10:   6d6f        ldr r7, [r5, #84]   ; 0x54
 8004f12:   0a0a        lsrs    r2, r1, #8
 8004f14:   000a        movs    r2, r1
 8004f16:   0000        movs    r0, r0
 8004f18:   0040        lsls    r0, r0, #1
 8004f1a:   2000        movs    r0, #0
 8004f1c:   00f0        lsls    r0, r6, #3
 8004f1e:   2000        movs    r0, #0
 8004f20:   0020        movs    r0, r4
 8004f22:   2000        movs    r0, #0
 8004f24:   0100        lsls    r0, r0, #4
 8004f26:   0000        movs    r0, r0
 8004f28:   0040        lsls    r0, r0, #1
 8004f2a:   2000        movs    r0, #0
 8004f2c:   00f0        lsls    r0, r6, #3
 8004f2e:   2000        movs    r0, #0
 8004f30:   0020        movs    r0, r4
 8004f32:   2000        movs    r0, #0
 8004f34:   0201        lsls    r1, r0, #8
 8004f36:   0001        movs    r1, r0
 8004f38:   0040        lsls    r0, r0, #1
 8004f3a:   2000        movs    r0, #0
 8004f3c:   00f0        lsls    r0, r6, #3
 8004f3e:   2000        movs    r0, #0
 8004f40:   0020        movs    r0, r4
 8004f42:   2000        movs    r0, #0
 8004f44:   0302        lsls    r2, r0, #12
 8004f46:   0002        movs    r2, r0
 8004f48:   0040        lsls    r0, r0, #1
 8004f4a:   2000        movs    r0, #0
 8004f4c:   00f0        lsls    r0, r6, #3
 8004f4e:   2000        movs    r0, #0
 8004f50:   0020        movs    r0, r4
 8004f52:   2000        movs    r0, #0
 8004f54:   0403        lsls    r3, r0, #16
 8004f56:   0003        movs    r3, r0
 8004f58:   0040        lsls    r0, r0, #1
 8004f5a:   2000        movs    r0, #0
 8004f5c:   0000        movs    r0, r0
 8004f5e:   0000        movs    r0, r0
 8004f60:   0020        movs    r0, r4
 8004f62:   2000        movs    r0, #0
 8004f64:   0004        movs    r4, r0
 8004f66:   0004        movs    r4, r0
 8004f68:   0040        lsls    r0, r0, #1
 8004f6a:   2000        movs    r0, #0
 8004f6c:   0000        movs    r0, r0
 8004f6e:   0000        movs    r0, r0
 8004f70:   0020        movs    r0, r4
 8004f72:   2000        movs    r0, #0
 8004f74:   0005        movs    r5, r0
 8004f76:   0005        movs    r5, r0
 8004f78:   0040        lsls    r0, r0, #1
 8004f7a:   2000        movs    r0, #0
 8004f7c:   0080        lsls    r0, r0, #2
 8004f7e:   2000        movs    r0, #0
 8004f80:   0020        movs    r0, r4
 8004f82:   2000        movs    r0, #0
 8004f84:   0106        lsls    r6, r0, #4
 8004f86:   0006        movs    r6, r0
 8004f88:   0040        lsls    r0, r0, #1
 8004f8a:   2000        movs    r0, #0
 8004f8c:   0080        lsls    r0, r0, #2
 8004f8e:   2000        movs    r0, #0
 8004f90:   0020        movs    r0, r4
 8004f92:   2000        movs    r0, #0
 8004f94:   0207        lsls    r7, r0, #8
 8004f96:   0007        movs    r7, r0
 8004f98:   0040        lsls    r0, r0, #1
 8004f9a:   2000        movs    r0, #0
 8004f9c:   00c8        lsls    r0, r1, #3
 8004f9e:   2000        movs    r0, #0
 8004fa0:   0000        movs    r0, r0
 8004fa2:   0000        movs    r0, r0
 8004fa4:   0108        lsls    r0, r1, #4
 8004fa6:   00ff        lsls    r7, r7, #3
 8004fa8:   0040        lsls    r0, r0, #1
 8004faa:   2000        movs    r0, #0
 8004fac:   00c8        lsls    r0, r1, #3
 8004fae:   2000        movs    r0, #0
 8004fb0:   0000        movs    r0, r0
 8004fb2:   0000        movs    r0, r0
 8004fb4:   0209        lsls    r1, r1, #8
 8004fb6:   00ff        lsls    r7, r7, #3
 8004fb8:   0040        lsls    r0, r0, #1
 8004fba:   2000        movs    r0, #0
 8004fbc:   00c8        lsls    r0, r1, #3
 8004fbe:   2000        movs    r0, #0
 8004fc0:   0000        movs    r0, r0
 8004fc2:   0000        movs    r0, r0
 8004fc4:   030a        lsls    r2, r1, #12
 8004fc6:   00ff        lsls    r7, r7, #3
 8004fc8:   0040        lsls    r0, r0, #1
 8004fca:   2000        movs    r0, #0
 8004fcc:   00c8        lsls    r0, r1, #3
 8004fce:   2000        movs    r0, #0
 8004fd0:   0000        movs    r0, r0
 8004fd2:   0000        movs    r0, r0
 8004fd4:   040b        lsls    r3, r1, #16
 8004fd6:   00ff        lsls    r7, r7, #3
 8004fd8:   0040        lsls    r0, r0, #1
 8004fda:   2000        movs    r0, #0
    ...
 8004fe4:   000c        movs    r4, r1
 8004fe6:   00ff        lsls    r7, r7, #3
 8004fe8:   0040        lsls    r0, r0, #1
 8004fea:   2000        movs    r0, #0
    ...
 8004ff4:   000d        movs    r5, r1
 8004ff6:   00ff        lsls    r7, r7, #3
 8004ff8:   0040        lsls    r0, r0, #1
 8004ffa:   2000        movs    r0, #0
    ...
 8005004:   000e        movs    r6, r1
 8005006:   00ff        lsls    r7, r7, #3
 8005008:   0040        lsls    r0, r0, #1
 800500a:   2000        movs    r0, #0
    ...
 8005014:   000f        movs    r7, r1
 8005016:   00ff        lsls    r7, r7, #3
 8005018:   0048        lsls    r0, r1, #1
 800501a:   2000        movs    r0, #0
 800501c:   0080        lsls    r0, r0, #2
 800501e:   2000        movs    r0, #0
 8005020:   0020        movs    r0, r4
 8005022:   2000        movs    r0, #0
 8005024:   0300        lsls    r0, r0, #12
 8005026:   0008        movs    r0, r1
 8005028:   0048        lsls    r0, r1, #1
 800502a:   2000        movs    r0, #0
 800502c:   0080        lsls    r0, r0, #2
 800502e:   2000        movs    r0, #0
 8005030:   0020        movs    r0, r4
 8005032:   2000        movs    r0, #0
 8005034:   0401        lsls    r1, r0, #16
 8005036:   0009        movs    r1, r1
 8005038:   0048        lsls    r0, r1, #1
 800503a:   2000        movs    r0, #0
    ...
 8005044:   0002        movs    r2, r0
 8005046:   00ff        lsls    r7, r7, #3
 8005048:   0048        lsls    r0, r1, #1
 800504a:   2000        movs    r0, #0
    ...
 8005054:   0003        movs    r3, r0
 8005056:   00ff        lsls    r7, r7, #3
 8005058:   0048        lsls    r0, r1, #1
 800505a:   2000        movs    r0, #0
    ...
 8005064:   0004        movs    r4, r0
 8005066:   00ff        lsls    r7, r7, #3
 8005068:   0048        lsls    r0, r1, #1
 800506a:   2000        movs    r0, #0
    ...
 8005074:   0005        movs    r5, r0
 8005076:   00ff        lsls    r7, r7, #3
 8005078:   0048        lsls    r0, r1, #1
 800507a:   2000        movs    r0, #0
 800507c:   00a4        lsls    r4, r4, #2
 800507e:   2000        movs    r0, #0
 8005080:   0000        movs    r0, r0
 8005082:   0000        movs    r0, r0
 8005084:   0106        lsls    r6, r0, #4
 8005086:   00ff        lsls    r7, r7, #3
 8005088:   0048        lsls    r0, r1, #1
 800508a:   2000        movs    r0, #0
 800508c:   00a4        lsls    r4, r4, #2
 800508e:   2000        movs    r0, #0
 8005090:   0000        movs    r0, r0
 8005092:   0000        movs    r0, r0
 8005094:   0207        lsls    r7, r0, #8
 8005096:   00ff        lsls    r7, r7, #3
 8005098:   0048        lsls    r0, r1, #1
 800509a:   2000        movs    r0, #0
 800509c:   00a4        lsls    r4, r4, #2
 800509e:   2000        movs    r0, #0
 80050a0:   0000        movs    r0, r0
 80050a2:   0000        movs    r0, r0
 80050a4:   0308        lsls    r0, r1, #12
 80050a6:   00ff        lsls    r7, r7, #3
 80050a8:   0048        lsls    r0, r1, #1
 80050aa:   2000        movs    r0, #0
 80050ac:   00a4        lsls    r4, r4, #2
 80050ae:   2000        movs    r0, #0
 80050b0:   0000        movs    r0, r0
 80050b2:   0000        movs    r0, r0
 80050b4:   0409        lsls    r1, r1, #16
 80050b6:   00ff        lsls    r7, r7, #3
 80050b8:   0048        lsls    r0, r1, #1
 80050ba:   2000        movs    r0, #0
    ...
 80050c4:   000a        movs    r2, r1
 80050c6:   00ff        lsls    r7, r7, #3
 80050c8:   0048        lsls    r0, r1, #1
 80050ca:   2000        movs    r0, #0
    ...
 80050d4:   000b        movs    r3, r1
 80050d6:   00ff        lsls    r7, r7, #3
 80050d8:   0048        lsls    r0, r1, #1
 80050da:   2000        movs    r0, #0
    ...
 80050e4:   000c        movs    r4, r1
 80050e6:   00ff        lsls    r7, r7, #3
 80050e8:   0048        lsls    r0, r1, #1
 80050ea:   2000        movs    r0, #0
    ...
 80050f4:   000d        movs    r5, r1
 80050f6:   00ff        lsls    r7, r7, #3
 80050f8:   0048        lsls    r0, r1, #1
 80050fa:   2000        movs    r0, #0
    ...
 8005104:   000e        movs    r6, r1
 8005106:   00ff        lsls    r7, r7, #3
 8005108:   0048        lsls    r0, r1, #1
 800510a:   2000        movs    r0, #0
    ...
 8005114:   000f        movs    r7, r1
 8005116:   00ff        lsls    r7, r7, #3
 8005118:   0050        lsls    r0, r2, #1
 800511a:   2000        movs    r0, #0
    ...
 8005124:   000d        movs    r5, r1
 8005126:   00ff        lsls    r7, r7, #3
 8005128:   0050        lsls    r0, r2, #1
 800512a:   2000        movs    r0, #0
    ...
 8005134:   000e        movs    r6, r1
 8005136:   00ff        lsls    r7, r7, #3
 8005138:   0050        lsls    r0, r2, #1
 800513a:   2000        movs    r0, #0
    ...
 8005144:   000f        movs    r7, r1
 8005146:   00ff        lsls    r7, r7, #3
 8005148:   0048        lsls    r0, r1, #1
 800514a:   2000        movs    r0, #0
 800514c:   0901        lsrs    r1, r0, #4
 800514e:   0a01        lsrs    r1, r0, #8
 8005150:   0f01        lsrs    r1, r0, #28
 8005152:   0001        movs    r1, r0
 8005154:   1b00        subs    r0, r0, r4
 8005156:   0602        lsls    r2, r0, #24
 8005158:   0000        movs    r0, r0
 800515a:   0002        movs    r2, r0
 800515c:   0000        movs    r0, r0
 800515e:   0402        lsls    r2, r0, #16
 8005160:   0000        movs    r0, r0
 8005162:   0201        lsls    r1, r0, #8
 8005164:   0301        lsls    r1, r0, #12
 8005166:   0401        lsls    r1, r0, #16
 8005168:   0501        lsls    r1, r0, #20
 800516a:   0000        movs    r0, r0
 800516c:   0000        movs    r0, r0
 800516e:   0000        movs    r0, r0
 8005170:   1500        asrs    r0, r0, #20
 8005172:   1600        asrs    r0, r0, #24
 8005174:   1c00        adds    r0, r0, #0
 8005176:   0000        movs    r0, r0
 8005178:   0c01        lsrs    r1, r0, #16
 800517a:   0e00        lsrs    r0, r0, #24
 800517c:   0000        movs    r0, r0
 800517e:   0202        lsls    r2, r0, #8
 8005180:   0b01        lsrs    r1, r0, #12
 8005182:   0000        movs    r0, r0
 8005184:   0100        lsls    r0, r0, #4
 8005186:   0200        lsls    r0, r0, #8
    ...
 800519c:   0e01        lsrs    r1, r0, #24
 800519e:   1100        asrs    r0, r0, #4
 80051a0:   1200        asrs    r0, r0, #8
 80051a2:   0000        movs    r0, r0
 80051a4:   0000        movs    r0, r0
 80051a6:   1700        asrs    r0, r0, #28
 80051a8:   00f0        lsls    r0, r6, #3
 80051aa:   0000        movs    r0, r0
 80051ac:   0700        lsls    r0, r0, #28
 80051ae:   0000        movs    r0, r0
 80051b0:   3800        subs    r0, #0
 80051b2:   0000        movs    r0, r0
 80051b4:   0000        movs    r0, r0
 80051b6:   00c0        lsls    r0, r0, #3
 80051b8:   c000        stmia   r0!, {}
    ...
 80051c6:   0000        movs    r0, r0
 80051c8:   2d67        cmp r5, #103    ; 0x67
 80051ca:   0800        lsrs    r0, r0, #32
 80051cc:   2dc9        cmp r5, #201    ; 0xc9
 80051ce:   0800        lsrs    r0, r0, #32
 80051d0:   2de5        cmp r5, #229    ; 0xe5
 80051d2:   0800        lsrs    r0, r0, #32
 80051d4:   2d85        cmp r5, #133    ; 0x85
 80051d6:   0800        lsrs    r0, r0, #32
 80051d8:   2cdd        cmp r4, #221    ; 0xdd
 80051da:   0800        lsrs    r0, r0, #32
 80051dc:   2d2b        cmp r5, #43 ; 0x2b
 80051de:   0800        lsrs    r0, r0, #32
 80051e0:   2d4d        cmp r5, #77 ; 0x4d
 80051e2:   0800        lsrs    r0, r0, #32
    ...
 80051f0:   303d        adds    r0, #61 ; 0x3d
 80051f2:   0800        lsrs    r0, r0, #32
 80051f4:   3055        adds    r0, #85 ; 0x55
 80051f6:   0800        lsrs    r0, r0, #32
 80051f8:   2de5        cmp r5, #229    ; 0xe5
 80051fa:   0800        lsrs    r0, r0, #32
 80051fc:   2e55        cmp r6, #85 ; 0x55
 80051fe:   0800        lsrs    r0, r0, #32
 8005200:   2e77        cmp r6, #119    ; 0x77
 8005202:   0800        lsrs    r0, r0, #32
 8005204:   2e59        cmp r6, #89 ; 0x59
 8005206:   0800        lsrs    r0, r0, #32
 8005208:   2fdd        cmp r7, #221    ; 0xdd
 800520a:   0800        lsrs    r0, r0, #32
 800520c:   0000        movs    r0, r0
 800520e:   0000        movs    r0, r0
 8005210:   030c        lsls    r4, r1, #12
 8005212:   004d        lsls    r5, r1, #1
 8005214:   0061        lsls    r1, r4, #1
 8005216:   0070        lsls    r0, r6, #1
 8005218:   006c        lsls    r4, r5, #1
 800521a:   0065        lsls    r5, r4, #1
 800521c:   0312        lsls    r2, r2, #12
 800521e:   004c        lsls    r4, r1, #1
 8005220:   0065        lsls    r5, r4, #1
 8005222:   0061        lsls    r1, r4, #1
 8005224:   0066        lsls    r6, r4, #1
 8005226:   004c        lsls    r4, r1, #1
 8005228:   0061        lsls    r1, r4, #1
 800522a:   0062        lsls    r2, r4, #1
 800522c:   0073        lsls    r3, r6, #1
 800522e:   0112        lsls    r2, r2, #4
 8005230:   0200        lsls    r0, r0, #8
 8005232:   0002        movs    r2, r0
 8005234:   4000        ands    r0, r0
 8005236:   1eaf        subs    r7, r5, #2
 8005238:   0004        movs    r4, r0
 800523a:   0200        lsls    r0, r0, #8
 800523c:   0201        lsls    r1, r0, #8
 800523e:   0100        lsls    r0, r0, #4
 8005240:   0209        lsls    r1, r1, #8
 8005242:   0043        lsls    r3, r0, #1
 8005244:   0102        lsls    r2, r0, #4
 8005246:   c000        stmia   r0!, {}
 8005248:   0932        lsrs    r2, r6, #4
 800524a:   0004        movs    r4, r0
 800524c:   0100        lsls    r0, r0, #4
 800524e:   0202        lsls    r2, r0, #8
 8005250:   0001        movs    r1, r0
 8005252:   2405        movs    r4, #5
 8005254:   0100        lsls    r0, r0, #4
 8005256:   0510        lsls    r0, r2, #20
 8005258:   0124        lsls    r4, r4, #4
 800525a:   0103        lsls    r3, r0, #4
 800525c:   2404        movs    r4, #4
 800525e:   0602        lsls    r2, r0, #24
 8005260:   2405        movs    r4, #5
 8005262:   0006        movs    r6, r0
 8005264:   0701        lsls    r1, r0, #28
 8005266:   8205        strh    r5, [r0, #16]
 8005268:   4003        ands    r3, r0
 800526a:   ff00 0409   vshl.u8 d0, d9, d0
 800526e:   0001        movs    r1, r0
 8005270:   0a02        lsrs    r2, r0, #8
 8005272:   0000        movs    r0, r0
 8005274:   0700        lsls    r0, r0, #28
 8005276:   0305        lsls    r5, r0, #12
 8005278:   4002        ands    r2, r0
 800527a:   0000        movs    r0, r0
 800527c:   0507        lsls    r7, r0, #20
 800527e:   0281        lsls    r1, r0, #10
 8005280:   0040        lsls    r0, r0, #1
 8005282:   0400        lsls    r0, r0, #16
 8005284:   0903        lsrs    r3, r0, #4
 8005286:   0004        movs    r4, r0
 8005288:   0043        lsls    r3, r0, #1
 800528a:   0000        movs    r0, r0
 800528c:   03b0        lsls    r0, r6, #14
 800528e:   2000        movs    r0, #0
 8005290:   4670        mov r0, lr
 8005292:   0800        lsrs    r0, r0, #32

0x200002cc: wIstr               .word 0
0x200002d2: SaveRState          .hword 0
0x200002d4: SaveTState          .hword 0
0x200002e0: EPindex             .word 0
0x20000308: wInterruptMask      .word 0

// vim:set sw=4 ts=4 et:
