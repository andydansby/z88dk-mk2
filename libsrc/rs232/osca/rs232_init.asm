;
;       z88dk RS232 Function
;
;       OSCA version
;
;       unsigned char rs232_init()
;
;       $Id: rs232_init.asm,v 1.1 2012/06/26 06:11:23 stefano Exp $

		XLIB   rs232_init
                
		INCLUDE "osca.def"

rs232_init:

	xor a
	out (sys_timer),a			; timer to overflow every 0.004 secconds

	in a,(sys_serial_port)		; clear serial buffer flag by reading port

	ld  hl,0        ;RS_ERR_OK;
	ret
