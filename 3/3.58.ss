(load "D:/projects/mine/sicp/3/lib/stream.ss")

#|
expand 作用是将小于 1 的分数转化成小数，其中 num 就是分子，den 就是分母，radix 就是小数的进制
结果产生的流就是小数的数列
|#
(define (expand num den radix)
  (cons-stream
    (quotient (* num radix) den)
    (expand (remainder (* num radix) den) den radix)))

(display (stream-head (expand 1 7 10) 20)) (newline)
(display (stream-head (expand 3 8 10) 20)) (newline)
; 小数部分为 011 : 0+1*2^-1+1*2^-2=0+1/4+1/8=3/8
(display (stream-head (expand 3 8 2) 20)) (newline)

(exit)
