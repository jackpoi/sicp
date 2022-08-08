; 枚举指定区间内的数
(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high))
  )
)

; 1 <= j < i <= n
(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
      (enumerate-interval 1 (- i 1)))
    )
    (enumerate-interval 1 n)
  )
)
