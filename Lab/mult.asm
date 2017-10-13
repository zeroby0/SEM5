; Lesson 05 - Multiplication
; We can multiply two numbers using
; doubling and halving.
; If b is even, say 2c, then
; a*b = 2a*c
; If b is odd, say 2c+1, then
; a*b = 2a*c + a
; if b is 1, then a is the answer

jmp start

argA: db 8
argB: db 64
result: db 0, 0

start: lda argA
	mov l, a
	xra a
	mov h, a
	lda argB
	ora a
	cnz mult
	shld result
	hlt

; recursive function for HL*A
mult:	cpi 1
	jz done
	rar
	jc odd
	dad h
	jmp mult
odd:	push d
	mov d, h
	mov e, l
	call mult
	dad h
	dad d
	pop d
done:	ret
