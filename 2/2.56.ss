(load "D:/projects/mine/sicp/2/lib/deriv.ss")

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
          (if (same-variable? exp var) 1
              0))
        ((sum? exp)
          (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))
        ((product? exp)
          (make-sum
            (make-product (multiplier exp) (deriv (multiplicand exp) var))
            (make-product (multiplicand exp) (deriv (multiplier exp) var))))
        ((exponentiation? exp)
          (let ((u (base exp))
                (n (exponent exp)))
            (make-product
              (make-product n (make-exponentiation u (- n 1))) ; n*u^(n-1)
              (deriv u var)))) ; u'
        (else (display "unsupported")))
)

; e = (** base exponent)
(define (exponentiation? e)
  (and (pair? e) (eq? (car e) '**))
)

(define (base e)
  (cadr e)
)

(define (exponent e)
  (caddr e)
)

(define (make-exponentiation base exponent)
  (cond ((= exponent 0) 1)
        ((= exponent 1) base)
        (else (list '** base exponent)))
)

(display (deriv '(** x 0) 'x)) (newline)

(display (deriv '(** x 2) 'x))

(exit)
