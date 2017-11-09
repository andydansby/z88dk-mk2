;
;	Fast background save
;
;	ZX Spectrum version (speeded up with a row table)
;
;	$Id: bksave.asm,v 1.2 2002/03/11 17:11:34 stefano Exp $
;


	XLIB    bksave
	LIB	zx_rowtab


.actrow  defw 0
.actcol  defw 0


.bksave

        ld      hl,2   
        add     hl,sp
        ld      e,(hl)
        inc     hl
        ld      d,(hl)  ;sprite address
	push	de
	pop	ix

        inc     hl
        ld      e,(hl)  
 	inc	hl
        inc     hl
        ld      d,(hl)	; x and y coords

	ld	(ix+2),d
	ld	(ix+3),e

	ld	a,d
	ld	d,0
	
	ld	hl,zx_rowtab
	add	hl,de
	add	hl,de
	ld	(actrow),hl	; save row table position
	
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,e
	
	ld	e,a
	srl	e
	srl	e
	srl	e
	
	ld	(actcol),de
	add	hl,de
	
	ld	a,(ix+0)
	ld	b,(ix+1)

	dec	a
	srl	a
	srl	a
	srl	a
	inc	a
	inc	a		; INT ((Xsize-1)/8+2)
	ld	(rbytes+1),a

.bksaves
	push	bc
	
.rbytes
	ld	b,0
.rloop
	ld	a,(hl)
	ld	(ix+4),a
	inc	hl
	inc	ix
	djnz	rloop

	; ---------
	ld	hl,(actrow)
	inc	hl
	inc	hl
	ld	(actrow),hl
	
	ld	b,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,b
	
	ld	bc,(actcol)
	add	hl,bc
	; ---------

	pop	bc
	
	djnz	bksaves
	ret
