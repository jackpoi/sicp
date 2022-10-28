(load "D:/projects/mine/sicp/3/lib/stream.ss")

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
;  i   = 1  2  3  4   5   6   7   8   9   10  11  12  13  14   15   16   17   18   19   20
;  seq = 1  3  6  10  15  21  28  36  45  55  66  78  91  105  120  136  153  171  190  210

; 定义 seq 时，流只有 1 被求值
(display-line sum)

; 定义 y 时，要保留偶数，1、3 被过滤，6 是第一个遇到的非偶数，停止求值
(define y (stream-filter even? seq))
(display-line sum)

; 定义 x 时，要保留 5 的倍数，前三个被记忆的数1、3、6不符合，接着向后，10 符合，停止求值
(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq))
(display-line sum)

; 下标从0开始，获取 y 的第(7+1)个元素，会迫使 y 被求值，y 又迫使 seq 求值，y 保留偶数，
; 也就是 y 会保留 2 4 6 8 10 12 14 16，seq 会求值到 136，停止求值
(stream-ref y 7)
(display-line sum)
(display "---")

; 遍历 seq 中的所有元素
(display-stream z)
(display "---")
(display-line sum)

(exit)
