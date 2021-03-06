; 
; 
;	ZX Spectrum ZXMMC specific routines 
;	code by Alessandro Poppi
;	ported to z88dk by Stefano Bodrato - Mar 2010
;
;	$Id: mmc_read_block.asm,v 1.1 2010/03/12 15:21:14 stefano Exp $ 
;
; Read a 512 byte data block from the MMC card
; extern int __LIB__ mmc_read_block(struct MMC mmc_descriptor, long card_address, unsigned char *address);
;
;-----------------------------------------------------------------------------------------
; READ A SINGLE BLOCK OF DATA subroutine
;
; This routine only works for blocksize = 512 (two INIR sequence).
;
; HL, DE= MSB, LSB of 32bit address in MMC memory
; then, HL = ram buffer address
;
; RETURN code in HL:
; 0 = OK
; 1 = read_block command error
; 2 = no wait_data token from MMC
;
; DESTROYS AF, HL
;-----------------------------------------------------------------------------------------

	XLIB   mmc_read_block
	
	LIB    mmc_send_command
	LIB    mmc_waitdata_token
	LIB    clock32
	LIB    cs_high

	XREF   card_select

	INCLUDE "zxmmc.def"


mmc_read_block:

	ld	ix,0
	add	ix,sp
	
	ld	l,(ix+8)
	ld	h,(ix+9)	; MMC struct
	ld	a,(hl)
	inc	hl			; ptr to MMC mask to be used to select port
	ld	a,(hl)
	ld	(card_select), a
	
	ld	l,(ix+2)
	ld	h,(ix+3)	; RAM ptr
	push hl
	ld	e,(ix+4)	; LSB
	ld	d,(ix+5)	; .
	ld	l,(ix+6)	; .
	ld	h,(ix+7)	; MSB

        ld a,MMC_READ_SINGLE_BLOCK      ; Command code for block read
        call mmc_send_command
        and a
		jr	z,noerror
        ld	l,a
		ld	h,0
noerror:
        call mmc_waitdata_token
        cp $FE
        jr z,read_mmc_block             ; OK
		pop hl
        ld hl,2                          ; no data token from MMC
        ret

read_mmc_block:
        pop hl                          ; HL = INIR write pointer

        ld bc,SPI_PORT                  ; B = 0 = 256 bytes for the first INIR; C = I/O port

        inir
        nop
        inir

        nop
        nop

        in a,(SPI_PORT)                 ; CRC
        nop
        nop
        in a,(SPI_PORT)                 ; CRC

        call cs_high                    ; set cs high
        call clock32                    ; 32 more clock cycles

        ld	hl,0
        ret
