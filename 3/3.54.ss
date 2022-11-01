(load "D:/projects/mine/sicp/3/lib/stream.ss")

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define factorials (cons-stream 1
                                (mul-streams factorials (stream-cdr integers))))

(display (stream-head factorials 10))

(exit)
