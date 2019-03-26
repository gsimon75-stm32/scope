set $USB_BASE=0x40005c00
set $USB_PMA_BASE=0x40006000

define dump_USB_CNTR
  #dont-repeat
  set $v = *(unsigned int*)($USB_BASE + 0x40)
  printf "USB_CNTR = 0x%04x = ", $v
  print_bit $v 15 CTRM
  print_bit $v 14 PMAOVRM
  print_bit $v 13 ERRM
  print_bit $v 12 WKUPM
  print_bit $v 11 SUSPM
  print_bit $v 10 RESETM
  print_bit $v  9 SOFM
  print_bit $v  8 ESOFM
  print_bit $v  4 RESUME
  print_bit $v  3 FSUSP
  print_bit $v  2 LP_MODE
  print_bit $v  1 PDWN
  print_bit $v  0 FRES
  echo \n
end

define dump_USB_ISTR
  #dont-repeat
  set $v = *(unsigned int*)($USB_BASE + 0x44)
  printf "USB_ISTR = 0x%04x = ", $v
  print_bit $v 15 CTR
  print_bit $v 14 PMAOVR
  print_bit $v 13 ERR
  print_bit $v 12 WKUP
  print_bit $v 11 SUSP
  print_bit $v 10 RESET
  print_bit $v  9 SOF
  print_bit $v  8 ESOF
  print_bit $v  4 DIR
  printf " EP_ID=0x%02x", $v & 0x0f
  echo \n
end

define dump_USB_FNR
  #dont-repeat
  set $v = *(unsigned int*)($USB_BASE + 0x48)
  printf "USB_FNR=0x%04x\n", $v
end

define dump_USB_DADDR
  #dont-repeat
  set $v = *(unsigned int*)($USB_BASE + 0x4c)
  printf "USB_DADDR=0x%04x\n", $v
end

define dump_USB_EPR
  # arg0 = n
  set $v = *(unsigned int*)($USB_BASE + $arg0)
  printf "USB_EP%dR = 0x%04x = ", $arg0, $v
  print_bit $v 15 CTR_RX
  print_bit $v 14 DTOG_RX
  echo \ STAT_RX=
  print_field $v>>12 2 DISABLED STALL NAK VALID
  print_bit $v 11 SETUP
  echo \ EP_TYPE=
  print_field $v>>9 2 BULK CONTROL ISO INTERRUPT
  print_bit $v  8 EP_KIND
  print_bit $v  7 CTR_TX
  print_bit $v  6 DTOG_TX
  echo \ STAT_TX=
  print_field $v>>4 2 DISABLED STALL NAK VALID
  printf " EA=0x%02x", $v & 0x0f
  echo \n
end

define dump_USB_EP
  # arg0 = n
  set $btable = *(unsigned int*)($USB_BASE + 0x50)
  set $addr = $USB_PMA_BASE + $btable + (0x20 * $arg0)

  set $rxbuf = *(unsigned int*)($addr + 0x08)
  #printf "USB_ADDR%d_RX = 0x%04x\n", $arg0, $rxbuf
  printf "USB_RXBUF%d =\n", $arg0
  x/8wx $USB_PMA_BASE + (2*$rxbuf)
  set $v = *(unsigned int*)($addr + 0x0c)
  printf "USB_COUNT%d_RX = 0x%04x, NUM_BLOCK=0x%02x,", $arg0, ($v & 0x3ff), ($v >> 10) & 0x1f
  print_bit $v 15 BLSIZE
  echo \n

  set $txbuf = *(unsigned int*)($addr + 0x00)
  #printf "USB_ADDR%d_TX = 0x%04x\n", $arg0, $txbuf
  printf "USB_TXBUF%d =\n", $arg0
  x/8wx $USB_PMA_BASE + (2*$txbuf)
  printf "USB_COUNT%d_TX = 0x%04x\n", $arg0, *(unsigned int*)($addr + 0x04)
  echo \n
end

define dump_USB_All
  dump_USB_CNTR
  dump_USB_ISTR
  dump_USB_FNR
  dump_USB_DADDR
  dump_USB_EPR 0
  dump_USB_EP 0
end
