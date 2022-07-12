; 求和，term是每一项的公式，next是下一项参数的公式，a是开始参数，b是结束参数
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b)
    )
  )
)

; 辛普森公式
(define (simpson f a b n)
  ; 常数 h 的定义：h=(b-a)/n
  (define h (/ (- b a) n))
  ; yk 的定义：yk=f(a+kh)
  (define (y k) (f (+ a (* k h))))
  ; yk 的系数：k=0,n时，系数为1，k为偶数时，系数为2，k为奇数时，系数为4
  (define (factor k)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          ((odd? k) 4)
    )
  )
  ; 每一项的公式
  (define (term k)
    (* (factor k) (y k))
  )
  ; 下一项参数的公式
  (define (next k) (+ k 1))
  ; 求和
  (if (not (even? n))
    0
    ; (exact->inexact 0): 返回0的浮点数
    (* (/ h 3) (sum term (exact->inexact 0) next n))
  )
)

; 立方公式
(define (cube x) (* x x x))

(display (simpson cube 0 1 100))
(newline)
(display (simpson cube 0 1 1000))

(exit)
