(load "D:/projects/mine/sicp/3/lib/stream.ss")

(define (partial-sums stream)
  (cons-stream (stream-car stream)
               (add-streams (partial-sums stream) (stream-cdr stream))))

(define s (partial-sums integers))

(display (stream-head s 10))

(exit)
