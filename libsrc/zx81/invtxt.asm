;
;       ZX81 libraries
;
;--------------------------------------------------------------
; This code comes from the FidoNET Sinclair newsgroup
;--------------------------------------------------------------
;
;       $Id: invtxt.asm,v 1.2 2009/08/20 05:59:11 stefano Exp $
;
;----------------------------------------------------------------
;
; invtxt() - invert text display
;
;----------------------------------------------------------------

        XLIB    invtxt

invtxt:
                LD HL,(400CH)        ; DFILE ADDR
                LD C,16H             ; LINES=22
LOOP2:          LD B,20H             ; CHARS=32
LOOP1:          INC HL               ; INC DFILE
                LD A,(HL)            ; DFILE CHAR
                XOR 80H              ; ** invert it **
                LD (HL),A            ; POKE DFILE
                DJNZ LOOP1           ; LINE COUNTER
                INC HL               ; NEW LINE
                DEC C                ; 
                JR NZ, LOOP2         ; UNTIL C=0
                RET
