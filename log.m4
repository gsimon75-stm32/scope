define({_LOG_STR_COUNTER}, 0)
define({_log_string}, {
    adr r12, LOG_STR_{}_LOG_STR_COUNTER
    bl _log_str
    b LOG_SKIP_{}_LOG_STR_COUNTER
  LOG_STR_{}_LOG_STR_COUNTER: .string $1
  LOG_SKIP_{}_LOG_STR_COUNTER:
    .align(2)
  define({_LOG_STR_COUNTER}, eval(1+_LOG_STR_COUNTER))
})
dnl _log_string("hwsetup\n")

dnl vim: set sw=4 ts=4 ft=asm noet:
