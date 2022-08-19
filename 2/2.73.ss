#|
a) 求导时，根据给定公式的前缀符号从操作表中找到对应的过程，进行对应的求导
现在的操作表是：
     │    +      │      *
─────┼───────────┼──────────────
deriv│ deriv-sum │ deriv-product
上面是操作符，下面是过程
number? 和 same-variable? 并不是操作符，不能放上面，也不是针对 + 和 * 的过程，也不能放下面
|#

(load "D:/projects/mine/sicp/2/lib/op-table.ss")
(load "D:/projects/mine/sicp/2/lib/deriv.ss")

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
          (if (same-variable? exp var) 1
              0))
        (else ((get 'deriv (operator exp)) (operands exp) var)))
)
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
; 对内容附加标志
(define (attach-tag type-tag x y) (list type-tag x y))
; 取出标志
(define (type-tag datumn) (car datumn))
; 取出内容
(define (contents datumn) (cdr datumn))

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
