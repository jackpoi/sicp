(load "D:/projects/mine/sicp/2/lib/accumulate.ss")

; 计算每个节点的叶子数量，使用 accumulate 加起来
(define (count-leaves t)
  (accumulate
    +
    0
    (map
      (lambda (sub)
        (if (pair? sub)
        (count-leaves sub)
        1))
      t))
)

(display (count-leaves (list (list 1 2) (list 3 4))))

(exit)
