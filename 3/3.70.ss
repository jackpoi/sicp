(load "D:/projects/mine/sicp/3/lib/stream.ss")

(define (merge-weighted s t weight)
  (cond ((stream-null? s) t)
        ((stream-null? t) s)
        (else
          (let ((scar (stream-car s))
                (tcar (stream-car t)))
            (if (> (weight (car scar) (cdr scar))
                   (weight (car tcar) (cdr tcar))) ; 如果 scar 较大，就将其放到后面
                    (cons-stream tcar (merge-weighted s (stream-cdr t) weight))
                    (cons-stream scar (merge-weighted (stream-cdr s) t weight)))))))

(define (weighted-pairs s t weight)
  (cons-stream
    (cons (stream-car s) (stream-car t))
    (merge-weighted
      (stream-map (lambda (x) (cons (stream-car s) x)) (stream-cdr t))
      (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
      weight)))

(define p1 (weighted-pairs integers integers +))
(display (stream-head p1 10)) (newline)

(display "---------------------") (newline)

(define (not-divisible? dividend divisor)
  (not (= 0 (remainder dividend divisor))))

(define (compound-not-divisible? dividend x y z)
  (and (not-divisible? dividend x)
      (not-divisible? dividend y)
      (not-divisible? dividend z)))

(define filtered-integers
  (stream-filter (lambda (x) (compound-not-divisible? x 2 3 5)) integers))

(define p2 (weighted-pairs filtered-integers filtered-integers (lambda (i j) (+ (* 2 i) (* 3 j) (* 5 i j)))))
(display (stream-head p2 10)) (newline)

(display "---------------------") (newline)

(define p (pairs integers integers))
(display (stream-head p 20))

(exit)
