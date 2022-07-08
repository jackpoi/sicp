; (x/y^2 + 2y)/3

; 改进答案，就是公式，guess 就是 y
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3)
)

; 平方
(define (square x) (* x x))

; 立方
(define (cube x) (* x x x))

; 检测标准
(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001)
)

; 递归猜测
(define (cube-root-iter guess x)
  (if (good-enough? guess x)
    guess
    (cube-root-iter (improve guess x) x)
  )
)

; 既定一个初始猜测值 1.0
(define (cube-root x)
  (cube-root-iter 1.0 x)
)

(display "8 的立方根：")
(display (cube-root 8))
(newline)

(display "64 的立方根：")
(display (cube-root 64))
(exit)
