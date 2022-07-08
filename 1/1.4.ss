; 如果b > 0返回+，也就是a + b
; 否则返回-，也就是a - b
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b)
)
