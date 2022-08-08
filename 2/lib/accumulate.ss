(define (accumulate f initial sequence)
  (if (null? sequence)
    initial
    (f (car sequence) (accumulate f initial (cdr sequence))))
)

(define (accumulate-n f init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate f init (car-n seqs))
          (accumulate-n f init (cdr-n seqs))
    ))
)

; 取出多个列表的第一个元素
(define (car-n seqs)
  (map car seqs)
)

; 取出多个列表的后一个元素
(define (cdr-n seqs)
  (map cdr seqs)
)

(define fold-right accumulate)

(define (fold-left f initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (f result (car rest)) (cdr rest)))
  )
  (iter initial sequence)
)
