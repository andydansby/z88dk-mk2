;
;	written by Waleed Hasan
;
;	$Id: DsDisplayCircle.asm,v 1.2 2003/03/13 15:02:07 dom Exp $
;

	XLIB	DsDisplayCircle
	LIB	set4pix
	LIB	setpixsave


.DsDisplayCircle
	pop	bc		;ret addr
	pop	hl		;r
	ld	d,l		; b=r
	pop	hl		;yc
	ld	e,l		; e=yc
	pop	hl		;xc
	push	bc
	push	bc
	push	bc
	push	bc


	ld	b,l
	ld	c,e

; ASM Circle draw
; ASM - entry point
; i/p : B=xc, C=yc, D=r, H=0
; uses	: AF,BC,HL,DE
.circle
				; x=0;	h=0 alrady!
	ld	l,d		; y=r;
	srl	d		; a=r>>1
.loop
	push	de

	call	set4pix

	ld	a,b
	add	a,l
	ld	d,a
	ld	a,c
	add	a,h
	ld	e,a
	call	setpixsave		;PIX(xc+y,yc+x)

	ld	a,b
	sub	l
	ld	d,a
	call	setpixsave		;PIX(xc-y,yc+x)

	ld	a,c
	sub	h
	ld	e,a
	call	setpixsave		;PIX(xc-y,yc-x)

	ld	a,b
	add	a,l
	ld	d,a
	call	setpixsave		;PIX(xc+y,yc-x)

	inc	h		;x++;

	pop	de
	ld	a,d
	sub	h
	ld	d,a		;a-=x;

	bit	7,d
	jr	z, NextLoop	;if(a>=0)
				;{
	add	a,l
	ld	d,a		;a+=y
	dec	l		;y--;
				;}
.NextLoop			;this test should go up!
        ld      a,h		;for(;x<=y;)
        sub     l
	jr	c,loop
	jr	z,loop

	ret
