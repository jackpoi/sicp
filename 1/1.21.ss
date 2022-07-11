; a 能否整除 b
(define (divides? a b) (= (remainder a b) 0))
; 找出 n 的最小因子
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n guess)
  (cond ((> (* guess guess) n) n)
        ((divides? n guess) guess)
        (else (find-divisor n (+ guess 1)))
  )
)

(display "199 的最小因子：")
(display (smallest-divisor 199))
(newline)

(display "1999 的最小因子：")
(display (smallest-divisor 1999))
(newline)

(display "19999 的最小因子：")
(display (smallest-divisor 19999))

(exit)
