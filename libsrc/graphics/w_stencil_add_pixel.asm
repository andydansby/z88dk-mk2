;
;       Z88 Graphics Functions - Small C+ stubs
;
;       Written around the Interlogic Standard Library
;
;	Compute the line coordinates and put into a vector
;	Basic concept by Rafael de Oliveira Jannone (calculate_side)
;
;	Internal function to update the area object's vectors
;
;       Stefano Bodrato - 13/3/2009
;
;
;	$Id: w_stencil_add_pixel.asm,v 1.1 2010/12/24 11:59:35 stefano Exp $
;

; registers changed after return:
;  ..bc..../ixiy same
;  af..dehl/.... different


	INCLUDE	"graphics/grafix.inc"

                XLIB    stencil_add_pixel
                XDEF	stencil_ptr
                XREF	COORDS
                
                LIB		l_cmp

.stencil_ptr	defw	0


.stencil_add_pixel
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

		push hl			; X
		ld	hl,(stencil_ptr) ; right side vector
		add	hl,de
		add	hl,de		; Y coordinate
		ld	e,(hl)
		inc hl
		ld	d,(hl)
		dec hl
		ex	(sp),hl		; X <-> ptr to stencil
		call	l_cmp	; X > original X ?  [carry set if DE < HL]
		ex	de,hl
		pop hl			; ptr to stencil
		jr	c,noplot
		ld	(hl),e		; yes, update vector
		inc	hl
		ld	(hl),d
		dec hl
.noplot
		push de			; X
		ld	de,maxy*2
		add	hl,de		; move to the right side vector
		;ld	de,(COORDS)
		;push de
		ld	e,(hl)
		inc hl
		ld	d,(hl)
		dec hl
		ex	(sp),hl		; X <-> ptr to stencil
		call	l_cmp	; X < original X ?   [carry set if DE < HL]
		ex	de,hl
		pop hl			; ptr to stencil
		ret nc
		ld	(hl),e		; yes, update vector
		inc	hl
		ld	(hl),d
		ret
