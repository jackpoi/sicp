(load "D:/projects/mine/sicp/2/lib/interval.ss")

; 宽2.2-1.1=1.1
(define x (make-interval 1.1 2.2))
; 宽3.2-1.5=1.7
(define y (make-interval 1.5 3.2))
(print-interval x)
(print-interval y)
; [2.6, 5.4]: 宽5.4-2.6=2.8=1.1+1.7
(print-interval (add-interval x y))
; [-2.1, 0.7]: 宽0.7+2.1=2.8=1.1+1.7
(print-interval (sub-interval x y))
; [1.65, 7.04]
(print-interval (mul-interval x y))
; [0.34375, 1.46667]
(print-interval (div-interval x y))

(exit)
