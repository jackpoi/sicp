(define-syntax cons-stream
  (syntax-rules ()
    ((_ a b) (cons a (delay b)))))

(define (stream-car stream)
  (car stream))

(define (stream-cdr stream)
  (force (cdr stream)))

(define the-empty-stream '())

(define (stream-null? stream)
  (null? stream))

(define (stream-ref stream n)
  (if (= 0 n)
    (stream-car stream)
    (stream-ref (stream-cdr stream) (- n 1))))

; 对流遍历使用 proc 过程，并返回一个新流
(define (stream-map proc stream)
  (if (stream-null? stream)
    the-empty-stream
    (cons-stream (proc (stream-car stream))
                 (stream-map proc (stream-cdr stream)))))

; 使用谓词 pred 过滤流
(define (stream-filter pred stream)
  (if (stream-null? stream)
    the-empty-stream
    (if (pred (stream-car stream))
      (cons-stream (stream-car stream)
                   (stream-filter pred (stream-cdr stream)))
      (stream-filter pred (stream-cdr stream)))))

; 对流遍历使用 proc 过程
(define (stream-for-each proc stream)
  (if (stream-null? stream)
    'done
    (begin
      (proc (stream-car stream))
      (stream-for-each proc (stream-cdr stream)))))

; 产生指定区间内的流
(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream low
                 (stream-enumerate-interval (+ low 1) high))))

(define (display-stream stream)
  (stream-for-each display-line stream))

(define (display-line x)
  (newline)
  (display x))
