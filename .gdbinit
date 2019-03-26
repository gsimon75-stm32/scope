set pagination off
target remote localhost:3333
mon halt

define hook-stop
  dump_USB_CNTR
  dump_USB_ISTR
  dump_USB_FNR
  dump_USB_DADDR
  dump_USB_EPR 1
  dump_USB_EP 1
  info reg
  disas /r $r15,+32
end

define hook-quit
  mon resume
end

define reset
  mon reset halt
  c
end

define reload
  mon reset halt
  load test.elf
  symbol-file test.elf
  echo ==============================================================================\n
end


define print_bit
# arg0 = word value
# arg2 = bit number
# arg2 = text to write
  if $arg0 & (1 << $arg1)
    echo \ \033[32m$arg2\033[0m
  else
    echo \ \033[31;4m$arg2\033[0m
  end
end

define print_field
# Use like 'print_field whatever>>4 2 A B C D ...'
# arg0 = word value
# arg1 = bitnum
# arg2 .. = enum values to print
  set $idx = $arg0 & ((1 << $arg1) - 1)
  if $idx == 0
    echo $arg2
  end
  if $idx == 1
    echo $arg3
  end
  if $idx == 2
    echo $arg4
  end
  if $idx == 3
    echo $arg5
  end
  if $idx == 4
    echo $arg6
  end
  if $idx == 5
    echo $arg7
  end
  if $idx == 6
    echo $arg8
  end
  if $idx == 7
    echo $arg9
  end
end

source usb.gdb
