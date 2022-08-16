; set 是一个不重复集合

; x 是否在 set 中
(define (element-of-set? x set)
  (cond ((null? set) #f)
    ((equal? x (car set)) #t)
    (else (element-of-set? x (cdr set))))
)

; 将 x 添加到 set 中
(define (adjoin-set x set)
  (if (element-of-set? x)
    set
    (cons x set))
)

; 取两个 set 的交集
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
    ((element-of-set? (car set1) set2)
      (cons (car set1) (intersection-set (cdr set1) set2)))
    (else (intersection-set (cdr set1) set2)))
)
