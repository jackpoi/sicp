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

; 序对的无穷流

; 组合两个流，交替的从两个流中取出数据
(define (interleave s1 s2)
  (if (stream-null? s1)
    s2
    (cons-stream (stream-car s1)
                 (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
    (list (stream-car s) (stream-car t)) ; 第一部分
    (interleave
      (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t)) ; 第二部分
      (pairs (stream-cdr s) (stream-cdr t))))) ; 第三部分：递归产生

; 带权重的有序序对
(define (merge-weighted s t weight)
  (cond ((stream-null? s) t)
        ((stream-null? t) s)
        (else
          (let ((scar (stream-car s))
                (tcar (stream-car t)))
            (if (> (weight (car scar) (cdr scar))
                   (weight (car tcar) (cdr tcar))) ; 如果 scar 较大，就将其放到后面
                    (cons-stream tcar (merge-weighted s (stream-cdr t) weight))
                    (cons-stream scar (merge-weighted (stream-cdr s) t weight)))))))

(define (weighted-pairs s t weight)
  (cons-stream
    (cons (stream-car s) (stream-car t))
    (merge-weighted
      (stream-map (lambda (x) (cons (stream-car s) x)) (stream-cdr t))
      (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
      weight)))
