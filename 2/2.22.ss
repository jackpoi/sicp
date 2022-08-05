(load "D:/projects/mine/sicp/1/lib/power.ss")

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things) (cons (square (car things)) answer))
    )
  )
  (iter items '())
)

#| 
(16 9 4 1)
显然是由于构造序列时，前项是递归，一直递归到最后一项的结果放入了后项
递归一层层出栈，结果也就从后往前组合，所以倒序
|#
(display (square-list '(1 2 3 4)))
(newline)

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things) (cons answer (square (car things))))
    )
  )
  (iter items '())
)

#|
((((() . 1) . 4) . 9) . 16)
因为构造序列的后项是递归，递归出栈时先构造，第二层包裹第一层构造
导致结果列表的前后项反了
|#
(display (square-list '(1 2 3 4)))
(newline)

; 可以在返回结果时将其翻转。。问题不大
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      (reverse answer)
      (iter (cdr things) (cons (square (car things)) answer))
    )
  )
  (iter items '())
)

(display (square-list '(1 2 3 4)))

(exit)
