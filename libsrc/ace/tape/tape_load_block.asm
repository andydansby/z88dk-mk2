; int tape_load_block(void *addr, size_t len, unsigned char type)
; CALLER linkage for function pointers

XLIB tape_load_block

LIB tape_load_block_callee
XREF ASMDISP_TAPE_LOAD_BLOCK_CALLEE

.tape_load_block

   pop ix
   pop bc
   pop de
   pop hl
   push hl
   push de
   push bc
   push ix
   
   jp tape_load_block_callee + ASMDISP_TAPE_LOAD_BLOCK_CALLEE
