	INCLUDE	"graphics/grafix.inc"

	XLIB	plotpixel

	LIB pixeladdress
	XREF	COORDS
	XREF	pix_return

;
;	$Id: plotpixl.asm,v 1.4 2009/05/21 06:58:11 stefano Exp $
;

; ******************************************************************
;
; Plot pixel at (x,y) coordinate.
;
; Design & programming by Gunther Strube, Copyright (C) InterLogic 1995
;
; The (0,0) origin is placed at the top left corner.
;
; in:  hl = (x,y) coordinate of pixel (h,l)
;
; registers changed after return:
;  ..bc..../ixiy same
;  af..dehl/.... different
;
.plotpixel
			IF maxx <> 256
				ld	a,h
				cp	maxx
				ret	nc
			ENDIF

				ld	a,l
				cp	maxy
				ret	nc			; y0	out of range
				
				ld	(COORDS),hl

				push	bc
				call	pixeladdress
				ld	b,a
				ld	a,1
				jr	z, or_pixel		; pixel is at bit 0...
.plot_position			rlca
				djnz	plot_position
.or_pixel			;ex	de,hl
				or	(hl)
				jp	pix_return
