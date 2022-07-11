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
