; set 是一个不重复升序集合

; x 是否在 set 中
(define (element-of-set? x set)
  (cond ((null? set) #f)
    ((= x (car set)) #t)
    ((< x (car set)) #f)
    (else (element-of-set? x (cdr set))))
)

; 将 x 添加到 set 中
(define (adjoin-set x set)
  (cond ((null? set) (list x))
    ((= x (car set)) set)
    ((< x (car set)) (cons x set))
    (else (cons (car set) (adjoin-set x (cdr set)))))
)

; 取两个 set 的交集
(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
    '()
    (let ((e1 (car set1))
          (e2 (car set2)))
      (cond ((= e1 e2) (cons e1 (intersection-set (cdr set1) (cdr set2))))
            ((< e1 e2) (intersection-set (cdr set1) set2))
            (else (intersection-set set1 (cdr set2))))))
)

; 取两个升序 set 的并集
(define (union-set set1 set2)
  (cond ((and (null? set1) (null? set2)) '())
        ((null? set1) set2)
        ((null? set2) set1)
        (else
          (let ((e1 (car set1))
                (e2 (car set2)))
            (cond ((= e1 e2) (cons e1 (union-set (cdr set1) (cdr set2))))
                  ((< e1 e2) (cons e1 (union-set (cdr set1) set2)))
                  ((> e1 e2) (cons e2 (union-set set1 (cdr set2))))))))
)
