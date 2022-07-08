; 容许值
(define tolerance 0.00001)
; 寻找函数f的不动点
(define (fixed_point f first-guess)
  ; 是否低于容许值
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance)
  )
  ; 递归寻找不动点
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next)
      )
    )
  )
  ; 寻找
  (try first-guess)
)

; cos(x)的不动点
(display "cos(x)的不动点:")
(display (fixed_point cos 1.0))
(newline)

(display "x=1+1/x 的不动点，即黄金分割率:")
(display (fixed_point (lambda (x) (+ 1 (/ 1 x))) 1.0))
(newline)

(exit)
