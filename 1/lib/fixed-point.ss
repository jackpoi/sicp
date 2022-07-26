; 容许值
(define tolerance 0.00001)

; 寻找函数f的不动点
(define (fixed-point f first-guess)
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

; 平均阻尼
(define (average-damp f)
  (lambda (x) (average x (f x)))
)
