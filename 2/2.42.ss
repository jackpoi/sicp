(load "D:/projects/mine/sicp/2/lib/enumerate.ss")
(load "D:/projects/mine/sicp/2/lib/flatmap.ss")

(define (queens board-size)
  (define (queens-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                (adjoin-position new-row k rest-of-queens))
               (enumerate-interval 1 board-size)))
          (queens-cols (- k 1))
        )
      ))
  )
  (queens-cols board-size)
)

(define empty-board '())

; 皇后的列表是逆序的
; 添加新皇后，皇后所在位置的行列由列表的索引和值组成，不需要k
(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens)
)

; 判断最上面一行的皇后所在位置是否安全
(define (safe? k position)
  (iter-check (car position) (cdr position) 1)
)

(define (iter-check row-of-new-queen rest-of-queens i)
  (if (null? rest-of-queens)
    #t
    (let ((row-of-current-queen (car rest-of-queens)))
      (if (or (= row-of-new-queen row-of-current-queen)
              (= row-of-new-queen (+ row-of-current-queen i))
              (= row-of-new-queen (- row-of-current-queen i)))
        #f
        (iter-check row-of-new-queen (cdr rest-of-queens) (+ i 1))
      ))
  )
)

(define (format q)
  (for-each
    (lambda (x)
      (begin
        (display x)
        (newline))
    )
    q)
)

(display (format (queens 8)))

(exit)
