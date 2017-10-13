; Array Size
mvi a, 05h
sta 1000h

; initialize counters
mvi d, 05h ; arr_size
mvi e, 01h ; counter_j

; load array data to memory
mvi a, 05h
sta 1001h

mvi a, 04h
sta 1002h

mvi a, 03h
sta 1003h

mvi a, 02h
sta 1004h

mvi a, 01h
sta 1005h

; set location of pointer to array
lxi h, 1001h

jmp bubble_sort

bubble_sort:	mov a,m ; load a with data in m (address in hl)
		mov b,a	; move data to b
		inr l	; move to next memory location
		mov a,m ; load a with data in m (address in hl)
		cmp b	; check with a
		
		; if a < b swap a and b
		cc swap
		; if a >= b don't swap
		nop

		mov a,b	; move contents of b to a
		push b ; push ab to stack
		mov a,e ; move counter_j to a
		inr a ; increment counter_j
		cmp d ; compare with arr_size
		mov e,a ; move back counter_j value from a to e
		cz update ; check if update needs to be called
		pop b ; pop back ab from stack
		jmp bubble_sort ; continue with the bubble_sort loop
				
swap: 	mov c,a	; move a to c
	mov a,b ; move b to a
	mov b,c ; move c to b
	mov m,a ; write a to memory
	dcr l   ; decrement memory pointer to previous location
	mov m,b ; write b to memory
	inr l   ; increment memory pointer back to original state
	ret
	
update: mvi e, 01h ; reset counter back to 0
	lxi h, 1001h ; set pointer location back to array start
	dcr d ; decrement array_size
	push b ; push ab to stack
	mvi a, 01h ; set a as 1
	cmp d ; compare with array_size
	pop b ; pop back ab from stack
	cz halter ; call halter if array_size is 1
	ret

halter: hlt

hlt