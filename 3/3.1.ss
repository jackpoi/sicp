(define (make-accumulator sum)
  (lambda (n)
    (begin (set! sum (+ sum n)) sum))
)

(define s (make-accumulator 5))
(display (s 10)) (newline)
(display (s 10)) (newline)

(exit)
