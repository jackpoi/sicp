(define (make-mobile left right)
  (list left right)
)
(define (make-branch length structure)
  (list length structure)
)

; (list x y) => (cons x (y nil)) => (x (y nil))
; ((2 (3 nil)) ((5 (((7 (4 nil)) ((8 (1 nil)) nil)) nil)) nil))
(define x
  (make-mobile
    (make-branch 2 3)
    (make-branch 5
      (make-mobile (make-branch 7 4)
                   (make-branch 8 1))))
)

; a)
(define (left-branch structure)
  (car structure)
)
(define (right-branch structure)
  (cadr structure)
)
(define (branch-length branch)
  (car branch)
)
(define (branch-structure branch)
  (cadr branch)
)

(display x) (newline)
(display (cdr x)) (newline)
(display (left-branch x)) (newline)
(display (right-branch x)) (newline)
(display (branch-length (right-branch x))) (newline)
(display (branch-structure (right-branch x))) (newline)

; b)
(define (total-weight structure)
  (if (pair? structure)
    ; 左右分支相加
    (+ (total-weight (branch-structure (left-branch structure)))
       (total-weight (branch-structure (right-branch structure))))
    ; 如果不是structure，那么structure就是重量
    structure)
)

(display (total-weight x)) (newline) ; 3+4+1

; c)
; 计算分支的力矩
(define (moment branch)
  (* (branch-length branch) (total-weight (branch-structure branch)))
)
(define (balance? structure)
  (if (pair? structure)
    (let ((lb (left-branch structure))
          (rb (right-branch structure)))
      (if (= (moment lb) (moment rb))
        (and (balance? (branch-structure lb))
             (balance? (branch-structure rb))
        )
        #f
      ))
    #t
  )
)

; ((6 8) (4 ((6 4) (3 8))))
(define y
  (make-mobile
    (make-branch 6 8)
    (make-branch 4
      (make-mobile (make-branch 6 4)
                   (make-branch 3 8))))
)

(display (balance? x)) (newline)
(display (balance? y)) (newline)

; d)
(define (make-mobile left right)
  (cons left right)
)
(define (make-branch length structure)
  (cons length structure)
)

(define (left-branch structure)
  (car structure)
)
(define (right-branch structure)
  (cdr structure)
)
(define (branch-length branch)
  (car branch)
)
(define (branch-structure branch)
  (cdr branch)
)

; ((2 3) (5 ((7 4) (8 1))))
(define x
  (make-mobile
    (make-branch 2 3)
    (make-branch 5
      (make-mobile (make-branch 7 4)
                   (make-branch 8 1))))
)
(display x) (newline)
(display (left-branch x)) (newline)
(display (right-branch x)) (newline)
(display (branch-length (right-branch x))) (newline)
(display (branch-structure (right-branch x))) (newline)
(display (total-weight x)) (newline) ; 3+4+1
(display (balance? x)) (newline)

(exit)
