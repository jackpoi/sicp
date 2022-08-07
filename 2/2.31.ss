; 其实就是以 (define (tree-map square tree)) 的形式来定义

(load "D:/projects/mine/sicp/1/lib/power.ss")

(define (square-tree tree)
  (tree-map square tree)
)
(define (tree-map f tree)
  (map
    (lambda (sub)
      (if (pair? sub)
        (tree-map f sub)
        (f sub)))
    tree
  )
)

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(display x) (newline)
(display (square-tree x))

(exit)
