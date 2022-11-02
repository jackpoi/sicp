(load "D:/projects/mine/sicp/3/lib/stream.ss")

(define (pairs s t)
  (interleave
    (stream-map (lambda (x) (list (stream-car s)) t))
    (pairs (stream-cdr s) (stream-cdr t))))

#|
pairs 在递归调用时没有了延迟求值，就会导致不断调用 pairs，又因为 s 与 t 都是无穷序列，所以最终会导致栈溢出
之前采用三部分，interleave 是延迟求值的，所以不会出现上述问题
|#

(define p (pairs integers integers))
(display (stream-head p 10))

(exit)
