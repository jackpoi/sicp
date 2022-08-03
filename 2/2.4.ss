(car (cons 1 2))
=> ((lambda (z) (z (lambda (p q) p))) (lambda (m) (m 1 2)))
=> ((lambda (m) (m 1 2)) (lambda (p q) p))
=> ((lambda (p q) p) (1 2))
=> 1

(define (cdr z)
  (z (lambda (p q) q))
)
