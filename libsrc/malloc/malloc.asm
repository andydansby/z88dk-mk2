; void __FASTCALL__ *malloc(unsigned int size)
; 12.2006 aralbrec

XLIB malloc

LIB HeapAlloc_callee
XREF _heap, ASMDISP_HEAPALLOC_CALLEE

.malloc

   ld c,l
   ld b,h
   ld hl,_heap

   jp HeapAlloc_callee + ASMDISP_HEAPALLOC_CALLEE
