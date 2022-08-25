(load "D:/projects/mine/sicp/2/lib/op-table.ss")

; 定义通用操作(接口)
(define (=zero? x)
  (apply-generic '=zero? x)
)

(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (error
                    "No method for these types -- APPLY-GENERIC"
                    (list op type-tags))))))

(define (attach-tag type-tag contents)
    (cons type-tag contents))

(define (type-tag datum)
    (if (pair? datum)
        (car datum)
        (error "Bad tagged datum -- TYPE-TAG" datum)))

(define (contents datum)
    (if (pair? datum)
        (cdr datum)
        (error "Bad tagged datum -- CONTENTS" datum)))

; 实现
; 常规数实现
(define (install-scheme-number-package)
  (define (tag x) (attach-tag 'scheme-number x))
  (put 'make 'scheme-number (lambda (x) (tag x)))
  (put '=zero? '(scheme-number) (lambda (x) (= x 0)))
)

(define (make-scheme-number n)
    ((get 'make 'scheme-number) n))

(install-scheme-number-package)
(display "常规数: ")
(display (=zero? (make-scheme-number 0))) (newline)
(display (=zero? (make-scheme-number 10))) (newline)

; 有理数实现
(define (install-rational-package)
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
  (define (tag x) (attach-tag 'rational x))
  (put 'make 'rational (lambda (n d) (tag (make-rat n d))))
  (put '=zero? '(rational)
    (lambda (x)
      (= (numer x) 0)))
)

(define (make-rational n d)
    ((get 'make 'rational) n d))

(install-rational-package)
(display "有理数: ")
(display (=zero? (make-rational 3 10))) (newline)
(display (=zero? (make-rational 0 10))) (newline)

; 复数实现

(exit)
