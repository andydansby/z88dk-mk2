;       Z88 Small C+ Run time Library
;       Moved functions over to proper libdefs
;       To make startup code smaller and neater!
;
;       23/1/2001  djm

                XLIB    l_pint_ex

; store int from HL into (DE)
.l_pint_ex
	ex	de,hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	ret
