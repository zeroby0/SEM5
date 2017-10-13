; Lesson 06 - Division by 2
; Rotate instructions make it easy to
; divide a 8-bit number by 2^k
;    abcd efgh
;    0001 0000
; the quotient is the part upto the first 1
;    0000 abcd
; and the remainder is the part after the 1
;    0000 efgh
; Since the remainder is lt or eq 2^k-1, we
; can extract it easily by using this limit
; as a mask

jmp start

argA:	db 25
argB:	db 4
quot:	db 0
rmd:	db 0

start:	lda argA
	mov l, a
	lda argB
	call div2
	sta rmd
	mov a, l
	sta quot
	hlt

; div2 divides L/A, quotient in L, rem in A
div2:	dcr a
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
	mov a, l; shift L right
	rar
	mov l, a
	jmp loop
done:	mov a, c
	pop b	; restore BC
	ret
