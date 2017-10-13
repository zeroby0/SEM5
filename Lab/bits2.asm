; Lesson 02 - Handling don't care bits
; Sometimes, we don't care about certain bits
; in a register. We do expect other bits to
; be in specific state. E.g Flag register
; To match this, we use two masks
; In mask0, we set bits that have to be 0
; In mask1, we set bits that have to be 1
; e.g. In conditional jump opcodes
; 0c2h, 0cah, 0d2h, 0dah, 0e2h, 0eah, 0f2h, 0fah
; mask0 0000 0101
; mask1 1100 0010
; In this exercise, if a given code matches a
; mask pair, we emit 0 otherwise non-zero

jmp	start

code: db  0d2h
mask0: db 005h
mask1: db 0c2h
result: db 0h

start: lda code
	mov b, a ; load code into b
	lda mask0
	ana b	 ; extract bits
	jnz nomatch
	lda mask1
	cma
	ora b    ; a = b or ~mask1
	inr a
nomatch: sta result
	hlt
