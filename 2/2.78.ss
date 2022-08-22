; 输入数字时直接返回数字，不添加tag
(define (attach-tag type-tag contents)
  (if (number? contents)
    contents
    (cons type-tag contents))
)

; datumn : (tag contents)
; contents : (...param)

; 输入数字时返回'scheme-number，不然才返回tag
(define (type-tag datumn)
  (cond ((number? datumn) 'scheme-number)
        ((pair? datumn) (car datumn))
        (else (error "datumn wrong tag" datumn)))
)

; 输入数字时直接返回
(define (contents datumn)
  (cond ((number? datumn) datumn)
        ((pair? datumn) (cdr datumn))
        (else (error "datumn wrong contents" datumn)))
)

; 前面的代码太长了，就不验证了……
