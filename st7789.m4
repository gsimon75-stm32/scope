define({ST7789_CMD_NOP},        0x00)
define({ST7789_CMD_SWRESET},    0x01)
define({ST7789_CMD_SLPIN},      0x10)
define({ST7789_CMD_SLPOUT},     0x11)
define({ST7789_CMD_PTLON},      0x12)
define({ST7789_CMD_NORON},      0x13)
define({ST7789_CMD_INVOFF},     0x20)
define({ST7789_CMD_INVON},      0x21)
define({ST7789_CMD_GAMSET},     0x26)
define({ST7789_CMD_DISPOFF},    0x28)
define({ST7789_CMD_DISPON},     0x29)
define({ST7789_CMD_CASET},      0x2a)
define({ST7789_CMD_RASET},      0x2b)
define({ST7789_CMD_RAMWR},      0x2c)
define({ST7789_CMD_RAMWRC},     0x3c)
define({ST7789_CMD_PTLAR},      0x30)
define({ST7789_CMD_MADCTL},     0x36)
define({ST7789_CMD_IDMOFF},     0x38)
define({ST7789_CMD_IDMON},      0x39)
define({ST7789_CMD_COLMOD},     0x3a)
define({ST7789_CMD_WRDISBV},    0x51)

define({ST7789_MODE}, {mov r0, {$1}
    bl st7789_cd})

define({ST7789_SEND}, {ifelse({$1}, {}, {}, {mov r0, $1
    bl st7789_send
    $0(shift($@))})})

