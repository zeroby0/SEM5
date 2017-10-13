; Lesson 01 - Bit Masks
; Extract bits from a 8-bit register given a mask
; e.g
;   0011 1000
; will extract the number encoded in bits b5/4/3

jmp start

code: db 74h
mask: db 038h
num:  db 0

start: lda code
	mov b, a ; load code into b
	lda mask
	mov c, a ; save mask in c
	ana b	 ; extract bits
	mov b, a
	mov a, c
again:	ani 1h	 ; check lsb of mask
	jnz done ; if 1 we are done
	mov a, b ; else shift answer right
	rar
	mov b, a
	mov a, c ; shift mask right
	rar
	mov c, a
	jmp again
done:	mov a, b
	sta num
	hlt