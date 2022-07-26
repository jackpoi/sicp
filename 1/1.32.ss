; 迭代版
; combiner: 前项和后项的运算规则
; null-value: 默认值
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b)
    )
  )
)

(define (sum term a next b)
  (accumulate + 0 term a next b)
)
(display (sum (lambda (x) x) 1 (lambda (i) (+ i 1)) 10))
(newline)

(define (product term a next b)
  (accumulate * 1 term a next b)
)
(display (product (lambda (x) x) 1 (lambda (i) (+ i 1)) 10))
(newline)

; 递归版
(define (accumulate2 combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))
    )
  )
  (iter a null-value)
)

(define (sum2 term a next b)
  (accumulate2 + 0 term a next b)
)
(display (sum2 (lambda (x) x) 1 (lambda (i) (+ i 1)) 10))
(newline)

(define (product2 term a next b)
  (accumulate2 * 1 term a next b)
)
(display (product2 (lambda (x) x) 1 (lambda (i) (+ i 1)) 10))
(newline)

(exit)
