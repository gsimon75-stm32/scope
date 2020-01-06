// --------------------------------------------------------------------------
// Case-dependent constants
define({USB_VENDOR_ID},             0x5AFE)
define({USB_PRODUCT_ID},            0x7E57)

define({USB_EP0_BUFSIZE},           0x08)
define({USB_EP1_RX_BUFSIZE},        0x08)
define({USB_EP1_TX_BUFSIZE},        0x40)


// --------------------------------------------------------------------------
// Structure of configuration for USB Endpoints
// This is used to initialise the Endpoint Descriptors in the PMA,
// the EPnR Endpoint Registers and contains the rx-notify and tx-complete
// callback addresses (set to zero if not needed).
// The read-only symbol 'usb_ep_configs' is an array of such structs.
define({USB_EP_CONFIG_EPR},         0x00)
define({USB_EP_CONFIG_TXBUF_ADDR},  0x04)
define({USB_EP_CONFIG_RXBUF_ADDR},  0x08)
define({USB_EP_CONFIG_TXBUF_SIZE},  0x0c)
define({USB_EP_CONFIG_RXBUF_SIZE},  0x0e)
define({USB_EP_CONFIG_TX_CALLBACK}, 0x10)
define({USB_EP_CONFIG_RX_CALLBACK}, 0x14)
define({USB_EP_CONFIG_SIZEOF},      0x18)


// --------------------------------------------------------------------------
// USB Endpoint Register Initialiser
// Convenience macro for calculating values for .USB_EP_CONFIG_EPR above
// Args: TYPE, KIND, EA
define({USB_EPR_INIT}, {heval(USB_EPR_EP_RX_VALID + $1 + $2 + USB_EPR_EP_TX_NAK + ($3 << USB_EPR_EA_Shift))})


// --------------------------------------------------------------------------
// Structure for USB TX buffer state
// As transmission may be chunked if the data is longer than the max packet
// size, a pointer and length must be maintained to keep track of the progress.
// The read-write symbol 'usb_ep_buffers' is an array of such structs.
define({USB_EP_BUFFER_PTR},         0x00)
define({USB_EP_BUFFER_LEN},         0x04)
define({USB_EP_BUFFER_SIZEOF},      0x08)


// --------------------------------------------------------------------------
// USB Standard related constants

// bmRequestType.Direction
define({USB_REQ_DIR_IN},                0x00)
define({USB_REQ_DIR_OUT},               0x80)

// bmRequestType.Type
define({USB_REQ_TYPE_STANDARD},         0x00)
define({USB_REQ_TYPE_CLASS},            0x20)
define({USB_REQ_TYPE_VENDOR},           0x40)
define({USB_REQ_TYPE_RESERVED},         0x60)

// bmRequestType.Recipient
define({USB_REQ_RECIPIENT_DEVICE},      0x00)
define({USB_REQ_RECIPIENT_INTEFACE},    0x01)
define({USB_REQ_RECIPIENT_ENDPOINT},    0x02)
define({USB_REQ_RECIPIENT_OTHER},       0x03)

// USB Standard Device Request Codes
define({USB_REQ_GET_DEV_STATUS},        0x0080)
define({USB_REQ_SET_ADDRESS},           0x0500)
define({USB_REQ_GET_DESCRIPTOR},        0x0680)
define({USB_REQ_SET_DESCRIPTOR},        0x0700)
define({USB_REQ_GET_CONFIGURATION},     0x0880)
define({USB_REQ_SET_CONFIGURATION},     0x0900)

// USB Standard Interface Request Codes
define({USB_REQ_GET_IFACE_STATUS},      0x0081)
define({USB_REQ_GET_INTERFACE},         0x0a81)
define({USB_REQ_SET_INTERFACE},         0x0b01)

// USB Standard Endpoint Request Codes
define({USB_REQ_GET_EP_STATUS},         0x0082)
define({USB_REQ_SYNCH_FRAME},           0x0c02)

// USB Descriptor Types
define({USB_DESC_TYPE_DEVICE},          1)
define({USB_DESC_TYPE_CFG},             2)
define({USB_DESC_TYPE_STR},             3)
define({USB_DESC_TYPE_IFACE},           4)
define({USB_DESC_TYPE_EP},              5)
define({USB_DESC_TYPE_DEVICE_QR},       6)
define({USB_DESC_TYPE_OSPEED_CFG},      7)
define({USB_DESC_TYPE_IFACE_PWR},       8)

// USB Device Classes
define({USB_CLASS_RESERVED},            0x00)
define({USB_CLASS_AUDIO},               0x01)
define({USB_CLASS_COMM},                0x02)
define({USB_CLASS_HID},                 0x03)
define({USB_CLASS_MONITOR},             0x04)
define({USB_CLASS_PHYSIC},              0x05)
define({USB_CLASS_POWER},               0x06)
define({USB_CLASS_PRINTER},             0x07)
define({USB_CLASS_STORAGE},             0x08)
define({USB_CLASS_HUB},                 0x09)
define({USB_CLASS_VENDOR_SPEC},         0xff)

// Setup packet structure
define({USB_PKT_SETUP_REQTYPE},         0)
define({USB_PKT_SETUP_REQ},             1)
define({USB_PKT_SETUP_VALUE},           4)
define({USB_PKT_SETUP_VALUE_L},         4)
define({USB_PKT_SETUP_VALUE_H},         5)
define({USB_PKT_SETUP_INDEX},           8)
define({USB_PKT_SETUP_INDEX_L},         8)
define({USB_PKT_SETUP_INDEX_H},         9)
define({USB_PKT_SETUP_LENGTH},          12)
define({USB_PKT_SETUP_LENGTH_L},        12)
define({USB_PKT_SETUP_LENGTH_H},        13)

// Configuration Descriptor bmAttributes values
define({USB_CFG_ATTR_SELF_POWERED},     0x40)
define({USB_CFG_ATTR_REMOTE_WAKEUP},    0x20)

// vim: set ts=4 sw=4 et:
