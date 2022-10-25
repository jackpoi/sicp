#|
构建一个 temp list
判断遇到的序对 x 是否存在于 temp 中
如果不存在，就放入 temp ，接着遍历 x 的 car 和 cdr
最后 temp 的长度就是序对的个数
|#
(define (count-pairs x)
  (length (inner x '()))
)

(define (inner x temp)
  (if (and (pair? x) (not (memq x temp)))
    (inner (car x) (inner (cdr x) (cons x temp)))
    temp)
)

(define p3 (cons 'c '()))
(define p2 (cons 'b p3))
(define p1 (cons 'a p2))
(display (count-pairs p1)) (newline)

(define p3 (cons 'a '()))
(define p2 (cons p3 '()))
(define p1 (cons p2 p3))
(display (count-pairs p1)) (newline)

(define p3 (cons 'a '()))
(define p2 (cons p3 p3))
(define p1 (cons p2 p2))
(display (count-pairs p1)) (newline)

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x
)
(define p3 (cons 'c '(1 2)))
(define p2 (cons 'b p3))
(define p1 (cons 'a p2))
(define cycle (make-cycle p1))
(display (count-pairs cycle)) (newline)

(exit)
