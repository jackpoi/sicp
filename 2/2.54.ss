(define (equal? a b)
  (cond
    ((and (symbol? a) (symbol? b)) (symbol-equal? a b))
    ((and (list? a) (list? b)) (list-equal? a b))
    (else #f))
)

(define (symbol-equal? a b)
  (eq? a b)
)

(define (list-equal? a b)
  (cond
    ((and (null? a) (null? b)) #t) ; 都为空，true
    ((or (null? a) (null? b)) #f) ; 只有一个为空，false
    ((equal? (car a) (car b)) (equal? (cdr a) (cdr b))) ; 递归比较
    (else #f))
)

(display (equal? 'abc 'abc)) (newline)
(display (equal? 'abc 'abcde)) (newline)
(display (equal? '(a b c) '(a b c))) (newline)
(display (equal? '(a b c) '(a b c d))) (newline)
(exit)
