(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))
    )
  )
  (iter a 0)
)

; ∑x, (0<n<10, n=n+1)
(display (sum (lambda (x) x) 1 (lambda (i) (+ i 1)) 10))
(newline)
; ∑(x^2), (0<n<10, n=n+1)
(display (sum (lambda (x) (* x x)) 1 (lambda (i) (+ i 1)) 10))

(exit)
