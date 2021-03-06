;
;	MSX specific routines
;	by Stefano Bodrato, 12/12/2007
;
;	void msx_screen(int mode);
;
;	Change the MSX screen mode; mode in HL (FASTCALL)
;
;	$Id: msx_screen.asm,v 1.5 2009/06/22 21:44:17 dom Exp $
;

	XLIB	msx_screen
	LIB	msxbios
	LIB	msxextrom
	
        INCLUDE "msxbios.def"

msx_screen:
	ld	a,(0FAF8h)	; use EXBRSA to check if running on MSX1
	and	a
	ld	a,l		; screen mode (FASTCALL parameter passing mode)
	jr	z,screen_msx1	; yes
	ld	ix,01B5h	; CHGMDP: change screen mode and initialize palette
	jp	msxextrom
;
screen_msx1:
	ld	ix,CHGMOD
	jp	msxbios
