(load "D:/projects/mine/sicp/2/lib/tree.ss")

(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree) (tree->list-1 (right-branch tree)))))
)

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree)
                          (copy-to-list (right-branch tree) result-list))))
  )
  (copy-to-list tree '())
)

(define a (make-tree 7
            (make-tree 3
              (make-tree 1 '() '())
              (make-tree 5 '() '()))
            (make-tree 9
              '()
              (make-tree 11 '() '()))))

(define b (make-tree 3
            (make-tree 1 '() '())
            (make-tree 7
              (make-tree 5 '() '())
              (make-tree 9
                          '()
                          (make-tree 11 '() '())))))

(define c (make-tree 5
            (make-tree 3
              (make-tree 1 '() '())
              '())
            (make-tree 9
              (make-tree 7 '() '())
              (make-tree 11 '() '()))))

(display (tree->list-1 a)) (newline)
(display (tree->list-2 a)) (newline)

(display (tree->list-1 b)) (newline)
(display (tree->list-2 b)) (newline)

(display (tree->list-1 c)) (newline)
(display (tree->list-2 c)) (newline)

#|
1) 对同一个树，两个函数的结果相同
  对中序遍历相同，但是结构不同的树，两个函数的结果也相同，都生成同一个list
2) 函数一使用append，复杂度为O(n2)，函数二使用cons，复杂度为O(n)
|#

(exit)
