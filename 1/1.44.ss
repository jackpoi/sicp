(load "D:/projects/mine/sicp/1/lib/power.ss")
(define(repeated f n)
  (if (= 1 n)
    f
    (lambda (x)
      (f ((repeated f (- n 1)) x))
    )
  )
)

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    ; f1=f(x-dx) f2=f(x) f3=f(x+dx) smooth(f)=(f1+f2+f3)/3
    (let ((f1 (f (- x dx))) (f2 (f x)) (f3 (f (+ x dx))))
      (/ (+ f1 f2 f3) 3))
  )
)

(define (smooth-n f n)
  ((repeated smooth n) f)
)

(display ((smooth square) 5))
(newline)
(display ((smooth-n square 10) 5))

(exit)
