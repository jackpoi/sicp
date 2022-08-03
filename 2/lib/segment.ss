(load "D:/projects/mine/sicp/1/lib/power.ss")

; 点的构造函数
(define (make-point x y)
  (cons x y)
)
; x
(define (x-point p) (car p))
; y
(define (y-point p) (cdr p))

; 线段的构造函数
(define (make-segment start end)
  (cons start end)
)
; 起点
(define (start-segment segment) (car segment))
; 终点
(define (end-segment segment) (cdr segment))

; 线段的长度 a2+b2=c2
(define (segment-length segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    ; sqrt((x2-x1)^2 + (y2-y1)^2)
    (sqrt (+ (square (- (x-point end) (x-point start)))
             (square (- (y-point end) (y-point start)))
          ))
  )
)

(define (printf-point p)
  (newline)
  (print-point p)
)

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")")
)

(define (printf-segment s)
  (newline)
  (print-segment s)
)

(define (print-segment s)
  (let ((start (start-segment s))
        (end (end-segment s)))
    (begin
      (print-point start)
      (display "->")
      (print-point end))
  )
)
