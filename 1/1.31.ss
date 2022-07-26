; 递归版
(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b)
    )
  )
)
; 1*2*3*...*9*10
(display (product (lambda (x) x) 1 (lambda (i) (+ i 1)) 10))
(newline)
; 迭代版
(define (product2 term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (+ a 1) (* (term a) result))
    )
  )
  (iter a 1)
)
; 1*2*3*...*9*10
(display (product2 (lambda (x) x) 1 (lambda (i) (+ i 1)) 10))
(newline)

; 阶乘：5!=1*2*3*4*5，也就是n的阶乘为1~n的乘积和
(define (factorial n)
  (product (lambda (x) x) 1 (lambda (i) (+ i 1)) n)
)
; 10!
(display (factorial 10))
(newline)

; π的近似值：π=4*(2*4*4*...)/(3*3*5*...)
; 分子
(define (numerator-term i)
  (if (even? i)
    (+ i 2)
    (+ i 1)
  )
)
; 分母
(define (denominator-term i)
  (if (odd? i)
    (+ i 2)
    (+ i 1)
  )
)
; π：π=4*(2*4*4*...)/(3*3*5*...)
(define (pi n)
  (* 4
    (inexact
      (/ (product numerator-term 1 (lambda (i) (+ i 1)) n)
       (product denominator-term 1 (lambda (i) (+ i 1)) n)
      )
    )
  )
)

(display (pi 10))
(newline)
(display (pi 100))
(newline)
(display (pi 1000))
(newline)
(display (pi 10000))
(newline)

(exit)
