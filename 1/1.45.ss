(load "D:/projects/mine/sicp/1/lib/fixed-point.ss")
(load "D:/projects/mine/sicp/1/lib/repeated.ss")
(load "D:/projects/mine/sicp/1/lib/power.ss")

; y->x/y^(n-1)

; 幂函数
; (define (expt base n)
;   (if (= n 0)
;     1
;     ((repeated (lambda (x) (* base x)) n) 1)
;   )
; )

; 对f进行n次平均阻尼
(define (average-damp-n f n)
  ((repeated average-damp n) f)
)

; 求n次方根的过程
; 对n次方根进行damp-times次平均阻尼
(define (nth-root n damp-times)
  (lambda (x)
    ; 求出n次阻尼之后再求不动点
    (fixed-point (average-damp-n (lambda (y) (/ x (expt y (- n 1)))) damp-times) 1.0)
  )
)

(display ((nth-root 2 1) 9))
(newline)
(display ((nth-root 3 1) 27))
(newline)
(display ((nth-root 4 2) 81))
(newline)
(display ((nth-root 5 2) 243))
(newline)
(display ((nth-root 6 2) (expt 3 6)))
(newline)
(display ((nth-root 6 3) (expt 3 6)))

(exit)
