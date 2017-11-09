;       Small C+ Z88 Support Library
;
;	Decrement long on hl
;	Kept little endian
;
;       djm 26/2/2000

XLIB    l_long_dec

.l_long_dec

   ld a,$ff
   
   dec (hl)
   cp (hl)
   ret nz
   
   inc hl
   dec (hl)
   cp (hl)
   ret nz

   inc hl
   dec (hl)
   cp (hl)
   ret nz
   
   inc hl
   dec (hl)
   ret
