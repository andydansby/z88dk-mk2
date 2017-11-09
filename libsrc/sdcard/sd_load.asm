; 
;	SD Card driver
;	by Stefano Bodrato, 2012
;	portions of the code are by Alessandro Poppi and Phil Ruston
;
;	int sd_load(slot, struct SD_INFO sd_descriptor)
;		result: 0-OK, 
;
;	$Id: sd_load.asm,v 1.7 2012/09/26 14:15:25 stefano Exp $ 
;
;-----------------------------------------------------------------------------------------
; Init SD interface. look for card, etc..
;-----------------------------------------------------------------------------------------
;

	XLIB	sd_load
	LIB		sd_initialize
	LIB		sd_get_cid_csd

	XREF	card_select
	XREF	sd_card_info

    INCLUDE "sdcard.def"


sd_load:

	pop	bc
	pop	hl		; ptr to SD_INFO struct
	pop	de		; slot number
	push de
	push hl
	push bc
	
	ld	a,e

;slot;		// 0 or 1
	ld	(hl),a			; Current slot number (human readable)
	inc	hl

	push hl
	ld	l,a
	call sd_initialize
	pop hl
	ret nz

; retrieve other values which might be set by the initialization routines
; and load them in the SD_INFO structure
; card hw port for current slot (or similar hw specific)
	ld	a,(card_select)
	ld	(hl),a
	inc	hl
    
	ld	a,(sd_card_info)
	ld	(hl),a
	inc	hl

	call sd_check

	ld	h,0
	ld	l,a

	ret

	
	
	
;-------------------------------------------------------------------------------------------
; Load CID and CSD into sd structure
;
; Returns A = 0 if OK
;-------------------------------------------------------------------------------------------
;

sd_check:
	push hl
	ld	a,CMD10		;	SD_READ_CID
	call sd_get_cid_csd		; try to read the MMC CID INFO --> (HL)
	pop hl
	ret nz

	ld	de,16
	add	hl,de
	ld	a,CMD9		;	SD_READ_CSD
	jp sd_get_cid_csd		; load also CSD info and return
