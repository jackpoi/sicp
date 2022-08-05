(load "D:/projects/mine/sicp/2/lib/interval.ss")

(define x (make-center-percent 5 0.1))
(define y (make-center-percent 10 0.1))

(print-interval x)
(print-interval y)

(define z (mul-interval x y))

(print-interval z)
(newline)
(display (threshold z))
(newline)
; 乘积的百分数除以2
(display (/ (percent z) 2))

; [x1-p1, x1+p1] * [x2-p2, x2+p2]; p1,p2≈0

(exit)
