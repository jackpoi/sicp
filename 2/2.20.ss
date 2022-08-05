(define (same-parity . w)
  (if (null? w)
    w
    (if (odd? (car w))
        (same-odd w '())
        (same-even w '()))
))

; 当长度为 0 时说明已经遍历完了，返回结果
(define (same-odd l res)
  (cond ((= 0 (length l)) res)
    ((odd? (car l)) (same-odd (cdr l) (append res (list (car l)))))
    (else (same-odd (cdr l) res)))
)

(define (same-even l res)
  (cond ((= 0 (length l)) res)
    ((even? (car l)) (same-even (cdr l) (append res (list (car l)))))
    (else (same-even (cdr l) res)))
)

(display (same-parity 1 2 3 7 8))
(newline)
(display (same-parity 2 3 4 8 9))

(exit)
