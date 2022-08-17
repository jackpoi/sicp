; set 是一个允许重复的集合，但是表现为不重复

; x 是否在 set 中
(define (element-of-set? x set)
  (cond ((null? set) #f)
    ((equal? x (car set)) #t)
    (else (element-of-set? x (cdr set))))
)

; 将 x 添加到 set 中
(define (adjoin-set x set)
  (cons x set)
)

; 取两个 set 的交集
(define (intersection-set set1 set2)
  (define (iter set res)
    (if (or (null? set) (null? set2))
      res
      (let ((current (car set))
            (remain (cdr set)))
        ; 需要判断元素是不是也在 set2 中，以及是不是已经放入了 res 中
        (if (and (element-of-set? current set2) (not (element-of-set? current res)))
          (iter remain (cons current res))
          (iter remain res)))
  ))

  (reverse (iter set1 '()))
)

; 取两个 set 的并集
(define (union-set set1 set2)
  (define (iter set res)
    (if (null? set)
      res
      (if (element-of-set? (car set) res)
        (iter (cdr set) res)
        (iter (cdr set) (cons (car set) res))))
  )

  ; (cons (car set) res) 结果的顺序是相反的，需要再对结果逆序一下
  (reverse (iter (append set1 set2) '()))
)

(define x (list 1 3 2 2))
(define y (list 3 4 5 4))

(display (element-of-set? 4 y)) (newline)

(display (adjoin-set 1 x)) (newline)

(display (intersection-set x y)) (newline)

(display (union-set x y)) (newline)

(exit)
