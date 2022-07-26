(define (cont-frac N D k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (N i) (+ (D i) result)))
    )
  )
  (iter (- k 1) (/ (N k) (D k)))
)

; Ni全是1
; Di: 1 2 1 1 4 1 1 6 1 1  8  ...
;  i: 1 2 3 4 5 6 7 8 9 10 11 ...
; 当(i+1)%3==0时，Di=(i/3 + 1)*2，否则Di=1
(define (e k)
  (define (N i) 1)
  (define (D i)
    (if (= 0 (remainder (+ i 1) 3))
      (* 2 (+ 1 (floor (/ i 3))))
      1)
  )
  (+ 2.0 (cont-frac N D k))
)

(display (e 1))
(newline)
(display (e 2))
(newline)
(display (e 5))
(newline)
(display (e 10))
(newline)
(display (e 100))
(newline)

(exit)
