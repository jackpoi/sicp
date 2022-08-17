; set 是一个不重复升序集合

(define (adjoin-set x set)
  (cond ((null? set) (list x))
    ((= x (car set)) set)
    ((< x (car set)) (cons x set))
    (else (cons (car set) (adjoin-set x (cdr set)))))
)

#|
未排序集合需要遍历全部元素判断是否重复
排序集合遇到比要添加的元素大的就不再比较了，平均复杂度为未排序集合的一半
|#

(define x (list 1 2 3 4))
(define y (list 3 4 5))

(display (adjoin-set 4 x))

(exit)
