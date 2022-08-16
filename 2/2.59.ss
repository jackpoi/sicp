(load "D:/projects/mine/sicp/2/lib/set.ss")

(define (union-set set1 set2)
  (define (iter set res)
    (if (null? set) res
      (if (element-of-set? (car set) res)
        (iter (cdr set) res)
        (iter (cdr set) (cons (car set) res)))
  ))

  ; (cons (car set) res) 结果的顺序是相反的，再对结果逆序一下
  (reverse (iter (append set1 set2) '()))
)

(define x (list 1 3 2))
(define y (list 3 4 5))

(display (union-set x y))

(exit)
