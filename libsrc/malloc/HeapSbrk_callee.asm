; void __CALLEE__ HeapSbrk_callee(void *heap, void *addr, unsigned int size)
; 12.2006 aralbrec

XLIB HeapSbrk_callee
XDEF ASMDISP_HEAPSBRK_CALLEE

LIB HeapFree_callee
XREF ASMDISP_HEAPFREE_CALLEE

.HeapSbrk_callee

   pop af
   pop bc
   pop hl
   pop de
   push af

.asmentry

; Add a block of memory to the specified heap.  The
; block must be at least 4 bytes in size.  Adding a
; block that overlaps with one already in the heap
; will wreck the heap.
;
; enter : de = heap pointer
;         hl = address of available block
;         bc = size of block in bytes >= 4
; exit  : block not added if too small
; uses  : af, bc, de, hl

.MAHeapSbrk

   ld a,b
   or a
   jr nz, sizeok
   ld a,c
   sub 4
   ret c
   
.sizeok

   dec bc
   dec bc
   ld (hl),c
   inc hl
   ld (hl),b
   inc hl
   jp HeapFree_callee + ASMDISP_HEAPFREE_CALLEE

DEFC ASMDISP_HEAPSBRK_CALLEE = asmentry - HeapSbrk_callee
