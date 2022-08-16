(load "D:/projects/mine/sicp/2/lib/deriv.ss")

; 判断是不是只有一个字符
(define (single-operator? e)
  (not (and (pair? e) (> (length e) 1)))
)

; 如果a2不是单字符，就将其进行拆解
(define (make-sum a1 . a2)
  (if (single-operator? a2)
    (let ((a2 (car a2)))
      (cond ((=number? a1 0) a2)
            ((=number? a2 0) a1)
            ((and (number? a1) (number? a2)) (+ a1 a2))
            (else (list '+ a1 a2))))
    (cons '+ (cons a1 a2)))
)

(define (addend e)
  (cadr e)
)

(define (augend e)
  (let ((tail (cddr e)))
    (if (single-operator? tail)
      (car tail)
      (apply make-sum tail)))
)

(define (make-product m1 . m2)
  (if (single-operator? m2)
    (let ((m2 (car m2)))
      (cond ((or (=number? m1 0) (=number? m2 0)) 0)
            ((=number? m1 1) m2)
            ((=number? m2 1) m1)
            ((and (number? m1) (number? m2)) (* m1 m2))
            (else (list '* m1 m2))))
    (cons '* (cons m1 m2)))
)

(define (multiplier e)
  (cadr e)
)

(define (multiplicand e)
  (let ((tail (cddr e)))
    (if (single-operator? tail)
      (car tail)
      (apply make-product tail)))
)

(display (deriv '(* x y (+ x 3)) 'x))

(exit)
