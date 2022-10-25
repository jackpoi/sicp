(load "D:/projects/mine/sicp/3/lib/queue.ss")

; 因为队列内部有两个指针分别指向队头和队尾，自带的打印将两个指针指向的都打印出来了
; 因此打印出来的结果多了队尾指针指向的数据
; 只需要打印队头指针指向的表就可以了
(define (print-queue queue)
  (display (car queue))
)

(define q1 (make-queue))
(insert-queue! q1 'a)
(print-queue q1) (newline)
(insert-queue! q1 'b)
(print-queue q1) (newline)
(delete-queue! q1)
(print-queue q1) (newline)
(delete-queue! q1)
(print-queue q1) (newline)

(exit)
