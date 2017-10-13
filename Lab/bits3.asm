; Lesson 03 - Creating a function
; Checking bit levels through masks is
; very useful, so we can wrap this into
; a function and call it from multiple
; places.
; In this exercise, we pass the code
; in A register, mask0 in C and mask1
; in B register.
; If the code matches the mask, then
; A is set to 0, otherwise it is non-zero


start:  lxi b, 0c205h; b=mask1, c=mask0
	mvi a, 0c2h;
	call checkmask
	hlt

; the function is defined here
; Note the use of DE as temp registers:
checkmask: push d	 ; save d, e registers
	mov d, a ; save value
	ana c	 ; extract 0 bits
	jnz nomatch
	mov a, b
	cma
	mov e, a
	mov a, b
	ana d
	ora e
	inr a
nomatch: pop d
	ret
