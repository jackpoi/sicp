; x^n = (x^2)^(n/2) : n 是偶数
; x^n = x*(x^(n-1)) = x*((x^2)^(x/2)),其中 a=n-1 : n 是奇数
; 计算 a 是否为偶数，remainder 是计算余数
(define (even? n) (= (remainder n 2) 0))
(define (odd? n) (= (remainder n 2) 1))

; x 的 n 次方，初始值为 0，x 的 0 次方为 0
(define (power x n) (power-iter x n 1))

; x: x n: n 次方 res: 暂存结果
(define (power-iter x n res)
  (cond ((= n 0) res)
        ; 偶数：x^n = (x^2)^(n/2)
        ((even? n) (power-iter (* x x) (/ n 2) res))
        ; 奇数：x*((x^2)^((n-1)/2))=x*(x^(n-1))
        ((odd? n) (power-iter x (- n 1) (* res x)))
  )
)

(display "3^3=")
(display (power 3 3))
(newline)
(display "4^5=")
(display (power 4 5))
(newline)

(exit)