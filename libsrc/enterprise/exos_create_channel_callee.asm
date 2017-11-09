;
;	Enterprise 64/128 specific routines
;	by Stefano Bodrato, 2011
;
;	exos_create_channel(unsigned char ch_number, char *device);
;
;
;	$Id: exos_create_channel_callee.asm,v 1.2 2011/03/15 14:34:08 stefano Exp $
;


XLIB	exos_create_channel_callee
XDEF 	ASMDISP_EXOS_CREATE_CHANNEL_CALLEE

exos_create_channel_callee:

	pop hl
	pop de
	ex (sp),hl

; enter : de = char *device
;         l = channel number

.asmentry

	ld	a,l		; channel
	rst   30h
	defb  2
	ld	h,0
	ld	l,a
	ret


DEFC ASMDISP_EXOS_CREATE_CHANNEL_CALLEE = asmentry - exos_create_channel_callee
 
