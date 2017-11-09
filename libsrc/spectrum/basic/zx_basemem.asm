;
;	ZX Spectrum specific routines
;	by Stefano Bodrato, 21/09/2006
;
;	int zx_basemem;
;
;	This function returns the base memory size in kbytes
;
;	$Id: zx_basemem.asm,v 1.1 2008/06/29 08:25:46 aralbrec Exp $
;

	XLIB	zx_basemem
	
zx_basemem:
	ld	a,(23733)
	srl	a
	inc	a
	srl	a
	sub	16	; subtract the ROM size
	ld	l,a
	ld	h,0
	ret
