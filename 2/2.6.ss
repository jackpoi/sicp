; λf->λx->x
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x))))
)

; 显示计数
(define (show-num n)
  ((n (lambda (x) (+ 1 x))) 0)
)

(display (show-num zero))
(newline)
(display (show-num (add-1 zero)))
(newline)
(display (show-num (add-1 (add-1 zero))))

; one = (add-1 zero)
; => λf->λx->f((n(f))(x)), n=zero=>λf->λx->x
; => λf->λx->f((λx->x)(x))
; => λf->λx->f(x)
(define (one)
  (lambda (f) (lambda (x) (f x)))
)

(newline)
(display (show-num (one)))

; two = (add-1 one)
; => λf->λx->f((n(f))(x)), n=one=>λf->λx->f(x)
; => λf->λx->f((λx->f(x))(x))
; => λf->λx->f(f(x))
(define (two)
  (lambda (f) (lambda (x) (f (f x))))
)

(newline)
(display (show-num (two)))

; 0: λf->λx->x
; 1: λf->λx->f(x)
; 2: λf->λx->f(f(x))
; 猜测往后就是对x进行f函数的嵌套
(define (three)
  (lambda (f) (lambda (x) (f (f (f x))))) ; λf->λx->f(f(f(x)))
)
(newline)
(display (show-num (three)))
(define (four)
  (lambda (f) (lambda (x) (f (f (f (f x)))))) ; λf->λx->f(f(f(f(x))))
)
(newline)
(display (show-num (four)))

; 那么add相加就是和的次数的嵌套，如two+three就是5次的嵌套
(define (add)
    (lambda (m)
        (lambda (n)
            (lambda (f)
                (lambda (x)
                    (m f (n f x))
                ))))
)

(exit)
