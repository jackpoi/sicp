(define(repeated f n)
  (if (= 1 n)
    f
    (lambda (x)
      (f ((repeated f (- n 1)) x))
    )
  )
)