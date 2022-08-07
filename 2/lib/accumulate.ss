(define (accumulate f initial sequence)
  (if (null? sequence)
    initial
    (f (car sequence) (accumulate f initial (cdr sequence))))
)
