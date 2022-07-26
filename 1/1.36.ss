(load "D:/projects/mine/sicp/1/lib/power.ss")

; 容许值
(define tolerance 0.000001)
; 寻找函数f的不动点
(define (fixed_point f first-guess)
  ; 是否低于容许值
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance)
  )
  ; 递归寻找不动点
  (define (try guess step)
    (display-info guess step) ; 寻找时打印
    (let ((next (f guess)))
      (if (close-enough? guess next)
        (begin (display-info next (+ 1 step)) ; 找到时打印
               next)
        (try next (+ 1 step))
      )
    )
  )
  ; 寻找
  (try first-guess 1)
)

(define (display-info guess step)
  (display "step: ")
  (display step)
  (display " ")
  (display "guess: ")
  (display guess)
  (newline)
)

; 平均阻尼
(define (average-damp f)
  (lambda (x) (average x (f x)))
)

(define formula
  (lambda (x) (/ (log 1000) (log x)))
)

(display "x=log(1000)/log(x) 的不动点（不带平均阻尼）:")
(newline)
(display (fixed_point formula 2.0)) ; 41步
(newline)

(display "x=log(1000)/log(x) 的不动点（带平均阻尼）:")
(newline)
(display (fixed_point (average-damp formula) 2.0)) ; 12步
(newline)

(exit)
