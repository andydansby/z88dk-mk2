; stdio_error_einval_zc
; 06.2008 aralbrec

XLIB stdio_error_einval_zc
LIB stdio_errno_zc

INCLUDE "../stdio.def"

   pop hl

.stdio_error_einval_zc

   ld hl,EINVAL
   jp stdio_errno_zc
