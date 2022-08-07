(load "D:/projects/mine/sicp/2/lib/accumulate.ss")

(define (accumulate-n f init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate f init (car-n seqs))
          (accumulate-n f init (cdr-n seqs))
    ))
)

; 取出多个列表的第一个元素
(define (car-n seqs)
  (map car seqs)
)

; 取出多个列表的后一个元素
(define (cdr-n seqs)
  (map cdr seqs)
)

(define x (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(display (car-n x)) (newline)
(display (cdr-n x)) (newline)
(display (accumulate-n + 0 x))

(exit)
