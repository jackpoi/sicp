(load "D:/projects/mine/sicp/2/lib/huffman.ss")

(define pairs '((A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1)))
(define tree (generate-huffman-tree pairs))

; 生成通过 pairs 生成的霍夫曼树 tree 的叶子节点及其对应的编码
(define (huffman-leafs pairs tree)
  (map
    (lambda (pair)
      (let ((c (car pair)))
        (cons c (encode-symbol c tree))))
    pairs)
)

(display (huffman-leafs pairs tree)) (newline)

(display (encode '(GET A JOB) tree)) (newline)
(display (encode '(SHA NA NA NA NA NA NA NA NA) tree)) (newline)
(display (encode '(GET A JOB) tree)) (newline)
(display (encode '(SHA NA NA NA NA NA NA NA NA) tree)) (newline)
(display (encode '(WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP) tree)) (newline)
(display (encode '(SHA BOOM) tree)) (newline)

#|
1) 以上六行字符串编码后的二进制长度为 84
2) 如果使用定长编码，一共有8个符号，至少需要 log2(8)=3 位编码
  以上六行字符串一共有 36 个字符，定长编码最少需要 36x3=108 位长度
  以上字符串使用霍夫曼编码比使用定长编码节省了 108-84=22 位长度
|#

(exit)
