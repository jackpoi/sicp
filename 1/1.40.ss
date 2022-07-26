(load "D:/projects/mine/sicp/1/lib/fixed-point.ss")

(define dx 0.00001)

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))
)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x))))
)

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess)
)

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a (* x x)) (* b x) c))
)

(display (newtons-method (cubic 3 2 1) 1.0))
(exit)
