#|
双端队列和普通队列的实现差不多，只不过多了队头插入和队尾删除
执行插入删除操作时，根据队头队尾操作对应的队头队尾指针，更改指向即可
|#
(define (make-deque) (cons '() '()))

(define (front-ptr deque) (car deque))

(define (rear-ptr deque) (cdr deque))

(define (set-front-ptr! deque item) (set-car! deque item))

(define (set-rear-ptr! deque item) (set-cdr! deque item))

(define (empty-deque? deque) (null? (front-ptr deque)))

(define (front-deque deque)
  (if (empty-deque? deque)
    (error "FRONT called with an emtpy deque" deque)
    (car deque))
)

(define (rear-deque deque)
  (if (empty-deque? deque)
    (error "FRONT called with an emtpy deque" deque)
    (cdr deque))
)

(define (front-insert-deque! deque item)
    (if (empty-deque? deque)
      (rear-insert-deque! deque item)
      (begin
        (set-front-ptr! deque (cons item (front-ptr deque)))
        deque))
)

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons item '())))
    (if (empty-deque? deque)
      (begin
        (set-front-ptr! deque new-pair)
        (set-rear-ptr! deque new-pair)
        deque)
      (begin
        (set-cdr! (rear-deque deque) new-pair)
        (set-rear-ptr! deque new-pair)
        deque)))
)

(define (front-delete-deque! deque)
  (if (empty-deque? deque)
    (error "DELETE! called with an empty deque" deque)
    (begin
      (set-front-ptr! deque (cdr (front-ptr deque)))
      deque))
)

(define (rear-delete-deque! deque)
  ; 找到队列最后一个元素，将其置空，并更新队尾指针(不更新也可以，因为已经对队列进行了实际上的修改)
  (define (iter deque list)
    (if (null? (cdr (cdr list)))
      (begin
        (set-cdr! list '())
        (set-rear-ptr! deque list)
        deque)
      (iter deque (cdr list)))
  )
  (cond
    ((empty-deque? deque)
      (error "DELETE! called with an empty deque" deque))
    ((null? (cdr (front-ptr deque))) ; 队列长度为 1，将队列设置为空序对
      (set-front-ptr! deque '())
      deque)
    (else ; 队列长度大于 1
      (iter deque (front-ptr deque))))
)

(define (print-deque deque)
  (display (car deque))
)

(define q (make-deque))
(front-insert-deque! q 'a)
(print-deque q) (newline)
(front-insert-deque! q 'b)
(print-deque q) (newline)
(rear-insert-deque! q 'c)
(print-deque q) (newline)

(front-delete-deque! q)
(print-deque q) (newline)
(rear-delete-deque! q)
(print-deque q) (newline)

(exit)
