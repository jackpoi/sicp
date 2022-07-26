(load "D:/projects/mine/sicp/1/lib/power.ss")

(define(repeated f n)
  (if (= 1 n)
    f
    (lambda (x)
      (f ((repeated f (- n 1)) x))
    )
  )
)

(display ((repeated square 2) 5))
(newline)

(define (compose f g)
  (lambda (x) (f (g x)))
)

(define(compose-repeated f n)
  (if (= 1 n)
    f
    (compose f (compose-repeated f (- n 1))) ; f(f(n-1))
  )
)

(display ((compose-repeated square 2) 5))
(newline)

(exit)
