(load "D:/projects/mine/sicp/2/lib/tree.ss")

(define (lookup given-key tree-of-records)
  (if (null? tree-of-records)
    '()
    (let ((k (key (entry tree-of-records))))
      (cond ((equal? given-key k) (entry tree-of-records))
            ((> given-key k) (lookup given-key (right-branch tree-of-records)))
            ((< given-key k) (lookup given-key (left-branch tree-of-records))))))
)

#|
如果树为空，返回空节点
如果给定值等于当前根节点值，就返回根节点
如果给定值小于当前根节点值，继续跟根节点的左子树进行比较
如果给定值大于当前根节点值，继续跟根节点的右子树进行比较
|#
