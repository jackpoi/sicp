(load "D:/projects/mine/sicp/1/lib/power.ss")

(define (f g) (g 2))

(display (f square))
(newline)
(display (f (lambda (z) (* z (+ z 1)))))
(newline)
(display (f f))
; 出错，因为f内部会调用g(2)，f(f)也就会调用f(2)，而f接收的参数是过程，2不是过程

(exit)
