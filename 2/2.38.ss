(load "D:/projects/mine/sicp/2/lib/accumulate.ss")

(define fold-right accumulate)

(define (fold-left f initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (f result (car rest)) (cdr rest)))
  )
  (iter initial sequence)
)

(define x (list 2 3 4))

; 8/3 : 2/(3/(4/1))
(display (fold-right / 1 x)) (newline)
; 1/24 : ((1/2)/3)/4
(display (fold-left / 1 x)) (newline)
; (2 (3 (4 ())))
(display (fold-right list '() x)) (newline)
; (((() 2) 3) 4)
(display (fold-left list '() x)) (newline)

(exit)
