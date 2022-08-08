(load "D:/projects/mine/sicp/2/lib/accumulate.ss")
(load "D:/projects/mine/sicp/2/lib/enumerate.ss")
(load "D:/projects/mine/sicp/2/lib/flatmap.ss")

(define (unique-triple n)
  (flatmap
    (lambda (i)
      ; 跟不同的二元组组合
      (map
        (lambda (j) (cons i j))
      (unique-pairs (- i 1)))
    )
    (enumerate-interval 1 n)
  )
)

(display (unique-triple 3)) (newline)
(display (unique-triple 4)) (newline)

; 三元组p的和是否与s相等
(define (triple-equal? triple sum)
  ; triple: (3 2 1) => (3 (2 (1 nil)))
  (= sum (accumulate + 0 triple))
)

(define (f n s)
  (filter
    (lambda (p) (triple-equal? p s))
    (unique-triple n)
  )
)

(display (f 6 8)) (newline)
(display (f 8 10)) (newline)

(exit)
