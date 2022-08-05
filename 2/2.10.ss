(load "D:/projects/mine/sicp/2/lib/interval.ss")

(define (div-interval x y)
  (if (> 0 (/ (upper-bound y) (lower-bound y)))
    (make-interval 0 0)
    (mul-interval
      x
      (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))
    )
  )
)

; 宽2.2-1.1=1.1
(define x (make-interval 1.1 2.2))
; 宽3.2-1.5=1.7
(define y (make-interval -1.5 3.2))

(print-interval (div-interval x y))

(exit)
