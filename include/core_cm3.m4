dnl core_cm3.h
dnl CMSIS Cortex-M3 Core Peripheral Access Layer Header File
dnl V3.02
dnl 16. July 2012
dnl Copyright (C) 2009-2012 ARM Limited. All rights reserved.

    .cpu cortex-m3
    .thumb
    .syntax unified

include(boilerplate.m4)

dnl Define both Exception_Yadda=$2 and IRQ_Yadda=($2 - 0x10)
define({def_exc_irq}, {define(Exception_$1, $2)define(IRQ_$1, eval(($2)-0x10))})

dnl *******************************************************************************
dnl *                 CMSIS definitions
dnl *******************************************************************************

dnl CMSIS CM3 definitions
define({__CM3_CMSIS_VERSION_MAIN},          0x03)       dnl [31:16] CMSIS HAL main version
define({__CM3_CMSIS_VERSION_SUB},           0x01)       dnl [15:0]  CMSIS HAL sub version
define({__CM3_CMSIS_VERSION},               0x0301)     dnl CMSIS HAL version number
define({__CORTEX_M},                        0x03)       dnl Cortex-M Core
dnl __FPU_USED indicates whether an FPU is used or not. This core does not support an FPU at all.
define({__FPU_USED},                        0)

dnl *******************************************************************************
dnl *                 Register Abstraction
dnl  Core Register contain:
dnl  - Core Register
dnl  - Core NVIC Register
dnl  - Core SCB Register
dnl  - Core SysTick Register
dnl  - Core Debug Register
dnl  - Core MPU Register
dnl ******************************************************************************/

dnl Union type to access the Application Program Status Register (APSR).
defmask({PSR_ISR},                          0, 9)       dnl bit:  0.. 8  Exception number
defmask({PSR_ICI_LOW},                      10, 6)      dnl bit: 25..26  saved IT state
defmask({PSR_IT_LOW},                       10, 6)      dnl bit: 25..26  saved IT state
define({PSR_T},                             0x01000000) dnl bit:     24  Thumb bit (read 0)
defmask({PSR_ICI},                          25, 2)      dnl bit: 25..26  saved IT state
defmask({PSR_IT},                           25, 2)      dnl bit: 25..26  saved IT state
define({PSR_Q},                             0x08000000) dnl bit:     27  Saturation condition flag
define({PSR_V},                             0x10000000) dnl bit:     28  Overflow condition code flag
define({PSR_C},                             0x20000000) dnl bit:     29  Carry condition code flag
define({PSR_Z},                             0x40000000) dnl bit:     30  Zero condition code flag
define({PSR_N},                             0x80000000) dnl bit:     31  Negative condition code flag

dnl Union type to access the Interrupt Program Status Register (IPSR).

dnl Union type to access the Control Registers (CONTROL).
define({CONTROL_nPRIV},                     0x01)       dnl bit:      0  Execution privilege in Thread mode
define({CONTROL_SPSEL},                     0x02)       dnl bit:      1  Stack to be used
define({CONTROL_FPCA},                      0x04)       dnl bit:      2  FP extension active flag

dnl Structure type to access the Nested Vectored Interrupt Controller (NVIC).
define({NVIC_ISER},                         0x000)      dnl Offset: 0x000 (R/W)  Interrupt Set Enable Register
define({NVIC_ICER},                         0x080)      dnl Offset: 0x080 (R/W)  Interrupt Clear Enable Register
define({NVIC_ISPR},                         0x100)      dnl Offset: 0x100 (R/W)  Interrupt Set Pending Register
define({NVIC_ICPR},                         0x180)      dnl Offset: 0x180 (R/W)  Interrupt Clear Pending Register
define({NVIC_IABR},                         0x200)      dnl Offset: 0x200 (R/W)  Interrupt Active bit Register
define({NVIC_IP},                           0x300)      dnl Offset: 0x300 (R/W)  Interrupt Priority Register (8Bit wide)
define({NVIC_STIR},                         0xe00)      dnl Offset: 0xE00 ( /W)  Software Trigger Interrupt Register

dnl Structure type to access the System Control and ID Register not in the SCB.
define({SysCore_ICTR},                      1 * 4)      dnl Offset: 0x004 (R/ )  Interrupt Controller Type Register
define({SysCore_ACTLR},                     2 * 4)      dnl Offset: 0x008 (R/W)  Auxiliary Control Register
define({SysCore_ACTLR_DISMCYCINT},          0x01)
define({SysCore_ACTLR_DISDEFWBUF},          0x02)
define({SysCore_ACTLR_DISFOLD},             0x04)

dnl Structure type to access the System Control Block (SCB).
define({SCB_CPUID},                         0 * 4)      dnl Offset: 0x000 (R/ )  CPUID Base Register
define({SCB_ICSR},                          1 * 4)      dnl Offset: 0x004 (R/W)  Interrupt Control and State Register
define({SCB_VTOR},                          2 * 4)      dnl Offset: 0x008 (R/W)  Vector Table Offset Register
define({SCB_AIRCR},                         3 * 4)      dnl Offset: 0x00C (R/W)  Application Interrupt and Reset Control Register
define({SCB_SCR},                           4 * 4)      dnl Offset: 0x010 (R/W)  System Control Register
define({SCB_CCR},                           5 * 4)      dnl Offset: 0x014 (R/W)  Configuration Control Register
define({SCB_SHP},                           6 * 4)      dnl Offset: 0x018 (R/W)  System Handlers Priority Registers (4-7, 8-11, 12-15)
define({SCB_SHCSR},                         9 * 4)      dnl Offset: 0x024 (R/W)  System Handler Control and State Register
define({SCB_CFSR},                          10 * 4)     dnl Offset: 0x028 (R/W)  Configurable Fault Status Register
define({SCB_HFSR},                          11 * 4)     dnl Offset: 0x02C (R/W)  HardFault Status Register
define({SCB_DFSR},                          12 * 4)     dnl Offset: 0x030 (R/W)  Debug Fault Status Register
define({SCB_MMFAR},                         13 * 4)     dnl Offset: 0x034 (R/W)  MemManage Fault Address Register
define({SCB_BFAR},                          14 * 4)     dnl Offset: 0x038 (R/W)  BusFault Address Register
define({SCB_AFSR},                          15 * 4)     dnl Offset: 0x03C (R/W)  Auxiliary Fault Status Register
define({SCB_PFR},                           16 * 4)     dnl Offset: 0x040 (R/ )  Processor Feature Register
define({SCB_DFR},                           18 * 4)     dnl Offset: 0x048 (R/ )  Debug Feature Register
define({SCB_AFR},                           19 * 4)     dnl Offset: 0x04C (R/ )  Auxiliary Feature Register
define({SCB_MMFR},                          20 * 4)     dnl Offset: 0x050 (R/ )  Memory Model Feature Register
define({SCB_ISAR},                          24 * 4)     dnl Offset: 0x060 (R/ )  Instruction Set Attributes Register
define({SCB_CPACR},                         34 * 4)     dnl Offset: 0x088 (R/W)  Coprocessor Access Control Register

dnl SCB CPUID Register Definitions
defmask({SCB_CPUID_REVISION},               0, 4)
defmask({SCB_CPUID_PARTNO},                 4, 12)
defmask({SCB_CPUID_ARCHITECTURE},           16, 4)
defmask({SCB_CPUID_VARIANT},                20, 4)
defmask({SCB_CPUID_IMPLEMENTER},            24, 8)

dnl SCB Interrupt Control State Register Definitions
defmask({SCB_ICSR_VECTACTIVE},              0, 9)
define({SCB_ICSR_RETTOBASE},                0x00000800)
defmask({SCB_ICSR_VECTPENDING},             12, 10)
define({SCB_ICSR_ISRPENDING},               0x00400000)
define({SCB_ICSR_ISRPREEMPT},               0x00800000)
define({SCB_ICSR_PENDSTCLR},                0x02000000)
define({SCB_ICSR_PENDSTSET},                0x04000000)
define({SCB_ICSR_PENDSVCLR},                0x08000000)
define({SCB_ICSR_PENDSVSET},                0x10000000)
define({SCB_ICSR_NMIPENDSET},               0x80000000)

dnl SCB Application Interrupt and Reset Control Register Definitions
define({SCB_AIRCR_VECTRESET},               0x0001)
define({SCB_AIRCR_VECTCLRACTIVE},           0x0002)
define({SCB_AIRCR_SYSRESETREQ},             0x0004)
defmask({SCB_AIRCR_PRIGROUP},               8, 3)
define({SCB_AIRCR_ENDIANESS},               0x8000)
defmask({SCB_AIRCR_VECTKEYSTAT},            16, 16)
defmask({SCB_AIRCR_VECTKEY},                16, 16)

dnl SCB System Control Register Definitions
define({SCB_SCR_SEVONPEND},                 0x10)
define({SCB_SCR_SLEEPDEEP},                 0x04)
define({SCB_SCR_SLEEPONEXIT},               0x02)

dnl SCB Configuration Control Register Definitions
define({SCB_CCR_NONBASETHRDENA},            0x001)
define({SCB_CCR_USERSETMPEND},              0x002)
define({SCB_CCR_UNALIGN_TRP},               0x008)
define({SCB_CCR_DIV_0_TRP},                 0x010)
define({SCB_CCR_BFHFNMIGN},                 0x100)
define({SCB_CCR_STKALIGN},                  0x200)

dnl SCB System Handler Control and State Register Definitions
define({SCB_SHCSR_MEMFAULTACT},             0x00001)
define({SCB_SHCSR_BUSFAULTACT},             0x00002)
define({SCB_SHCSR_USGFAULTACT},             0x00008)
define({SCB_SHCSR_SVCALLACT},               0x00080)
define({SCB_SHCSR_MONITORACT},              0x00100)
define({SCB_SHCSR_PENDSVACT},               0x00400)
define({SCB_SHCSR_SYSTICKACT},              0x00800)
define({SCB_SHCSR_USGFAULTPENDED},          0x01000)
define({SCB_SHCSR_MEMFAULTPENDED},          0x02000)
define({SCB_SHCSR_BUSFAULTPENDED},          0x04000)
define({SCB_SHCSR_SVCALLPENDED},            0x08000)
define({SCB_SHCSR_MEMFAULTENA},             0x10000)
define({SCB_SHCSR_BUSFAULTENA},             0x20000)
define({SCB_SHCSR_USGFAULTENA},             0x40000)

dnl SCB Configurable Fault Status Registers Definitions
defmask({SCB_CFSR_USGFAULTSR},              16, 16)
defmask({SCB_CFSR_BUSFAULTSR},              8, 8)
defmask({SCB_CFSR_MEMFAULTSR},              0, 8)
define({SCB_CFSR_IACCVIOL},                 0x00000001)
define({SCB_CFSR_DACCVIOL},                 0x00000002)
define({SCB_CFSR_MUNSTKERR},                0x00000008)
define({SCB_CFSR_MSTKERR},                  0x00000010)
define({SCB_CFSR_MMARVALID},                0x00000080)
define({SCB_CFSR_IBUSERR},                  0x00000100)
define({SCB_CFSR_PRECISERR},                0x00000200)
define({SCB_CFSR_IMPRECISERR},              0x00000400)
define({SCB_CFSR_UNSTKERR},                 0x00000800)
define({SCB_CFSR_STKERR},                   0x00001000)
define({SCB_CFSR_BFARVALID},                0x00008000)
define({SCB_CFSR_UNDEFINSTR},               0x00010000)
define({SCB_CFSR_INVSTATE},                 0x00020000)
define({SCB_CFSR_INVPC},                    0x00040000)
define({SCB_CFSR_NOCP},                     0x00080000)
define({SCB_CFSR_UNALIGNED},                0x01000000)
define({SCB_CFSR_DIVBYZERO},                0x02000000)

dnl SCB Hard Fault Status Registers Definitions
define({SCB_HFSR_VECTTBL},                  0x00000002)
define({SCB_HFSR_FORCED},                   0x40000000)
define({SCB_HFSR_DEBUGEVT},                 0x80000000)

dnl SCB Debug Fault Status Register Definitions
define({SCB_DFSR_HALTED},                   0x01)
define({SCB_DFSR_BKPT},                     0x02)
define({SCB_DFSR_DWTTRAP},                  0x04)
define({SCB_DFSR_VCATCH},                   0x08)
define({SCB_DFSR_EXTERNAL},                 0x10)

dnl Structure type to access the System Timer (SysTick).
define({SysTick_CTRL},                      0 * 4)      dnl Offset: 0x000 (R/W)  SysTick Control and Status Register
define({SysTick_LOAD},                      1 * 4)      dnl Offset: 0x004 (R/W)  SysTick Reload Value Register
define({SysTick_VAL},                       2 * 4)      dnl Offset: 0x008 (R/W)  SysTick Current Value Register
define({SysTick_CALIB},                     3 * 4)      dnl Offset: 0x00C (R/ )  SysTick Calibration Register

dnl SysTick Control / Status Register Definitions
define({SysTick_CTRL_ENABLE},               0x00001)
define({SysTick_CTRL_TICKINT},              0x00002)
define({SysTick_CTRL_CLKSOURCE},            0x00004)
define({SysTick_CTRL_COUNTFLAG},            0x10000)

dnl SysTick Calibration Register Definitions
defmask({SysTick_CALIB_TENMS},              0, 24)
define({SysTick_CALIB_SKEW},                0x40000000)
define({SysTick_CALIB_NOREF},               0x80000000)

dnl Structure type to access the Instrumentation Trace Macrocell Register (ITM).
define({ITM_PORT},                          0x000)      dnl Offset: 0x000 ( /W)  ITM Stimulus Port
define({ITM_TER},                           0xE00)      dnl Offset: 0xE00 (R/W)  ITM Trace Enable Register
define({ITM_TPR},                           0xE40)      dnl Offset: 0xE40 (R/W)  ITM Trace Privilege Register
define({ITM_TCR},                           0xE80)      dnl Offset: 0xE80 (R/W)  ITM Trace Control Register
define({ITM_IWR},                           0xEF8)      dnl Offset: 0xEF8 ( /W)  ITM Integration Write Register
define({ITM_IRR},                           0xEFC)      dnl Offset: 0xEFC (R/ )  ITM Integration Read Register
define({ITM_IMCR},                          0xF00)      dnl Offset: 0xF00 (R/W)  ITM Integration Mode Control Register
define({ITM_LAR},                           0xFB0)      dnl Offset: 0xFB0 ( /W)  ITM Lock Access Register
define({ITM_LSR},                           0xFB4)      dnl Offset: 0xFB4 (R/ )  ITM Lock Status Register
define({ITM_PID4},                          0xFD0)      dnl Offset: 0xFD0 (R/ )  ITM Peripheral Identification Register #4
define({ITM_PID5},                          0xFD4)      dnl Offset: 0xFD4 (R/ )  ITM Peripheral Identification Register #5
define({ITM_PID6},                          0xFD8)      dnl Offset: 0xFD8 (R/ )  ITM Peripheral Identification Register #6
define({ITM_PID7},                          0xFDC)      dnl Offset: 0xFDC (R/ )  ITM Peripheral Identification Register #7
define({ITM_PID0},                          0xFE0)      dnl Offset: 0xFE0 (R/ )  ITM Peripheral Identification Register #0
define({ITM_PID1},                          0xFE4)      dnl Offset: 0xFE4 (R/ )  ITM Peripheral Identification Register #1
define({ITM_PID2},                          0xFE8)      dnl Offset: 0xFE8 (R/ )  ITM Peripheral Identification Register #2
define({ITM_PID3},                          0xFEC)      dnl Offset: 0xFEC (R/ )  ITM Peripheral Identification Register #3
define({ITM_CID0},                          0xFF0)      dnl Offset: 0xFF0 (R/ )  ITM Component  Identification Register #0
define({ITM_CID1},                          0xFF4)      dnl Offset: 0xFF4 (R/ )  ITM Component  Identification Register #1
define({ITM_CID2},                          0xFF8)      dnl Offset: 0xFF8 (R/ )  ITM Component  Identification Register #2
define({ITM_CID3},                          0xFFC)      dnl Offset: 0xFFC (R/ )  ITM Component  Identification Register #3

dnl ITM Trace Control Register Definitions
define({ITM_TCR_ITMENA},                    0x000001)
define({ITM_TCR_TSENA},                     0x000002)
define({ITM_TCR_SYNCENA},                   0x000004)
define({ITM_TCR_DWTENA},                    0x000008)
define({ITM_TCR_SWOENA},                    0x000010)
define({ITM_TCR_TSPrescale},                0x000100)
define({ITM_TCR_GTSFREQ},                   0x000400)
define({ITM_TCR_TraceBusID},                0x010000)
define({ITM_TCR_BUSY},                      0x800000)

dnl ITM Lock Status Register Definitions
define({ITM_LSR_Present},                   0x01)
define({ITM_LSR_Access},                    0x02)
define({ITM_LSR_ByteAcc},                   0x04)

dnl Structure type to access the Data Watchpoint and Trace Register (DWT).
define({DWT_CTRL},                          0 * 4)      dnl Offset: 0x000 (R/W)  Control Register
define({DWT_CYCCNT},                        1 * 4)      dnl Offset: 0x004 (R/W)  Cycle Count Register
define({DWT_CPICNT},                        2 * 4)      dnl Offset: 0x008 (R/W)  CPI Count Register
define({DWT_EXCCNT},                        3 * 4)      dnl Offset: 0x00C (R/W)  Exception Overhead Count Register
define({DWT_SLEEPCNT},                      4 * 4)      dnl Offset: 0x010 (R/W)  Sleep Count Register
define({DWT_LSUCNT},                        5 * 4)      dnl Offset: 0x014 (R/W)  LSU Count Register
define({DWT_FOLDCNT},                       6 * 4)      dnl Offset: 0x018 (R/W)  Folded-instruction Count Register
define({DWT_PCSR},                          7 * 4)      dnl Offset: 0x01C (R/ )  Program Counter Sample Register
define({DWT_COMP0},                         8 * 4)      dnl Offset: 0x020 (R/W)  Comparator Register 0
define({DWT_MASK0},                         9 * 4)      dnl Offset: 0x024 (R/W)  Mask Register 0
define({DWT_FUNCTION0},                     10 * 4)     dnl Offset: 0x028 (R/W)  Function Register 0
define({DWT_COMP1},                         12 * 4)     dnl Offset: 0x030 (R/W)  Comparator Register 1
define({DWT_MASK1},                         13 * 4)     dnl Offset: 0x034 (R/W)  Mask Register 1
define({DWT_FUNCTION1},                     14 * 4)     dnl Offset: 0x038 (R/W)  Function Register 1
define({DWT_COMP2},                         16 * 4)     dnl Offset: 0x040 (R/W)  Comparator Register 2
define({DWT_MASK2},                         17 * 4)     dnl Offset: 0x044 (R/W)  Mask Register 2
define({DWT_FUNCTION2},                     18 * 4)     dnl Offset: 0x048 (R/W)  Function Register 2
define({DWT_COMP3},                         20 * 4)     dnl Offset: 0x050 (R/W)  Comparator Register 3
define({DWT_MASK3},                         21 * 4)     dnl Offset: 0x054 (R/W)  Mask Register 3
define({DWT_FUNCTION3},                     22 * 4)     dnl Offset: 0x058 (R/W)  Function Register 3

dnl DWT Control Register Definitions
define({DWT_CTRL_CYCCNTENA},                0x00000001) 
define({DWT_CTRL_POSTPRESET},               0x00000002) 
define({DWT_CTRL_POSTINIT},                 0x00000020) 
define({DWT_CTRL_CYCTAP},                   0x00000200) 
define({DWT_CTRL_SYNCTAP},                  0x00000400) 
define({DWT_CTRL_PCSAMPLENA},               0x00001000) 
define({DWT_CTRL_EXCTRCENA},                0x00010000) 
define({DWT_CTRL_CPIEVTENA},                0x00020000) 
define({DWT_CTRL_EXCEVTENA},                0x00040000) 
define({DWT_CTRL_SLEEPEVTENA},              0x00080000) 
define({DWT_CTRL_LSUEVTENA},                0x00100000) 
define({DWT_CTRL_FOLDEVTENA},               0x00200000) 
define({DWT_CTRL_CYCEVTENA},                0x00400000) 
define({DWT_CTRL_NOPRFCNT},                 0x01000000) 
define({DWT_CTRL_NOCYCCNT},                 0x02000000) 
define({DWT_CTRL_NOEXTTRIG},                0x04000000) 
define({DWT_CTRL_NOTRCPKT},                 0x08000000) 
define({DWT_CTRL_NUMCOMP},                  0x10000000) 

dnl DWT Comparator Function Register Definitions
define({DWT_FUNCTION_FUNCTION},             0x00000001) 
define({DWT_FUNCTION_EMITRANGE},            0x00000020) 
define({DWT_FUNCTION_CYCMATCH},             0x00000080) 
define({DWT_FUNCTION_DATAVMATCH},           0x00000100) 
define({DWT_FUNCTION_LNK1ENA},              0x00000200) 
define({DWT_FUNCTION_DATAVSIZE},            0x00000400) 
define({DWT_FUNCTION_DATAVADDR0},           0x00001000) 
define({DWT_FUNCTION_DATAVADDR1},           0x00010000) 
define({DWT_FUNCTION_MATCHED},              0x01000000) 

dnl Structure type to access the Trace Port Interface Register (TPI).
define({TPI_SSPSR},                         0x000)      dnl Offset: 0x000 (R/ )  Supported Parallel Port Size Register
define({TPI_CSPSR},                         0x004)      dnl Offset: 0x004 (R/W)  Current Parallel Port Size Register
define({TPI_ACPR},                          0x010)      dnl Offset: 0x010 (R/W)  Asynchronous Clock Prescaler Register
define({TPI_SPPR},                          0x0F0)      dnl Offset: 0x0F0 (R/W)  Selected Pin Protocol Register
define({TPI_FFSR},                          0x300)      dnl Offset: 0x300 (R/ )  Formatter and Flush Status Register
define({TPI_FFCR},                          0x304)      dnl Offset: 0x304 (R/W)  Formatter and Flush Control Register
define({TPI_FSCR},                          0x308)      dnl Offset: 0x308 (R/ )  Formatter Synchronization Counter Register
define({TPI_TRIGGER},                       0xEE8)      dnl Offset: 0xEE8 (R/ )  TRIGGER
define({TPI_FIFO0},                         0xEEC)      dnl Offset: 0xEEC (R/ )  Integration ETM Data
define({TPI_ITATBCTR2},                     0xEF0)      dnl Offset: 0xEF0 (R/ )  ITATBCTR2
define({TPI_ITATBCTR0},                     0xEF8)      dnl Offset: 0xEF8 (R/ )  ITATBCTR0
define({TPI_FIFO1},                         0xEFC)      dnl Offset: 0xEFC (R/ )  Integration ITM Data
define({TPI_ITCTRL},                        0xF00)      dnl Offset: 0xF00 (R/W)  Integration Mode Control
define({TPI_CLAIMSET},                      0xFA0)      dnl Offset: 0xFA0 (R/W)  Claim tag set
define({TPI_CLAIMCLR},                      0xFA4)      dnl Offset: 0xFA4 (R/W)  Claim tag clear
define({TPI_DEVID},                         0xFC8)      dnl Offset: 0xFC8 (R/ )  TPIU_DEVID
define({TPI_DEVTYPE},                       0xFCC)      dnl Offset: 0xFCC (R/ )  TPIU_DEVTYPE

dnl TPI Formatter and Flush Status Register Definitions
define({TPI_FFSR_FlInProg},                 0x01)
define({TPI_FFSR_FtStopped},                0x02)
define({TPI_FFSR_TCPresent},                0x04)
define({TPI_FFSR_FtNonStop},                0x08)

dnl TPI Formatter and Flush Control Register Definitions
define({TPI_FFCR_EnFCont},                  0x002)
define({TPI_FFCR_TrigIn},                   0x100)

dnl TPI Integration ETM Data Register Definitions (FIFOn)
defmask({TPI_FIFO_ETM},                     0, 24)
defmask({TPI_FIFO_ETM_bytecount},           24, 2)
define({TPI_FIFO_ETM_ATVALID},              0x04000000)
defmask({TPI_FIFO_ITM_bytecount},           27, 2)
define({TPI_FIFO_ITM_ATVALID},              0x20000000)

dnl TPI DEVID Register Definitions
defmask({TPI_DEVID_NrTraceInput},           0, 5)
define({TPI_DEVID_AsynClkIn},               0x020)
defmask({TPI_DEVID_MinBufSz},               6, 3)
define({TPI_DEVID_PTINVALID},               0x200)
define({TPI_DEVID_MANCVALID},               0x400)
define({TPI_DEVID_NRZVALID},                0x800)

dnl TPI DEVTYPE Register Definitions
defmask({TPI_DEVTYPE_SubType},              0, 4)
defmask({TPI_DEVTYPE_MajorType},            4, 4)

dnl Structure type to access the Memory Protection Unit (MPU).
define({MPU_TYPE},                          0 * 4)      dnl Offset: 0x000 (R/ )  MPU Type Register
define({MPU_CTRL},                          1 * 4)      dnl Offset: 0x004 (R/W)  MPU Control Register
define({MPU_RNR},                           2 * 4)      dnl Offset: 0x008 (R/W)  MPU Region RNRber Register
define({MPU_RBAR},                          3 * 4)      dnl Offset: 0x00C (R/W)  MPU Region Base Address Register
define({MPU_RASR},                          4 * 4)      dnl Offset: 0x010 (R/W)  MPU Region Attribute and Size Register
define({MPU_RBAR_A1},                       5 * 4)      dnl Offset: 0x014 (R/W)  MPU Alias 1 Region Base Address Register
define({MPU_RASR_A1},                       6 * 4)      dnl Offset: 0x018 (R/W)  MPU Alias 1 Region Attribute and Size Register
define({MPU_RBAR_A2},                       7 * 4)      dnl Offset: 0x01C (R/W)  MPU Alias 2 Region Base Address Register
define({MPU_RASR_A2},                       8 * 4)      dnl Offset: 0x020 (R/W)  MPU Alias 2 Region Attribute and Size Register
define({MPU_RBAR_A3},                       9 * 4)      dnl Offset: 0x024 (R/W)  MPU Alias 3 Region Base Address Register
define({MPU_RASR_A3},                       10 * 4)     dnl Offset: 0x028 (R/W)  MPU Alias 3 Region Attribute and Size Register

dnl MPU Type Register
defmask({MPU_TYPE_SEPARATE},                0, 8)
defmask({MPU_TYPE_DREGION},                 8, 8)
defmask({MPU_TYPE_IREGION},                 16, 8)

dnl MPU Control Register
define({MPU_CTRL_ENABLE},                   0x01)
define({MPU_CTRL_HFNMIENA},                 0x02)
define({MPU_CTRL_PRIVDEFENA},               0x04)

dnl MPU Region Base Address Register
defmask({MPU_RBAR_REGION},                  0, 4)
define({MPU_RBAR_VALID},                    0x10)
define({MPU_RBAR_ADDR},                     0x20)

dnl MPU Region Attribute and Size Register
define({MPU_RASR_ENABLE},                   0x00000001)
defmask({MPU_RASR_SIZE},                    1, 5)
defmask({MPU_RASR_SRD},                     8, 8)
defmask({MPU_RASR_ATTRS},                   16, 16)
define({MPU_RASR_B},                        0x00010000)
define({MPU_RASR_C},                        0x00020000)
define({MPU_RASR_S},                        0x00040000)
defmask({MPU_RASR_TEX},                     19, 2)
defmask({MPU_RASR_AP},                      24, 2)
define({MPU_RASR_XN},                       0x10000000)

dnl Structure type to access the Core Debug Register (CoreDebug).
define({CoreDebug_DHCSR},                   0 * 4)      dnl Offset: 0x000 (R/W)  Debug Halting Control and Status Register
define({CoreDebug_DCRSR},                   1 * 4)      dnl Offset: 0x004 ( /W)  Debug Core Register Selector Register
define({CoreDebug_DCRDR},                   2 * 4)      dnl Offset: 0x008 (R/W)  Debug Core Register Data Register
define({CoreDebug_DEMCR},                   3 * 4)      dnl Offset: 0x00C (R/W)  Debug Exception and Monitor Control Register

dnl Debug Halting Control and Status Register
define({CoreDebug_DHCSR_C_DEBUGEN},         0x00000001)
define({CoreDebug_DHCSR_C_HALT},            0x00000002)
define({CoreDebug_DHCSR_C_STEP},            0x00000004)
define({CoreDebug_DHCSR_C_MASKINTS},        0x00000008)
define({CoreDebug_DHCSR_C_SNAPSTALL},       0x00000020)
defmask({CoreDebug_DHCSR_DBGKEY},           16, 16)
define({CoreDebug_DHCSR_S_REGRDY},          0x00010000)
define({CoreDebug_DHCSR_S_HALT},            0x00020000)
define({CoreDebug_DHCSR_S_SLEEP},           0x00040000)
define({CoreDebug_DHCSR_S_LOCKUP},          0x00080000)
define({CoreDebug_DHCSR_S_RETIRE_ST},       0x01000000)
define({CoreDebug_DHCSR_S_RESET_ST},        0x02000000)

dnl Debug Core Register Selector Register
defmask({CoreDebug_DCRSR_REGSEL},           0 , 16)
defmask({CoreDebug_DCRSR_REGWnR},           16, 16)

dnl Debug Exception and Monitor Control Register
define({CoreDebug_DEMCR_VC_CORERESET},      0x00000001)
define({CoreDebug_DEMCR_VC_MMERR},          0x00000010)
define({CoreDebug_DEMCR_VC_NOCPERR},        0x00000020)
define({CoreDebug_DEMCR_VC_CHKERR},         0x00000040)
define({CoreDebug_DEMCR_VC_STATERR},        0x00000080)
define({CoreDebug_DEMCR_VC_BUSERR},         0x00000100)
define({CoreDebug_DEMCR_VC_INTERR},         0x00000200)
define({CoreDebug_DEMCR_VC_HARDERR},        0x00000400)
define({CoreDebug_DEMCR_MON_EN},            0x00010000)
define({CoreDebug_DEMCR_MON_PEND},          0x00020000)
define({CoreDebug_DEMCR_MON_STEP},          0x00040000)
define({CoreDebug_DEMCR_MON_REQ},           0x00080000)
define({CoreDebug_DEMCR_TRCENA},            0x01000000)

dnl Memory mapping of Cortex-M3 Hardware
define({SCS_BASE},                          0xE000E000)                 dnl System Control Space Base Address
define({ITM_BASE},                          0xE0000000)                 dnl ITM Base Address
define({DWT_BASE},                          0xE0001000)                 dnl DWT Base Address
define({TPI_BASE},                          0xE0040000)                 dnl TPI Base Address
define({CoreDebug_BASE},                    0xE000EDF0)                 dnl Core Debug Base Address
define({SysCore_BASE},                      heval(SCS_BASE + 0x0000))   dnl SysCore Base Address
define({SysTick_BASE},                      heval(SCS_BASE + 0x0010))   dnl SysTick Base Address
define({NVIC_BASE},                         heval(SCS_BASE + 0x0100))   dnl NVIC Base Address
define({SCB_BASE},                          heval(SCS_BASE + 0x0D00))   dnl System Control Block Base Address
define({MPU_BASE},                          heval(SCS_BASE + 0x0D90))   dnl Memory Protection Unit

dnl bit-banding address conversion
define({BB}, {heval(($1 & 0xfff00000) + 0x02000000 + (($1 & 0xfffff) << 5) + ($2 << 2))})

dnl vim: set sw=4 ts=4 et:
