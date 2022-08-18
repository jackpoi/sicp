(load "D:/projects/mine/sicp/2/lib/huffman.ss")

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree)))
)

#|
在霍夫曼树中寻找指定的字符，不断判断是否在左子树或右子树中
如果在左子树中，就拼接0
如果在右子树中，就拼接1
|#
(define (encode-symbol symbol tree)
  (cond ((leaf? tree) '())
        ((symbol-in-tree? symbol (left-branch tree))
          (cons 0 (encode-symbol symbol (left-branch tree))))
        ((symbol-in-tree? symbol (right-branch tree))
          (cons 1 (encode-symbol symbol (right-branch tree))))
        (else (error "not find symbol: " symbol)))
)

; 霍夫曼树的非叶子节点都存着其子树的字符集，判断给定字符是否在字符集中
(define (symbol-in-tree? symbol tree)
  (> (length (filter (lambda (s) (eq? s symbol)) (symbols tree))) 0)
)

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree (make-leaf 'B 2)
                                  (make-code-tree (make-leaf 'D 1)
                                                  (make-leaf 'C 1))))
)

(define sample-message '(A D A B B C A))

; shoule be (0 1 1 0 0 1 0 1 0 1 1 1 0)
(display (encode sample-message sample-tree))

(exit)
