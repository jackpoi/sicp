(load "D:/projects/mine/sicp/2/2.73.ss")

; b)
(define (install-sum-package)
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (attach-tag '+ a1 a2)))
  )

  (put 'addend '+ addend)
  (put 'augend '+ augend)
  (put 'make-sum '+ make-sum)
  (put 'deriv '+
    (lambda (exp var) (make-sum (deriv (addend exp) var) (deriv (augend exp) var))))
)

(install-sum-package)
(display "b.1) ")
; 1
(display (deriv '(+ x 3) 'x)) (newline)

(define (install-product-package)
  (define (multiplier s) (car s))
  (define (multiplicand s) (cadr s))
  (define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (attach-tag '* m1 m2)))
  )

  (define (make-sum x y) ((get 'make-sum '+) x y))

  (put 'multiplier '* addend)
  (put 'multiplicand '* augend)
  (put 'make-product '* make-sum)
  (put 'deriv '*
    (lambda (exp var)
      (make-sum (make-product (multiplier exp) (deriv (multiplicand exp) var))
                (make-product (multiplicand exp) (deriv (multiplier exp) var)))))
)

(install-product-package)
(display "b.2) ")
; y
(display (deriv '(* x y) 'x)) (newline)

(exit)
