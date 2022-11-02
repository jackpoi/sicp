(load "D:/projects/mine/sicp/3/lib/stream.ss")
(load "D:/projects/mine/sicp/1/lib/power.ss")

#|
先求出二元序列流，再对二元序列流和整数流组合
|#

(define (triples s t u)
  (cons-stream
    (list (stream-car s) (stream-car t) (stream-car u))
    (interleave
      (stream-map (lambda (x) (cons (stream-car s) x)) (pairs t (stream-cdr u)))
      (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define t (triples integers integers integers)) (newline)
; (display (stream-head t 20))

; p=(i j k)
(define (pythagoras? p)
  (= (+ (square (car p))
        (square (cadr p)))
     (square (caddr p))))

(define triangles (stream-filter pythagoras? t))
(display (stream-head triangles 3))

(exit)
