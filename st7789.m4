define({ST7789_CMD_NOP},        0x00)
define({ST7789_CMD_SWRESET},    0x01)
// 02..03
define({ST7789_CMD_RDDID},      0x04)
// 05..08
define({ST7789_CMD_RDDST},      0x09)
define({ST7789_CMD_RDDPM},      0x0a)
define({ST7789_CMD_RDDMADCTL},  0x0b)
define({ST7789_CMD_RDDCOLMOD},  0x0c)
define({ST7789_CMD_RDDIM},      0x0d)
define({ST7789_CMD_RDDSM},      0x0e)
define({ST7789_CMD_RDDSDR},     0x0f)
define({ST7789_CMD_SLPIN},      0x10)
define({ST7789_CMD_SLPOUT},     0x11)
define({ST7789_CMD_PTLON},      0x12)
define({ST7789_CMD_NORON},      0x13)
// 14..1f
define({ST7789_CMD_INVOFF},     0x20)
define({ST7789_CMD_INVON},      0x21)
// 22..25
define({ST7789_CMD_GAMSET},     0x26)
// 27
define({ST7789_CMD_DISPOFF},    0x28)
define({ST7789_CMD_DISPON},     0x29)
define({ST7789_CMD_CASET},      0x2a)
define({ST7789_CMD_RASET},      0x2b)
define({ST7789_CMD_RAMWR},      0x2c)
// 2d
define({ST7789_CMD_RAMRD},      0x2e)
// 2f
define({ST7789_CMD_PTLAR},      0x30)
// 31..32
define({ST7789_CMD_VSCRDEF},    0x33)
define({ST7789_CMD_TEOFF},      0x34)
define({ST7789_CMD_TEON},       0x35)
define({ST7789_CMD_MADCTL},     0x36)
define({ST7789_CMD_VSCRSADD},   0x37)
define({ST7789_CMD_IDMOFF},     0x38)
define({ST7789_CMD_IDMON},      0x39)
define({ST7789_CMD_COLMOD},     0x3a)
// 3b
define({ST7789_CMD_RAMWRC},     0x3c)
// 3d
define({ST7789_CMD_RAMRDC},     0x3e)
// 3f..43
define({ST7789_CMD_TESCAN},     0x44)
define({ST7789_CMD_RDTESCAN},   0x45)
// 46..50
define({ST7789_CMD_WRDISBV},    0x51)
define({ST7789_CMD_RDDISBV},    0x52)
define({ST7789_CMD_WRCTRLD},    0x53)
define({ST7789_CMD_RDCTRLD},    0x54)
define({ST7789_CMD_WRCACE},     0x55)
define({ST7789_CMD_RDCABC},     0x56)
// 57..5d
define({ST7789_CMD_WRCABCMB},   0x5e)
define({ST7789_CMD_RDCABCMB},   0x5f)
// 60..67
define({ST7789_CMD_RDABCSDR},   0x68)
// 69..af
define({ST7789_CMD_RAMCTRL},    0xb0)
define({ST7789_CMD_RGBCTRL},    0xb1)
define({ST7789_CMD_PORCTRL},    0xb2)
define({ST7789_CMD_FRCTRL1},    0xb3)
// b4..b6
define({ST7789_CMD_GCTRL},      0xb7)
// b8..b9
define({ST7789_CMD_DGMEN},      0xba)
define({ST7789_CMD_VCOMS},      0xbb)
// bc..bf
define({ST7789_CMD_LCMCTRL},    0xc0)
define({ST7789_CMD_IDSET},      0xc1)
define({ST7789_CMD_VDVVRHEN},   0xc2)
define({ST7789_CMD_VRHS},       0xc3)
define({ST7789_CMD_VDVSET},     0xc4)
define({ST7789_CMD_VCMOFSET},   0xc5)
define({ST7789_CMD_FRCTR2},     0xc6)
define({ST7789_CMD_CABCCTRL},   0xc7)
define({ST7789_CMD_REGSEL1},    0xc8)
// c9
define({ST7789_CMD_REGSEL2},    0xca)
// cb
define({ST7789_CMD_PWMFRSEL},   0xcc)
// cd..cf
define({ST7789_CMD_PWCTRL1},    0xd0)
// d1
define({ST7789_CMD_VAPVANEN},   0xd2)
// d3..d9
define({ST7789_CMD_RDID1},      0xda)
define({ST7789_CMD_RDID2},      0xdb)
define({ST7789_CMD_RDID3},      0xdc)
// dd..de
define({ST7789_CMD_CMD2EN},     0xdf)
define({ST7789_CMD_PVGAMCTRL},  0xe0)
define({ST7789_CMD_NVGAMCTRL},  0xe1)
define({ST7789_CMD_DGMLUTR},    0xe2)
define({ST7789_CMD_DGMLUTB},    0xe3)
define({ST7789_CMD_GATECTRL},   0xe4)
// e5..e7
define({ST7789_CMD_PWCTRL2},    0xe8)
define({ST7789_CMD_EQCTRL},     0xe9)
// ea..eb
define({ST7789_CMD_PROMCTRL},   0xec)
// ed..f9
define({ST7789_CMD_PROMEN},     0xfa)
// fb
define({ST7789_CMD_NVMSET},     0xfc)
// fd
define({ST7789_CMD_PROMACT},    0xfe)
// ff

define({ST7789_MODE}, {mov r0, {$1}
    bl st7789_cd})

define({ST7789_SEND}, {ifelse({$1}, {}, {}, {mov r0, $1
    bl st7789_send
    $0(shift($@))})})

dnl    // initialise:
dnl
dnl    bl st7789_setup
dnl    bl st7789_initialise
dnl
dnl    // use:
dnl
dnl    mov r0, 12   // row
dnl    mov r1, 18   // column
dnl    bl st7789_gotoxy
dnl
dnl    mov r1, 0
dnl    mov r0, 0xf800
dnl    bl st7789_set_color
dnl    
dnl    adr r0, LOC(YADDA)
dnl    bl puts

dnl vim: set ts=4 sw=4 et:
