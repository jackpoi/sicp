(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

; x=(a b) y=(c d) z=(a b c d)
(display z) (newline)
(display (cdr x)) (newline) ; (b)

(define w (append! x y))

; x=(a b c d) y=(c d) w=(a b c d)
(display w) (newline)
(display (cdr x)) (newline) ; (b c d)

(exit)
