;
;	ZX Spectrum specific routines
;	by Stefano Bodrato, MAR 2010
;
;	int ula_plus_mode();
;
;	The result is:
;	- 0 (false) ULAPlus not installed / emulated
;	- 1 ULAPlus 64 colour mode is available
;
;	$Id: ula_plus_mode.asm,v 1.1 2010/04/02 09:05:06 stefano Exp $
;

	XLIB	ula_plus_mode

ula_plus_mode:
	; Enter in 64 colour mode
	ld	bc,$bf3b
	ld	a,64	; select mode group (01xxxxxx)
	out	(c),a

	ld	b,$ff	
	ld	a,1		; palette mode
	out	(c),a

	in	a,(c)	; see if ULAPlus got palette mode
	dec	a
	
	ld	hl,0
	ret	nz

	inc	hl
	ret
