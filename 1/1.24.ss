(define (square x) (* x x))

; 费马小定理：n是素数，a是小于n的任意正整数，有(a^n)%n = a%n，
; 由于a<n，所以(a^n)%n = a%n = a，模n同余

; (base^exp)%m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))
  )
)

; 随机一个小于n的数，判断是否模n同余
(define (fermat-test n)
  (define (try-it a) (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1))))
)

; 调用指定次数的随机数判断，提高命中率
(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)
  )
)

; (display (expmod 7 2 10))
; (display (fermat-test 23))
(display (fast-prime? 1009 10))
(display (fast-prime? 10007 10))
(display (fast-prime? 100003 10))
(display (fast-prime? 561 10))
(exit)
