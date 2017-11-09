;
;       z88dk RS232 Function
;
;       Amstrad CPC (CPC Booster+) version
;
;       unsigned char rs232_get(char *)
;
;       $Id: rs232_get.asm,v 1.1 2008/07/18 07:51:13 stefano Exp $

;       fastcall so implicit push


                XLIB   rs232_get
                
rs232_get:      ld bc, $FF1C
nowort:			in a, (c)
				or a
				jr z, nowort
				
				;read data word
				inc c				;&FF1D
				in a, (c)
				ld (hl), a			;put data into the pointer supplied
				
				ld hl, 0            ; RS_ERR_OK
				ret

