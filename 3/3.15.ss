(define (set-to-wow! x)
  (set-car! (car x) 'wow)
  x
)

(define x (list 'a 'b))
(define z1 (cons x x))
#|
z1=> (car, cdr)
        ↓   ↓
  x=> (car, cdr)
        ↓    └→ (car, cdr)
        a         ↓    ↓
                  b    ()
|#
(set-to-wow! z1)
#|
(set-to-wow! z1)=>(set-car! (car z1) 'wow)=>(set-car! x 'wow)
=>(set-car! (list 'a 'b) 'wow)=> x->('wow 'b)
=>
z1=> (car, cdr)
        ↓   ↓
  x=> (car, cdr)
        ↓    └→ (car, cdr)
       wow        ↓    ↓
                  b    ()
z1=>(cons x x)=>(cons ('wow 'b) ('wow 'b))
  =>((wow b) wow b)
|#

(define z2 (cons (list 'a 'b) (list 'a 'b)))
#|
z2=> (car, cdr)
       │    └─→ (car, cdr)
       │          │    └→ (car, cdr)
       │          ↓         ↓    ↓
       │          a         b    ()
       │          ↑         ↑    ↑
       │          │    ┌→ (car, cdr)
       └──────→ (car, cdr)
|#
(set-to-wow! z2)
#|
(set-to-wow! z2)=>(set-car! (car z2) 'wow)
=>(set-car! (list 'a 'b) 'wow)
=>
z2=> (car, cdr)
       │    └─→ (car, cdr)
       │          │    └→ (car, cdr)
       │          ↓         ↓    ↓
       │          a         b    ()
       │                    ↑    ↑
       │               ┌→ (car, cdr)
       └──────→ (car, cdr)
                  ↓
                 wow
z2=>(cons (list 'wow 'b) (list 'a 'b))
  =>((wow b) a b)
|#
