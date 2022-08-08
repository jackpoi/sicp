(load "D:/projects/mine/sicp/2/lib/enumerate.ss")
(load "D:/projects/mine/sicp/2/lib/flatmap.ss")
(load "D:/projects/mine/sicp/1/lib/prime.ss")

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
      (enumerate-interval 1 (- i 1)))
    )
    (enumerate-interval 1 n)
  )
)

(display (unique-pairs 4)) (newline)
(display (unique-pairs 6)) (newline)

(define (prime-sum-prirs n)
  (map
    (lambda (pair) (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
    (filter
      ; 生成不同序对，过滤不是素数的序对
      (lambda (pair) (prime? (+ (car pair) (cadr pair))))
      (unique-pairs n)
    )
  )
)

(display (prime-sum-prirs 6)) (newline)

(exit)
