;
;
;       ZX Maths Routines
;
;       23/05/06 - Stefano Bodrato
;
;       $Id: f_yesno.asm,v 1.2 2009/06/22 21:44:17 dom Exp $
;


; Support for boolean - save some byte

IF FORzx
		INCLUDE  "zxfp.def"
ELSE
		INCLUDE  "81fp.def"
ENDIF

        XLIB    f_yesno


.f_yesno
	call	ZXFP_FP_TO_BC

IF FORzx
        ld	h,b
        ld	l,c
ELSE
        ld	h,c
        ld	l,b
ENDIF

        xor	a
        or	l
        ret	z       ;sets nc

        scf
	ret
