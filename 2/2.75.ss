; 模长 r 幅角 a
(define (make-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? op 'real-part) (* r (cos a)))
          ((eq? op 'imag-part) (* r (sin a)))
          ((eq? op 'magnitude) r)
          ((eq? op 'angle) a)
          (else (error "unsupported op --in make-from-mag-ang" op)))
  )
  dispatch
)

(define c (make-from-mag-ang 3 4))

; 返回的是 dispatch 这个过程，也就是 c 就是 dispatch
; -1.960930862590836
(display (c 'real-part)) (newline)
; -2.2704074859237844
(display (c 'imag-part)) (newline)
; 3
(display (c 'magnitude)) (newline)
; 4
(display (c 'angle)) (newline)

(exit)
