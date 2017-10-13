; Lesson 05 - Stack-based calls
; In this example, we pass arguments
; on stack. Registers are limited, but
; stack memory is not, so we can pass
; many argumnents on stack. However, stack
; is slower than registers.

;       +----------+
;       | ........ |
;       +-----+-----+
;       | locals    |
;       +-----+-----+
;   sp->| ret addr  |
;       +-----+-----+
;       | arg1      |
;       +-----+-----+
;       | arg2      |
;       +-----+-----+
;       | ........  |
;       +-----+-----+
;

start:  lxi h, tbl
again:	mov a, m
	inx h
	ora a
	jz done
	lxi b, 0c205h
	push b
	call checkmask
	pop b
	mov m, a
	inx h
	jmp again
done:	hlt

checkmask: push h	; save HL on stack
	lxi h, 4 ; space for HL+Ret addr
	dad sp	; HL now points to mask0
	push b
	mov b, a ; save value
	ana m	 ; extract 0 bits
	jnz nomatch
	inx h	; HL points to mask1
	mov a, m
	cma
	mov c, a
	mov a, m
	ana b
	ora c
	inr a
nomatch: pop b
	pop h
	ret

tbl: 	db 0c0h, 0h
	db 0c1h, 0h
	db 0c2h, 0h
	db 0c3h, 0h
	db 0h
