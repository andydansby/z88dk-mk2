;
;	This file is automatically generated
;
;	Do not edit!!!
;
;	djm 12/2/2000
;
;	ZSock Lib function: tcp_regcatchall


	XLIB	tcp_regcatchall

	LIB	no_zsock

	INCLUDE	"packages.def"
	INCLUDE	"zsock.def"

.tcp_regcatchall
	ld	a,r_tcp_regcatchall
	call_pkg(tcp_all)
	ret	nc
; We failed..are we installed?
	cp	rc_pnf
	scf		;signal error
	ret	nz	;Internal error
	call_pkg(tcp_ayt)
	jr	nc,tcp_regcatchall
	jp	no_zsock
