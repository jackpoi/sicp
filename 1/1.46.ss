(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (try guess)
      (let ((next (improve guess)))
        (if (good-enough? guess next)
          guess
          (try next)
        )
      )
    )
    (try first-guess)
  )
)

(define (fixed-point f first-guess)
  ; 容许值
  (define tolerance 0.00001)
  ; 是否低于容许值
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance)
  )
  (define (improve guess) (f guess))

  ((iterative-improve good-enough? improve) first-guess)
)

(display (fixed-point cos 1.0))
(newline)

(define (sqrt x)
  (define dx 0.00001)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) dx)
  )
  (define (improve guess) (/ (+ guess (/ x guess)) 2))

  ((iterative-improve good-enough? improve) 1.0)
)

(display (sqrt 9))

(exit)

