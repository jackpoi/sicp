#|
自定义一个唯一序对 identity
不断将表的前一个节点设为 identity
同时判断表的节点是否和唯一序对相等，如果相等说明有环
其他语言中，链表的话可以使用快慢指针，如果有环，快慢指针肯定会相遇
|#
(define (cycle? x)
  (let ((identity (cons '() '())))
    (define (iter remain)
      (cond ((null? remain)
              #f)
            ((eq? identity (car remain))
              #t)
            (else
              (set-car! remain identity)
              (iter (cdr remain))))
    )
    (iter x))
)

(define p3 (cons 'a '()))
(define p2 (cons p3 '()))
(define p1 (cons p2 p3))
(display (cycle? p1)) (newline)

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x
)
(define p3 (cons 'c '(1 2)))
(define p2 (cons 'b p3))
(define p1 (cons 'a p2))
(define cycle (make-cycle p1))
(display (cycle? cycle)) (newline)

(exit)
