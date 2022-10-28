(load "D:/projects/mine/sicp/3/lib/stream.ss")

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
    the-empty-stream
    (cons-stream
      (apply proc (map stream-car argstreams))
      (apply stream-map (cons proc
                              (map stream-cdr argstreams)))))
)

(define s (stream-enumerate-interval 1 10))
(display-stream (stream-map * s s))

(exit)
