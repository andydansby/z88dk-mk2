;
;       Z88dk Generic Floating Point Math Library
;
;	TOS >= FA
;
;       $Id: dleq.asm,v 1.1 2008/07/27 21:44:57 aralbrec Exp $:

		XLIB	dleq

		LIB	dcompar
		LIB	f_yes
		LIB	f_no

.dleq	call dcompar
	jp	z,f_yes
	jp	p,f_yes
	jp	f_no

