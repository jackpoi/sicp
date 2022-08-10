(define (memq item x)
  (cond ((null? x) #f)
    ((eq? item (car x)) x)
    (else (memq item (cdr x)))
  )
)

(display (list 'a 'b 'c)) ; (a b c)，相当于'(a b c)

(newline)
(display (list (list 'george))) ; ((george))

(newline)
(display (cdr '((x1 x2) (y1 y2)))) ; ((y1 y2))，相当于(cdr ((x1 x2) (y1 y2)))

(newline)
(display (cadr '((x1 x2) (y1 y2)))) ; y1

(newline)
(display (pair? (car '(a short list)))) ; #f

(newline)
(display (memq 'red '((red shoes) (blue socks)))) ; #f

(newline)
(display (memq 'red '(red shoes blue socks))) ; (red shoes blue socks),(car (red shoes blue socks))=red eq? red

(exit)
