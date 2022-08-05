(define (last-pair l)
  (if (null? (cdr l))
    l
    (last-pair (cdr l)))
)

#| 
本身表是非空的
(list 1 2) => (cons 1 (cons 2 '()))
如果后位是空表了，说明已经是最后一个了，直接返回带空表的序列
如果不是空表，说明不是最后一个，接着对后位进行递归
|#

(display (last-pair '(23 73 149 34)))

(exit)
