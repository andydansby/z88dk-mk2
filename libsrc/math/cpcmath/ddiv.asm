;
;	CPC Maths Routines
;
;	August 2003 **_|warp6|_** <kbaccam /at/ free.fr>
;
;	$Id: ddiv.asm,v 1.2 2009/06/22 21:44:17 dom Exp $
;

		INCLUDE		"cpcfirm.def"
		INCLUDE		"cpcfp.def"

		XLIB		ddiv
		XDEF		ddivc

		LIB		fsetup
		LIB		stkequ
		XREF		fa

.ddiv						; (fa+1)=(fa+1)*(sp+3)
		call	fsetup
        call    firmware
.ddivc	defw	CPCFP_FLO_DIV		; (hl)=(hl)/(de)
		jp      stkequ


