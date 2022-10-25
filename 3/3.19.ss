#|
使用快慢指针，一个步长为 2，一个步长为 1，如果有环，快慢指针肯定会相遇
|#
(define (cycle? x)
  (define (iter s f)
    (let ((slow (walk 1 s))
          (fast (walk 2 f)))
      (cond ((or (null? slow) (null? fast))
              #f)
            ((eq? slow fast)
              #t)
            (else
              (iter slow fast))))
  )
  (iter x x)
)

; 跳过表 x 的前 step 个节点，返回剩下的节点形成的表
(define (walk step x)
  (cond ((null? x)
          '())
        ((= step 0)
          x)
        (else
          (walk (- step 1) (cdr x))))
)

(display (cycle? (list 1 2 3))) (newline)

(define cycle (list 1 2 3))
(set-cdr! (last-pair cycle) cycle)

(display (cycle? cycle)) (newline)

(exit)
