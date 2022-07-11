; 已知 add, double, halve
; a*b: 1) a = 0：0
;      2) a 是偶数：2*(a/2 * b) = double(multi(halve(a), b))
;      3) a 是奇数：b + (a-1)*b = b + 2*((a-1)/2 * b)
;                              = add(b, double(multi(halve(a-1), b)))
(define (add a b) (+ a b))
(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (multi a b)
  (cond ((= a 0) 0)
        ((even? a) (double (multi (halve a) b)))
        ((odd? a) (add b (double (multi (halve (- a 1)) b))))
  )
)

(display "2x3=")
(display (multi 2 3))
(newline)

(display "9x7=")
(display (multi 9 7))
(exit)
