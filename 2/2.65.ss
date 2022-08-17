(load "D:/projects/mine/sicp/2/lib/tree-set.ss")
(load "D:/projects/mine/sicp/2/lib/sorted-set.ss")

; 将两个树转换成list之后取并集，再转换为树
(define (union-tree tree1 tree2)
  (list->tree
    (union-set (tree->list tree1) (tree->list tree2)))
)

; 将两个树转换成list之后取交集，再转换为树
(define (intersection-tree tree1 tree2)
  (list->tree
    (intersection-set (tree->list tree1) (tree->list tree2)))
)

(define x (list->tree '(1 2 3 4 5)))
(define y (list->tree '(1 3 5 7 9)))

(display x) (newline)
(display y) (newline)

(display (union-tree x y)) (newline)
(display (tree->list (union-tree x y))) (newline)

(display (intersection-tree x y)) (newline)
(display (tree->list (intersection-tree x y))) (newline)

(exit)
