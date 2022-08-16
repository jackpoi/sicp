(load "D:/projects/mine/sicp/2/lib/deriv.ss")

; 将(+ addend augend)改成(addend + augend)，只改变取值和构造顺序就可以了

; e = (addend + augend)
(define (sum? e)
  (and (pair? e) (eq? (cadr e) '+))
)

(define (addend e)
  (car e)
)

(define (augend e)
  (caddr e)
)

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))) ; 将运算符放中间
)

; e = (multiplier * multiplicand)
(define (product? e)
  (and (pair? e) (eq? (cadr e) '*))
)

(define (multiplier e)
  (car e)
)

(define (multiplicand e)
  (caddr e)
)

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2)))
)

(display (make-sum 'x 'y)) (newline)

(display (make-product 'x 'y)) (newline)

(display (deriv '((x * y) * (x + 3)) 'x))

(exit)
