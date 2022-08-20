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
