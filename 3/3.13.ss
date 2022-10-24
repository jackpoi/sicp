; 将序列 x 和 x 自身拼接，会形成一个循环链表，类似于 (append! x x)
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x
)

(define x (list 'a 'b 'c)) ; x=> a->b->c->()

#|
z=> a->b->c--
    ↑_______|
形成了循环
|#
(define z (make-cycle x))

; (display z) (newline) ; a b c a b c a b c ...

(display (last-pair z)) (newline) ; b c a b c a b c ...

(exit)
