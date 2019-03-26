changequote({, })
dnl include(foreach.m4)
dnl foreach(x, (item_1, item_2, ..., item_n), stmt)
dnl   parenthesized list, simple version
divert({-1})
define({foreach}, {pushdef({$1})_foreach($@)popdef({$1})})
define({_arg1}, {$1})
define({_foreach}, {ifelse({$2}, {()}, {},
  {define({$1}, _arg1$2)$3{}$0({$1}, (shift$2), {$3})})})
divert{}dnl

dnl include(quote.m4)
dnl quote(args) - convert args to single-quoted string
define({quote}, {ifelse({$#}, {0}, {}, {{$*}})})

dnl define functions around normal instructions

dnl local identifiers
define({LOC}, {ifdef({_FUNCTION_}, {{L_}}{_FUNCTION_}{{_}}){$1}})

dnl function definition (with nesting and local identifiers!)
define({FUNCTION}, {pushdef({_FUNCTION_}, ifdef({_FUNCTION_}, _FUNCTION_{_})$1) .thumb_func
	.global _FUNCTION_
	.type _FUNCTION_, %function
_FUNCTION_:})
define({ENDFUNC}, {    .size _FUNCTION_, .-_FUNCTION_
popdef({_FUNCTION_})})

define({MAX}, {pushdef({_minmaxarg},ifelse($#,1,$1,{$0(shift($@))}))ifelse(eval(_minmaxarg<$1),0,_minmaxarg,$1)popdef({_minmaxarg})})
define({MIN}, {pushdef({_minmaxarg},ifelse($#,1,$1,{$0(shift($@))}))ifelse(eval(_minmaxarg>$1),0,_minmaxarg,$1)popdef({_minmaxarg})})
dnl define({MSB8},{ifelse(eval($1 >= 128),1,7,eval($1 >= 64),1,6,eval($1 >= 32),1,5,eval($1 >= 16),1,4,eval($1 >= 8),1,3,eval($1 >= 4),1,2,eval($1 >= 2),1,1,eval($1 >= 1),1,0,-1)})
dnl define({LO8}, {(($1) & 0xff)})
dnl define({HI8}, {((($1) >> 8) & 0xff)})

define({_BV}, {ifelse({$#}, 1, eval(1 << ($1)), {eval((1 << ($1)) + $0(shift($@)))})})

dnl '0x'-prefixed 8-digit hex outputting unsigned eval
define({heval}, {0x{}eval((256+(($1) >> 24)) & 0xff, 16, 2){}eval(($1) & 0xffffff, 16, 6)})

dnl LOG2, for 'friendly' input only
define({LOG2}, {ifelse(eval($1),1,0,{eval(1+$0(eval(($1)>>1)))})})

dnl defmask(YADDA, 5, 3) -> define({YADDA_Shift}, 5) define({YADDA_Bits}, 3)
define({defmask}, {define({$1}_Shift, {$2})define({$1}_Bits, {$3})})
dnl MASK(YADDA)
define({MASK}, {heval(((1 << $1{}_Bits) - 1) << $1{}_Shift)})

// --------------------------------------------------------------------------

dnl vim: set sw=4 ts=4 ft=asm noet:
