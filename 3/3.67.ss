(load "D:/projects/mine/sicp/3/lib/stream.ss")

(define (pairs s t)
  (cons-stream
    (list (stream-car s) (stream-car t)) ; 左上部分
    (interleave
      (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t)) ; 右上部分
      (interleave ; 右下：递归产生
        (stream-map (lambda (x) (list x (stream-car t))) (stream-cdr s)) ; 左下部分
        (pairs (stream-cdr s) (stream-cdr t))))))

(define p (pairs integers integers))

(display (stream-head p 20))

(exit)
