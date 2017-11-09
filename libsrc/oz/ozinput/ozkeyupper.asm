;
;	Sharp OZ family functions
;
;	ported from the OZ-7xx SDK by by Alexander R. Pruss
;	by Stefano Bodrato - Oct. 2003
;
;
;	int ozkeyupper(char mask);
;	returns key pressed bitmap for upper part of keyboard
;
; ------
; $Id: ozkeyupper.asm,v 1.2 2011/08/12 18:40:25 pauloscustodio Exp $
;


	XLIB	ozkeyupper


ozkeyupper:
        ;ld      hl,2
        ;add     hl,sp
        ;call    $gint
        ;push    hl     ; pushed byte
        ;pop     bc

	pop	hl
	pop	bc	; pick the mask
	push	bc
	push	hl

        xor     a
        out     (17),a
        ld      a,c
        out     (18),a
        in      a,(16)
        ld      c,a
        ld      b,0
        push    bc
        pop     hl
        ret
