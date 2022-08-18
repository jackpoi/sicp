(load "D:/projects/mine/sicp/2/lib/huffman.ss")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs))
)

#|
根据权重升序排列的叶子，将最小的两个合并为树，再将根节点按顺序加入 leaf-set
如果set中为空，返回一个空表
如果set中只有一个叶子，不需要再组合，返回这个节点
如果set中的叶子大于等于2个，说明还需要进行组合
|#
(define (successive-merge leaf-set)
  (cond ((= 0 (length leaf-set)) '())
    ((= 1 (length leaf-set)) (car leaf-set))
    (else (let ((left (car leaf-set))
                (right (cadr leaf-set)))
      (successive-merge
        (adjoin-set (make-code-tree left right) (cddr leaf-set))))))
)

(display (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))

(exit)
