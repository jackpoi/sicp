; 生成随机数
(define (rand-update x)
  (let ((a (expt 2 32))
        (c 1103515245)
        (m 12345))
    (modulo (+ (* a x) c) m))
)

; 初始值
(define random-init 137)

(define rand
  (let ((x random-init))
    (define (dispatch m)
      (cond ((eq? m 'generate)
              (begin (set! x (rand-update x)) x))
            ((eq? m 'reset)
              (lambda (new-value) (set! x new-value)))
            (else (error "Unknown request" m)))
    )
    dispatch
  )
)

(display (rand 'generate)) (newline)
(display (rand 'generate)) (newline)
(display (rand 'generate)) (newline)
(display (rand 'generate)) (newline)
(display ((rand 'reset) 1000)) (newline)
(display (rand 'generate)) (newline)
(display (rand 'generate)) (newline)
(display ((rand 'reset) random-init)) (newline)
(display (rand 'generate)) (newline)
(display (rand 'generate)) (newline)

(exit)
