(load "D:/projects/mine/sicp/3/lib/stream.ss")
(load "D:/projects/mine/sicp/1/lib/power.ss")

(define (weight i j)
  (+ (cube i) (cube j)))

(define p (weighted-pairs integers integers weight))

(define (pair-weight p)
  (weight (car p) (cdr p)))

(define (generate-ramanujan pairs)
  (let ((first (stream-car pairs))
        (second (stream-car (stream-cdr pairs))))
    (if (= (pair-weight first) (pair-weight second)) ; 寻找前后两个相邻的具有相同权重的序对
      (begin
        ; (display first)
        ; (display second)
        ; (display (pair-weight first))
        ; (newline)
        (cons-stream (pair-weight first)
                     (generate-ramanujan (stream-cdr pairs))))
      (generate-ramanujan (stream-cdr pairs)))))

(define ramanujan-number (generate-ramanujan p))

(display (stream-head ramanujan-number 5))

(exit)
