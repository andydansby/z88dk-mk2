/*
 *	z88dk RS232 Function
 *
 *	z88 version
 *
 *	unsigned char rs232_put(char)
 *
 *	Returns RS_ERROR_OVERFLOW on error (and sets carry)
 */


#include <rs232.h>


u8_t rs232_put(i8_t char)
{	/* Fastcall so implicit push */
#asm
	INCLUDE	"#serintfc.def"
	ld	a,l	;get byte
	ld	l,si_pbt
	ld	bc,0	;timeout
	call_oz(os_si)
	ld	hl,RS_ERR_OK
	pop	bc	;remove implicit push
	ret	nc
	ld	hl,RS_ERR_OVERFLOW
#endasm
}


