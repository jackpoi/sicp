(load "D:/projects/mine/sicp/1/lib/power.ss")

(define (cont-frac N D k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (N i) (+ (D i) result)))
    )
  )
  (iter (- k 1) (/ (N k) (D k)))
)

;  i: 1   2   3   4   5 ...
; Di: 1   3   5   7   9 ...
; Ni: x -x2 -x2 -x2 -x2 ...
(define (tan-cf x k)
  ; 2i-1
  (define (D i) (- (* i 2) 1))
  (define (N i)
    (if (= i 1)
      x
      (-(square x)) ; -x2
    )
  )

  (inexact (cont-frac N D k))
)
(display (tan 10))
(newline)
(display (tan-cf 10 20))
(newline)
(display (tan-cf 10 30))
(newline)

(newline)
(display (tan 30))
(newline)
(display (tan-cf 30 20))
(newline)
(display (tan-cf 30 30))
(newline)
(display (tan-cf 30 50))
(newline)
(display (tan-cf 30 100))

(exit)
