(load "D:/projects/mine/sicp/2/lib/accumulate.ss")

; 对seq进行map，将每个元素通过proc处理，将结果拼接成list
(define (flatmap proc seq)
  (accumulate append '() (map proc seq))
)
