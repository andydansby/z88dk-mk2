; uint __FASTCALL__ zx_saddr2py(void *pixeladdr)
; aralbrec 06.2007

XLIB zx_saddr2py

.zx_saddr2py

   ld a,l
   rra
   rra
   and $38
   ld l,a
   
   ld a,h
   rla
   rla
   rla
   and $c0
   or l
   ld l,a
   
   ld a,h
   and $07
   or l
   ld l,a
   
   ld h,0
   ret
