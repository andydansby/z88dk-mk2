;
; 	Graphics for the TI82
;	By Stefano Bodrato - Dec. 2000
;
;	CLOSEGFX - wait for keypress
;
;
;	$Id: closegfx.asm,v 1.3 2002/04/17 21:30:25 dom Exp $
;

	XLIB    closegfx

.closegfx

IF FORti82
; This is called before scrolling: we wait for any keypress
.kloop
	;halt	; Power saving (?? maybe. It worked on ti86)
	ld	hl,$8004
	bit	2,(hl)
	jr	z,kloop
ENDIF

IF FORti83
.kloop
	call	$4CFE
	and	a
	jr	z,kloop
ENDIF

	ret
	