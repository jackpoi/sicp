(load "D:/projects/mine/sicp/3/lib/stream.ss")

(define (show x)
  (display-line x)
  x)

(define x (stream-map show (stream-enumerate-interval 0 10)))
; 延时求值，只计算所需的值
(display (stream-ref x 5))
(display (stream-ref x 7))

(exit)
