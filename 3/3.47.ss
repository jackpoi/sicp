(load "D:/projects/mine/sicp/3/lib/mutex.ss")
#|
semaphore 设置一个计数器，获取锁计数器-1，释放锁计数器+1，计数器为0就阻塞获取，循环一直等到计数器>0为止
|#

; 1) 基于互斥元，在 semaphore 内部维持一个互斥元(锁)，在计数器发生修改的时候加锁，修改完毕释放锁，保证了计数器的正确性
(define (make-semaphore n)
  (let ((mutex (make-mutex)))
    (define (acquire)
      (mutex 'acquire)
      (if (> n 0)
        (begin (set! n (- n 1))
          (mutex 'release)
          'ok)
        (begin (mutex 'release) ; 先释放内部的锁，再去执行递归尝试获取信号量
          (acquire)))
    )
    (define (release)
      (mutex 'acquire)
      (set! n (+ n 1))
      (mutex 'release)
      'ok
    )
    (define (dispatch m)
      (cond ((eq? m 'acquire)
              (acquire))
            ((eq? m 'release)
              (release))
            (else
              (error "Unknown mode MAKE-SEMAPHORE" mode)))
    )
    dispatch
  )
)

(define s (make-semaphore 5))
(display (s 'acquire)) (newline)
(display (s 'acquire)) (newline)
(display (s 'acquire)) (newline)
(display (s 'acquire)) (newline)
; (display (s 'acquire)) (newline)
; (display "block") (newline)
(display (s 'release)) (newline)
(display (s 'acquire)) (newline)
(display "non block") (newline)

(display "------------") (newline)

; 2) 基于原子的 test-and-set! ，通过 test-and-set! 修改计数器，只需要保证 test-and-set! 的正确性就可以了
(define (make-semaphore n)
  (define (acquire)
    (if (test-and-set! n)
      (acquire) ; retry
      'ok)
  )
  (define (release)
    (set! n (+ n 1))
    'ok
  )
  (define (dispatch m)
    (cond ((eq? m 'acquire)
            (acquire))
          ((eq? m 'release)
            (release))
          (else
            (error "Unknown mode MAKE-SEMAPHORE" mode)))
  )
  dispatch
)

(define (test-and-set! n)
  (if (= n 0)
    #t
    (begin (set! n (- n 1))
      #f))
)

(define s (make-semaphore 5))
(display (s 'acquire)) (newline)
(display (s 'acquire)) (newline)
(display (s 'acquire)) (newline)
(display (s 'acquire)) (newline)
; (display (s 'acquire)) (newline)
; (display "block") (newline)
(display (s 'release)) (newline)
(display (s 'acquire)) (newline)
(display "non block") (newline)

(exit)
