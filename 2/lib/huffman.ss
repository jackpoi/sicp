; 叶子节点包含字符和权重：(字符，权重)
(define (make-leaf symbol weight)
  (list 'leaf symbol weight)
)

(define (leaf? obj) (eq? (car obj) 'leaf))

(define (symbol-leaf leaf) (cadr leaf))

(define (weight-leaf leaf) (caddr leaf))

; 组合两个节点为树：(左子树，右子树，字符集，权重)
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right)))
)

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  ; 如果是叶子节点，获取叶子节点的字符，如果是树，获取树的字符集
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree))
)

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree))
)

; Huffman 树解码，bits 是一个 01 表，通过霍夫曼树 tree 解码为字符
(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
          (cons (symbol-leaf next-branch)
                (decode-1 (cdr bits) tree))
          (decode-1 (cdr bits) next-branch))))
  )

  (decode-1 bits tree)
)

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit" bit)))
)

; Huffman 树编码，message 是字符串，通过霍夫曼树 tree 编码为 01 表
(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree)))
)

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

; 将形如 (A, 1) (B, 3) 的 pair 按权重升序加入 pairs 中
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set)))))
)

; 将形如 (A, 1) (B, 3) 的 pair 列表转换成一个个叶子
(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair) (cadr pair))
                  (make-leaf-set (cdr pairs)))))
)

; 通过 (字符，权重) list 生成霍夫曼树
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs))
)

(define (successive-merge leaf-set)
  (cond ((= 0 (length leaf-set)) '())
    ((= 1 (length leaf-set)) (car leaf-set))
    (else (let ((left (car leaf-set))
                (right (cadr leaf-set)))
      (successive-merge
        (adjoin-set (make-code-tree left right) (cddr leaf-set))))))
)
