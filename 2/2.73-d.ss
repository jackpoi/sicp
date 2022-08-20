#|
d)
之前是 ((get 'deriv (operator exp)) (operands exp) var)
变为 ((get (operator exp) 'deriv) (operands exp) var)
也就是获取过程的方式从 (get 过程 标志) 变为了 (get 标志 过程)
只需要在将过程放入操作表时，将过程和标志换一下位置就可以了
之前是 (put 'deriv (operator exp))，改为 (put (operator exp) 'deriv)
|#

(load "D:/projects/mine/sicp/2/lib/op-table.ss")

(put 'odd? 'odd odd?)

(display ((get 'odd? 'odd) 3)) (newline)
(display ((get 'odd? 'odd) 4)) (newline)

(exit)
