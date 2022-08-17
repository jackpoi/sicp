(load "D:/projects/mine/sicp/2/lib/tree.ss")

(define (list->tree elements)
  (car (partial-tree elements (length elements)))
)

(define (partial-tree elts n)
  (if (= n 0)
    (cons '() elts)
    (let ((left-size (quotient (- n 1) 2)))
      (let ((left-result (partial-tree elts left-size)))
        (let ((left-tree (car left-result))
              (non-left-elts (cdr left-result))
              (right-size (- n (+ left-size 1))))
          (let ((this-entry (car non-left-elts))
                (right-result (partial-tree (cdr non-left-elts) right-size)))
            (let ((right-tree (car right-result))
                  (remaining-elts (cdr right-result)))
              (cons (make-tree this-entry left-tree right-tree) remaining-elts)))))))
)

#|
1)
(5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
             5
        1        9
    '()   3    7   11

2) O(n)
|#
(display (list->tree '(1 3 5 7 9 11)))

(exit)
