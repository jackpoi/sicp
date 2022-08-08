(load "D:/projects/mine/sicp/2/lib/accumulate.ss")

; 点积 (1 2 3)*(2 3 4)=1*2 + 2*3 + 3*4=2+6+12=20
(define (dot-product v w)
  (accumulate + 0 (map * v w))
)

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define v (list 1 2 3 4))

(display m) (newline)
(display v) (newline)

; 让向量v跟矩阵m的每一行进行点积
(define (matrix-vector m v)
  (map (lambda (col) (dot-product col v)) m)
)

(display (matrix-vector m v)) (newline)

; 旋转矩阵
(define (transpose mat)
  (accumulate-n cons '() mat)
)

(display (transpose m)) (newline)

; 矩阵乘法
(define (matrix-matrix m n)
  (let ((cols (transpose n)))
    ; 让m的行和n的列相乘，n已经旋转过了，n的列就是旋转后的行
    (map
      (lambda (col-of-m) (matrix-vector cols col-of-m))
      m)
  )
)

(define n (list (list 1) (list 2) (list 3) (list 4)))

(display n) (newline)
(display (transpose n)) (newline)
(display (matrix-matrix m n))

(exit)
