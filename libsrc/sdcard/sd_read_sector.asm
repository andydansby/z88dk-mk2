;
;	Old School Computer Architecture - SD Card driver
;	Taken from the OSCA Bootcode by Phil Ruston 2011
;	Port by Stefano Bodrato, 2012
;
;	int sd_read_sector(struct SD_INFO descriptor, long sector, unsigned char *address);
;
;	sd_card_info and card_select must be accessible, 
;	a good place to put them is in the vars declared in the CRT0 stub
;
;	on exit: 0 if all OK or error code
;
;	$Id: sd_read_sector.asm,v 1.5 2012/09/20 21:13:16 stefano Exp $
;

	XLIB	sd_read_sector

	LIB		sd_read_sector_callee
	XREF	ASMDISP_SD_READ_SECTOR_CALLEE

sd_read_sector:
	pop af	; ret addr
	pop hl	; dst addr
	exx
	pop hl	; sector pos lsb
	pop de	; sector pos msb
	pop ix	; SD_INFO struct
	
	push af
	
	jp sd_read_sector_callee + ASMDISP_SD_READ_SECTOR_CALLEE

