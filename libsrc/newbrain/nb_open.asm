;
; Grundy Newbrain Specific libraries
;
; Stefano Bodrato - 19/05/2007
;
;
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
; int nb_open( int mode, int stream, int device, int port, char *paramstr );
;
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;
;
; $Id: nb_open.asm,v 1.1 2007/06/03 15:13:06 stefano Exp $
;


	XLIB nb_open
	
	LIB ZCALL

.nb_open
	ld	ix,2
	add	ix,sp

	ld	a,(ix+8)	; mode
	ld	(openmode),a
		
	ld	l,(ix+0)	; parameter string
	ld	h,(ix+1)

	;parameter string length count
	ld	bc,0
	push	hl
.strct
	ld	a,(hl)
	and	a
	jr	z,strcount
	inc	hl
	inc	bc
	jr	strct
.strcount
	pop	hl

	ld	e,(ix+6)	; stream
	ld	a,(ix+4)	; device
	ld	d,(ix+2)	; port

	call	ZCALL
.openmode
	defb	$0	; zopenin = $32; zopenout = $33;

	
	ld	hl,0
	jp	nc,noerror
	ld	l,a	; return error code
.noerror
	ret
