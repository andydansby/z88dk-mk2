        INCLUDE "graphics/grafix.inc"

        XLIB    w_plotpixel

        LIB     l_cmp
        LIB     w_pixeladdress

        XREF    COORDS

;
;       $Id: w_plotpixl.asm,v 1.1 2008/07/17 15:39:56 stefano Exp $
;

; ******************************************************************
;
; Plot pixel at (x,y) coordinate.
;
; Wide resolution (WORD based parameters) version by Stefano Bodrato
;
; Design & programming by Gunther Strube, Copyright (C) InterLogic 1995
;
; The (0,0) origin is placed at the top left corner.
;
; in:  hl,de    = (x,y) coordinate of pixel
;
; registers changed after return:
;  ......../ixiy same
;  afbcdehl/.... different
;
.w_plotpixel
                        push    hl
                        ld      hl,maxy
                        call    l_cmp
                        pop     hl
                        ret     nc               ; Return if Y overflows

                        push    de
                        ld      de,maxx
                        call    l_cmp
                        pop     de
                        ret     c               ; Return if X overflows
                        
                        ld      (COORDS),hl     ; store X
                        ld      (COORDS+2),de   ; store Y: COORDS must be 2 bytes wider
                        
                        call    w_pixeladdress
                        ld      b,a
                        ld      a,1
                        jr      z, or_pixel     ; pixel is at bit 0...
.plot_position          rlca
                        djnz    plot_position
.or_pixel               ex      de,hl
                        or      (hl)
                        ld      (hl),a
                        ret

