; 第一次求值会返回参数，并将 f 变为无脑返回 1 的函数
(define f
  (lambda (first)
    (set! f (lambda (second) 1))
    first)
)

; chez scheme 对参数是从左到右的求值顺序
(display (+ (f 0) (f 1))) (newline) ; 0+1=1
(display (+ (f 1) (f 0))) (newline) ; 1+1=2

; 如果是从右到左的求值顺序，两个结果分别会是: 1+1=2; 1+1=2

(exit)
