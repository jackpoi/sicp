(define (make-mutex)
  (let ((cell (list #f)))
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
              (if (test-and-set! cell)
                (the-mutex 'acquire))) ; 重试
            ((eq? m 'release) (clear! cell)))
    )
    the-mutex
  )
)

(define (clear! cell)
  (set-car! cell #f)
)

(define (test-and-set! cell)
  (if (car cell)
    #t
    (begin (set-car! cell #t)
      #f))
)
