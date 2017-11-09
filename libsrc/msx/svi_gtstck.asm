;
;	Spectravideo SVI specific routines
;	by Stefano Bodrato
;	MSX emulation layer
;
;	GTSTCK
;
;
;	$Id: svi_gtstck.asm,v 1.3 2009/05/27 10:41:08 stefano Exp $
;

	XLIB	GTSTCK
	
	LIB	svi_slstick
	LIB	msxbios



GTSTCK:
	dec	a
	jp	m,getkeys

	call	svi_slstick
stick0:
	ld	hl,$3253	; Joystick table
stick1:	and	$0f
	ld	e,a
	ld	d,0
	add	hl,de
	ld	a,(hl)
	ret

getkeys:
	ld	a,1
	ld	($fa19),a ;REPCNT
	
	ld	ix,$3dca	; CHSNS
	call	msxbios
	ret	z		; exit if no key in buffer

	ld	ix,$403d	; CHGET
	call	msxbios
	
	sub	27

	ld	b,a
	xor	a
	scf
.bitr	rra
	djnz	bitr
	rra
	rra
	rra
	rra
		
.no_nothing
	ld	l,a
	ld	h,0
	ret
