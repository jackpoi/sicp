(define (square x) (* x x))

; 判断a是否为对n取模的1的非平凡平方根
(define (non-trivial-square-root? a n)
  (and (not (= a 1)) (not (= a (- n 1)))
    (= 1 (remainder (square a) n))
  )
)

; (base^exp)%m -> (a^n)%n
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ; 先判断a是否是1取模n的非平凡平方根，如果是，说明n不是素数，否则再进行费马检查
        ((non-trivial-square-root? base m) 0)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))
  )
)

; 在计算a^(n-1)时只有一半的几率会碰到1取模n的非平凡平方根，所以至少要执行n/2次
(define (miller-rabin-test n)
  (let ((times (ceiling (/ n 2))))
    (miller-rabin-test-iter n times)
  )
)

(define (miller-rabin-test-iter n times)
  (cond ((= times 0) #t)
        ((= (expmod (non-zero-random n) (- n 1) n) 1)
          (miller-rabin-test-iter n (- times 1)))
        (else #f)
  )
)

; 生成非0随机数
(define (non-zero-random n)
  (let ((r (random n)))
    (if (not (= r 0))
      r
      (non-zero-random n)
    )
  )
)

; 费马检查会被carmichael数欺骗，而Miller-Rabin检查不会被carmichael数欺骗
; 561 = 3*187
(display (miller-rabin-test 561))
(newline)
(display (miller-rabin-test 1105))
(newline)
(display (miller-rabin-test 1729))
(newline)
(display (miller-rabin-test 2465))
(newline)
(display (miller-rabin-test 2821))
(newline)
(display (miller-rabin-test 6601))
(newline)
(display (miller-rabin-test 563))

(exit)
