; 计算指定行列的杨辉三角的值
; 0  1 2 3 col
; 1  ——————→ 
; 2 |   1
; 3 | 1   1
; 4 ↓1  2   1
; row
; (row, col)=(row-1, col-1) + (row-1, col)

(define (yanghui row col)
  (cond ((> col row) 0)
         ((or (= col 0) (= row 0)) 1)
         (else (+ (yanghui (- row 1) (- col 1))
                  (yanghui (- row 1) col)
          ))
  )
)

(display (yanghui 1 1))
(newline)
(display (yanghui 2 1))

(exit)