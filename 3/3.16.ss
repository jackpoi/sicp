(define (count-pairs x)
  (if (not (pair? x))
    0
    (+ (count-pairs (car x))
       (count-pairs (cdr x))
       1))
)

(define p3 (cons 'c '()))
(define p2 (cons 'b p3))
(define p1 (cons 'a p2))
#|
1+(0,1+(0,1))=3
p1(car, cdr) -> p2(car, cdr) -> p3(car, cdr)
    │    │       ↑  │    │       ↑  │    │
    ↓    ┕━━━━━━━┙  ↓    ┕━━━━━━━┙  ↓    ↓
    a               b               c    ()
|#
(display (count-pairs p1)) (newline)

(define p3 (cons 'a '()))
(define p2 (cons p3 '()))
(define p1 (cons p2 p3))
#|
1+(1+(1,0),1)=4
p1(car, cdr) -> p3(car, cdr)
    1    │       ↑↑ ↓    ↓
    ↓    ┕━━━1━━━┙│ a   ()
    p2(car, cdr)  │
        ┕━━━━1━━━━┙
|#
(display (count-pairs p1)) (newline)

(define p3 (cons 'a '()))
(define p2 (cons p3 p3))
(define p1 (cons p2 p2))
#|
1+(1+(1,1),1+(1,1))=7
p1(car, cdr)
┍━━━┙    │
│┍━━━━━━━┙
↓↓
p2(car, cdr)
┍━━━┙    │
│┍━━━━━━━┙
↓↓
p3(car, cdr)
    ↓    ↓
    a    ()
|#
(display (count-pairs p1)) (newline)

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x
)
(define p3 (cons 'c '()))
(define p2 (cons 'b p3))
(define p1 (cons 'a p2))
(define cycle (make-cycle p1))
#|
1+(0,1+(0,1+(0,1+(0,1+...))))=∞
 ┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
 ↓                                       │
p1(car, cdr) -> p2(car, cdr) -> p3(car, cdr)
    │    │       ↑  │    │       ↑  │    │
    ↓    ┕━━━━━━━┙  ↓    ┕━━━━━━━┙  ↓    ↓
    a               b               c    ()
|#
(display (count-pairs cycle)) (newline)

(exit)
