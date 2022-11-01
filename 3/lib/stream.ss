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

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
    the-empty-stream
    (cons-stream
      (apply proc (map stream-car argstreams))
      (apply stream-map (cons proc
                              (map stream-cdr argstreams))))))

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

(define (stream-head stream n)
  (if (= 0 n)
    '()
    (cons (stream-car stream)
          (stream-head (stream-cdr stream) (- n 1)))))

(define (display-stream stream)
  (stream-for-each display-line stream))

(define (display-line x)
  (newline)
  (display x))

; 无穷流

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

;  从 1 开始的自然数
(define integers (integers-starting-from 1))

; 判断是否能够整除
(define (divisiable? x y)
  (= (remainder x y) 0))
; 不能被 7 整除的整数流
(define no-sevens (stream-filter (lambda (x) (not (divisiable? x 7))) integers))

(define (fibgen a b)
  (cons-stream a (fibgen b (+ a b ))))
; 斐波那契数
(define fibs (fibgen 0 1))

; 厄拉多塞筛法，构造素数无穷流
(define (sieve stream)
  (cons-stream
    (stream-car stream)
    ; 过滤不能整除当前素数的
    (sieve (stream-filter
             (lambda (x) (not (divisiable? x (stream-car stream))))
             (stream-cdr stream)))))
(define primes (sieve (integers-starting-from 2)))

; 隐式地定义流

(define ones (cons-stream 1 ones))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

; ones 是全为 1 的流，让 integers2 的前一个加一放入后一个，生成整数流
(define integers2 (cons-stream 1 (add-streams ones integers2)))

(define fibs2
  (cons-stream 0
               (cons-stream 1
                            (add-streams (stream-cdr fibs2)
                                         fibs2))))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))
