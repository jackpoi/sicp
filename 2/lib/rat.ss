; 有理数

; n:分子 d:分母 (n d)
(define (make-rat n d)
  (let ((g (gcd n d)))
    ; 通过最大公约数化简分子分母
    (cons (/ n g) (/ d g))
  )
)
; 获取x的分子car(x) -> car(n d) -> n
(define (numer x) (car x))
; 获取x的分母cdr(x) -> cdr(n d) -> d
(define (denom x) (cdr x))

; 运算
; x+y=nx/dx + ny/dy = (nxdy+nydx)/dxdy
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))
  )
)
; x-y=nx/dx - ny/dy = (nxdy-nydx)/dxdy
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))
  )
)
; x*y=nx/dx * ny/dy = nxny/dxdy
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))
  )
)
; x/y=nx/dx / ny/dy = nx/dx * dy/ny = nxdy/dxny
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))
  )
)
; x=y? -> nx/dx = ny/dy? -> nxdy = dxny
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y)))
)
; 打印 x=n/d
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
)
