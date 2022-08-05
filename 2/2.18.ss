(define (reverse l)
  (if (null? l)
    l
    (append (reverse (cdr l)) (list (car l))))
)

#| 
如果是空表，说明初始表就是空表或者已经到了表的最后一个值，直接返回空表，停止递归
如果不是空表，将表的第一个值拼接到后面，将余下的后方的值接着进行递归
|#

(display (reverse '()))
(newline)
(display (reverse '(23 73 149 34)))

(exit)
