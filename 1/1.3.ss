; 两数之和
(define (sum x y) (+ x y))

(define (sum_bigger a b c)
  (cond ((and (> a b) (> b c)) (sum a b))
    ((and (> b c) (> c a)) (sum b c))
    ((and (> c a) (> a b)) (sum c a))))

(display (sum_bigger 2 5 3))
(exit)
