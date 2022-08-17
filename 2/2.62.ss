; 取两个升序 set 的并集
(define (union-set set1 set2)
  (cond ((and (null? set1) (null? set2)) '())
        ((null? set1) set2)
        ((null? set2) set1)
        (else
          (let ((e1 (car set1))
                (e2 (car set2)))
            (cond ((= e1 e2) (cons e1 (union-set (cdr set1) (cdr set2))))
                  ((< e1 e2) (cons e1 (union-set (cdr set1) set2)))
                  ((> e1 e2) (cons e2 (union-set set1 (cdr set2))))))))
)

#|
相当于双指针，同时遍历两个集合
如果两个集合的当前元素相等，就将元素添加到结果中，两个指针同时后移
如果不相等，由于是升序集合，将元素较小的元素添加到结果中，并将较小的集合的指针后移，接着进行比较
双指针，复杂度为O(n)
|#

(define x (list 1 2 3 4))
(define y (list 3 4 5))

(display (union-set x y))

(exit)
