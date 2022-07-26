; 递归版
(define (cont-frac N D k)
  (define (cf i)
    (if (= k i) (/ (N k) (D k))
      (/ (N i) (+ (D i) (cf (+ i 1))))
    )
  )
  (cf 1)
)

(define (golden-ratio k)
  (+ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k))
)

(display (golden-ratio 1))
(newline)
(display (golden-ratio 10))
(newline)
(display (golden-ratio 11))
(newline)
(display (golden-ratio 12))
(newline)

; 迭代版
(define (cont-frac2 N D k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (N i) (+ (D i) result)))
    )
  )
  (iter (- k 1) (/ (N k) (D k)))
)

(define (golden-ratio2 k)
  (+ 1 (cont-frac2 (lambda (i) 1.0) (lambda (i) 1.0) k))
)

(display (golden-ratio2 1))
(newline)
(display (golden-ratio2 10))
(newline)
(display (golden-ratio2 11))
(newline)
(display (golden-ratio2 12))
(newline)

(exit)
