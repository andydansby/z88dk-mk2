;
;	Old School Computer Architecture - SD Card driver
;	Taken from the OSCA Bootcode by Phil Ruston 2011
;
;	Ported by Stefano Bodrato, 2012
;
;	Deselect the sdcard
;	AF holds the result code of the previous operations and must be preserved.
;
;	$Id: sd_deselect_card.asm,v 1.1 2012/07/10 05:55:38 stefano Exp $
;


	XLIB	sd_deselect_card
	
	LIB		sd_send_eight_clocks
	
    INCLUDE "osca.def"


sd_deselect_card:

	push af
	in a,(sys_sdcard_ctrl2)
	set sd_cs,a
	
	out (sys_sdcard_ctrl2),a
	call sd_send_eight_clocks		; send 8 clocks to make card de-assert its Dout line
	pop af
	ret
