	XLIB	add_pause_int
	
	XREF	pause_procs

;==============================================================
; add_pause_int(void *ptr)	
;==============================================================
; Adds a pause interrupt handler
;==============================================================
.add_pause_int
	ld	hl, 2
	add	hl, sp
	ld	c, (hl)		; Proc address
	inc	hl
	ld	b, (hl)
	
	ld	hl, pause_procs

.loop
	ld	a,(hl)
	inc	hl
	or	(hl)
	jr	z, found
	inc	hl
	jr	loop
	
.found
	ld	(hl), b
	dec	hl
	ld	(hl), c
	ret
	