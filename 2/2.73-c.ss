(load "D:/projects/mine/sicp/2/2.73.ss")

; c)
(define (install-exponentiation-package)

  (define (base e) (car e))
  (define (exponent e) (cadr e))
  (define (make-exponentiation base exponent)
    (cond ((= exponent 0) 1)
          ((= exponent 1) base)
          (else (attach-tag '** base exponent)))
  )

  (put 'base '** base)
  (put 'exponent '** exponent)
  (put 'make-exponentiation '** make-exponentiation)
  (put 'deriv '**
    (lambda (exp var)
      (let ((u (base exp))
            (n (exponent exp)))
        (make-product
          (make-product n (make-exponentiation u (- n 1))) ; n*u^(n-1)
          (deriv u var)))))
)

(install-exponentiation-package)
(display "c) ")
; 3x^2
(display (deriv '(** x 3) 'x)) (newline)

(exit)
