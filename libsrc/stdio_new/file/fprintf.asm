; int fprintf(FILE *stream, const char *fmt, ...)
; 05.2008 aralbrec

XLIB fprintf

LIB vfprintf_callee, stdio_varg, stdio_nextarg
XREF ASMDISP_VFPRINTF_CALLEE

.fprintf

   call stdio_varg
   ld ixl,e
   ld ixh,d                    ; ix = FILE *
   
   call stdio_nextarg          ; de = char *fmt
   
   ld c,l
   ld b,h                      ; bc = top of parameter list

   jp vfprintf_callee + ASMDISP_VFPRINTF_CALLEE
