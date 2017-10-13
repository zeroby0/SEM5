; Lesson 07 - 16b Division by 2
; Rotate instructions make it easy to
; divide a 16-bit number by 2
; e.g 0001 0100 0001 1001 by
;               0000 0100

jmp start

argA:	db 25, 20
argB:	db 4
quot:	db 0, 0
rmd:	db 0

start:	lhld argA
	lda argB
	call div2b
	shld quot
	sta rmd
	hlt

; div2b divides HL/A, quotient in HL, rem in A
div2b:	dcr a
	push b  ; save BC regs
	mov b, a; save mask in b
	ana l
	mov c, a; save rem in C
loop:	xra a	; clear carry
	mov a, b; shift mask right
	rar
	mov b, a
	jnc done;
	xra a	; clear carry
	mov a, h; shift HL right
	rar
	mov h, a
	mov a, l
	rar
	mov l, a
	jmp loop
done:	mov a, c
	pop b	; restore BC
	ret