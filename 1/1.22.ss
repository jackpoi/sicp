(load "D:/project/mine/sicp/1/lib/prime.ss")

; 判断 n 是否为素数
(define (prime? n) (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime))
)

(define (start-orime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))
  )
)

(define (report-prime elapsed-time)
  (display " *** 用时：")
  (display elapsed-time)
  (display " *** ")
)

; 返回 n 的下一个奇数
(define (next-odd n)
  (if (odd? n) (+ n 2)
    (+ n 1)
  )
)

; 找出从 n 开始的 count 个素数
(define (search-count-primes n count)
  (cond ((= count 0) (display " 是素数。"))
        ((prime? n)
          ; (timed-prime-test n)
          (display n)
          (display " ")
          (search-count-primes (next-odd n) (- count 1))
        )
        (else (search-count-primes (next-odd n) count))
  )
)

(display (search-count-primes 1000 3))
(newline)
(display (search-count-primes 10000 3))
(newline)
(display (search-count-primes 100000 3))
(exit)


