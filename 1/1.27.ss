(define (square x) (* x x))

; (base^exp)%m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))
  )
)

; 判断是否同余 (a^n)%n = a
(define (congruent? a n) (= (expmod a n n) a))

; 检测 carmichael 数，看是否小于该数的所有数都跟该数同余，虽然该数并不是素数
(define (carmichael-test n) (carmichael-test-iter 1 n))

; 逐个递增检测是否同余
(define (carmichael-test-iter i n)
  (cond ((= i n) #t)
        ((congruent? i n) (carmichael-test-iter (+ i 1) n))
        (else #f)
  )
)

; 561 = 3*187
(display (carmichael-test 561))
(newline)
(display (carmichael-test 1105))
(newline)
(display (carmichael-test 1729))
(newline)
(display (carmichael-test 2465))
(newline)
(display (carmichael-test 2821))
(newline)
(display (carmichael-test 6601))

(exit)
