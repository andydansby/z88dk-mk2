;
;	Enterprise 64/128 specific routines
;	by Stefano Bodrato, 2011
;
;	exos_redirect_channel(unsigned char main_channel, unsigned char secondary_channel);
;
;
;	$Id: exos_redirect_channel_callee.asm,v 1.1 2011/03/15 14:34:08 stefano Exp $
;


XLIB	exos_capture_channel_callee
XDEF 	ASMDISP_EXOS_REDIRECT_CHANNEL_CALLEE

exos_redirect_channel_callee:

	pop hl
	pop de
	ex (sp),hl

; enter : l = main channel number
;         e = secondary channel number

.asmentry

	ld	a,l		; main channel
	ld	c,e		; sec. ch
	rst   30h
	defb  18
	ld	h,0
	ld	l,a
	ret


DEFC ASMDISP_EXOS_REDIRECT_CHANNEL_CALLEE = asmentry - exos_redirect_channel_callee
