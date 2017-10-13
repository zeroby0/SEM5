; FIBONACCI SERIES

; initializer
;; fib(0)
mvi a, 00h

;;fib(1)
mvi b, 01h

; initialize c, h, l
mvi c, 00h
mvi h, 00h
mvi l, 00h

jp fibonacci_loop

fibonacci_loop: add b
		mov c,b
		mov b,a
		mov a,c
		inr l
		mov m,a
		jnz fibonacci_loop	
			

; exit
hlt