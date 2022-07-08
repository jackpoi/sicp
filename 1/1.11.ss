; 递归版
(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1))
      (* 2 (f (- n 2)))
      (* 3 (f (- n 3)))
    )
  )
)

(display (f 1))
(newline)
(display (f 2))
(newline)
(display (f 5))
(newline)

; 迭代版
; f(1) = 1, f(2) = 2, f(3) = 3
; f(4) = f(3) + 2f(2) + 3f(1)
; f(5) = f(4) + 2f(3) + 3f(2)
; f(x)(x >= 3) = f3 + 2f2 + 3f1
; f(x+1)(x >= 3) = f(x) + 2f3 + 3f2
; f-iter(a, b, c, i, n): a, b, c -> f3, f2, f1, i -> 当前n的值, n -> 最大值
(define (f-iter a b c i n)
  (if (= i n)
    c
    (f-iter
      (+ a (* 2 b) (* 3 c))
      a
      b
      (+ i 1)
      n
    )
  )
)

(define (f2 n) (f-iter 2 1 0 0 n))

(display (f2 1))
(newline)
(display (f2 2))
(newline)
(display (f2 5))
(exit)
