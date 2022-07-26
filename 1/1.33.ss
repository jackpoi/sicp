(load "D:/projects/mine/sicp/1/lib/prime.ss")
; 通过filter过滤
(define (filtered-accumulate combiner null-value term a next b filter?)
  (if (> a b)
    null-value
    ; 将返回值抽取变量，减少冗余
    (let ((result-terms (filtered-accumulate combiner
                                             null-value
                                             term
                                             (next a)
                                             next
                                             b
                                             filter?)
          ))
      (if (filter? a)
        (combiner (term a) result-terms)
        result-terms
      )
    )
  )
)

; a~b之间的素数之和
(define (prime-sum a b)
  (filtered-accumulate +
                       0
                       (lambda (x) x)
                       a
                       (lambda (i) (+ i 1))
                       b
                       prime?
  )
)
(display (prime-sum 1 10))
(newline)
(display (prime-sum 1 100))
(newline)

; 检查两个数是否互素
(define (coprime? a b)
  (and (< a b)
       (= 1 (gcd a b))
  )
)

; 小于n的所有与n互素的正整数的乘积
(define (product-of-coprimes n)
  (filtered-accumulate *
                       1
                       (lambda (x) x)
                       1
                       (lambda (i) (+ i 1))
                       n
                       (lambda (x) (coprime? x n)) ; 判断当前数是否与n互素
  )
)
; 1 3 7 9
(display (product-of-coprimes 10))
(newline)
; 1 3 7 9 11 13 17 19
(display (product-of-coprimes 20))
(newline)

(exit)
