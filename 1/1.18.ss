; 已知 add, double, halve
; multi(a, b) = a*b = multi-iter(a, b, res)
; a*b = a/2 * 2*b:
; 1) a = 0：0
; 2) a 是偶数：a/2 * 2*b = multi-iter(halve(a), double(b), res)
; 3) a 是奇数：(a-1)*b + b = multi-iter(a-1, b, res+b)

(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (multi a b) (multi-iter a b 0))

(define (multi-iter a b res)
  (cond ((= a 0) res)
        ((even? a) (multi-iter (halve a) (double b) res))
        (else (multi-iter (- a 1) b (+ res b)))
  )
)

(display "2x3=")
(display (multi 2 3))
(newline)

(display "9x7=")
(display (multi 9 7))
(exit)
