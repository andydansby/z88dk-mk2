;
;	ZX Spectrum specific routines
;	by Stefano Bodrato, 14/09/2006
;
;	int zx_plus3fdc();
;
;	The result is:
;	- 1 (true) if a +3 floppy controller is found
;	- 0 (false) otherwise
;
;	$Id: zx_plus3fdc.asm,v 1.1 2008/06/29 08:25:47 aralbrec Exp $
;

	XLIB	zx_plus3fdc
	
zx_plus3fdc:
	ld	hl,0
	ld	de,65535
loop:
	ld	bc,$2ffd
	in	a,(c)
	cp	255
	ret	z
	cp	56
	ret	z
	cp	0
	ret	z
	dec	de
	ld	a,d
	or	e
	jr	nz,loop
	
	inc	hl
	ret
