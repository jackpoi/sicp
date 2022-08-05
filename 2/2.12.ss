(load "D:/projects/mine/sicp/2/lib/interval.ss")

(define (make-center-percent center percent)
  (make-center-width center (* center percent))
)

(define (make-center-width center diff)
  (make-interval (- center diff) (+ center diff))
)

(define (percent z)
  (/ (threshold z) (center z))
)

(define (center z)
  (/ (+ (lower-bound z) (upper-bound z)) 2)
)

(define (threshold z)
  (/ (- (upper-bound z) (lower-bound z)) 2)
)

(define z (make-center-percent 5 0.2))

(print-interval z)
(newline)
(display (threshold z))
(newline)
(display (percent z))

(exit)
