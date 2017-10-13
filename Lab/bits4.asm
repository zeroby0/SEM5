; Lesson 04 - Stack-based parameters in functions
; In this lesson, we pass the mask parameter
; on a stack. Unlike registers, stack is on
; external memory, so we can pass along
; many more parameters than what our registers
; can hold.

start:  lxi h, tbl
again:	mov a, m
	inx h
	ora a
	jz done
	lxi b, 0c205h
	call checkmask
	mov m, a
	inx h
	jmp again
done:	hlt

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

tbl: 	db 0c0h, 0h
	db 0c1h, 0h
	db 0c2h, 0h
	db 0c3h, 0h
	db 0h
