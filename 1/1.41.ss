(define (double f)
  (lambda (x) (f (f x)))
)

(define (inc x) (+ x 1))

; 5+16=5+((1*2)*(1*2))*((1*2)*(1*2))
(display (((double (double double)) inc) 5))
(newline)
; 5+256=5+((2*2)*(2*2))*((2*2)*(2*2))
; 1: 1*2=2
; 2: 2*2=4
; 3: 4*4=16
; 4: 16*16=256
; ...
(display (((double (double (double double))) inc) 5))

(exit)
