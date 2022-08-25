# Notes

## ChezScheme 内置函数

- (random a)
  生成 0~(a-1) 的随机数

- (ceiling a)
  对 a 向上取整

  ```scheme
  (ceiling 2.3) ; 3.0
  ```

- (floor a) (round a)
     对 a 向下取整

     ```scheme
     (floor 2.6) ; 2.0
     (round 2.6) ; 2.0
     ```

- (abs a)

     对 a 取绝对值

     ```scheme
     (abs -3) ; 3
     ```

- (gcd a b)

     求 a,b 的最大公因数

     ```scheme
     (gcd 3 10) ; 1
     (gcd 6 21) ; 3
     ```

- (exp a)

     e^a

     ```scheme
     (exp 1) ; 2.718281828459045
     ```

- (expt a b)

     a^b

     ```scheme
     (expt 2 3) ; 8=2^3
     ```

- (log a)

     自然对数，ln(a)

     ```scheme
     (log 2.718281828459045) ; 1.0
     (log (exp 2)) ; ln(e^2)=2.0
     ```

- (log a b)

     以 b 为底 a 的对数

     ```scheme
     (log 4 2) ; log2(4)=2.0
     ```

- (quotient a b)

     a 整除 b，即 a/b

     ```scheme
     (quotient 7 3) ; 2
     ```

- (remainder a b)

     a 对 b 取余，即 a%b

     ```scheme
     (remainder 7 3) ; 1
     ```

- (even? a)

     判断 a 是不是偶数

     ```scheme
     (even? 7) ; #f
     (even? 8) ; #t
     ```

- (odd? a)

     判断 a 是不是奇数

     ```scheme
     (even? 7) ; #t
     (even? 8) ; #f
     ```

- (max a b ...)

     取出指定参数的最大值

- (min a b ...)

     取出指定参数的最小值

- (exact a)

     返回 a 的精确数，即非浮点数

     ```scheme
     (exact 2) ; 2
     (exact 2.5) ; 5/2
     (exact 2.1) ; 4728779608739021/2251799813685248
     ```

- (inexact a)

     返回 a 的非精确数，即浮点数

     ```scheme
     (inexact 2) ; 2.0
     (inexact 2.5) ; 2.5
     (inexact (/ 4728779608739021 2251799813685248)) ; 2.1
     (define (f a) (exact->inexact a)) ; 将a从整数转换为浮点数
     (f 2) ; 2.0
     (f (/ 4728779608739021 2251799813685248)) ; 2.1
     ```

- (cons a b)

     生成序列

     ```scheme
     (list 2 3) ; (2 3)
     ```

- (car p)

    获取序列的前一个

- (cdr p)

    获取序列的后一个

- (list a b ...)

     生成 list
     其实本质还是 cons 生成的序列，使用 list 简化了操作
     (list 1 2 3 4) 等价于 (cons 1 (cons 2 (cons 3 (cons 4 nil))))
     ChezScheme 中 nil 不是关键字，使用 '() 表示，即 (cons 4 '())

     ```scheme
     (define l (list 2 3 4)) ; (2 3 4) => (2 (3 (4 nil)))
     (car (cdr (cdr l))) ; 4
     (cdr (cdr (cdr l))) ; () => nil
     ```

- (quote s)

     引用字符串
     
     ```scheme
     (quote s) ; s
     (quote (a b)) ; (a b)
     (quote "123") ; 123
     ```

- (eq? a b)

     比较两个符号是否相同
     
     ```scheme
     (define a 1)
     (eq? a '1) ; #t
     (eq? 'c 'c) ; #t
     ```

- (symbol? a)

     判断 a 是不是一个符号
     
     ```scheme
     (symbol? 'a) ; #t
     (symbol? 1) ; #f
     ```

- (pair? a)

     判断 a 是不是一个序列

     ```scheme
     (pair? '(4 6 8)) ; #t
     ```

- (null? a)

     判断 a 是不是空表

     ```scheme
     (null? '()) ; #t
     (null? (cons 1 1)) ; #f
     ```

- (list? a)

     判断 a 是不是一个 list

     ```scheme
     (list? '(4 6 8)) ; #t
     ```

- (append l1 l2 ...)

     合并 list，生成新的 list

     ```scheme
     (append (list 2 3 4) (list 99 98)) ; (2 3 4 99 98)
     ```

- (sin a)

     正弦函数 sin(a)

- (cos a)

     余弦函数 cos(a)

- (tan a)

     正切函数 tan(a)

- (string-append s1 s2 ...)

     拼接字符串

     ```scheme
     (string-append "q" "asd" "vv") ; "qasdvv"
     ```

- (display f)

     输出内容

     ```scheme
     (display "hello") ; hello
     (display ((lambda (x) (> x 1)) 3)) ; #t
     ```

- (newline)

  输出新起一行

- (exit)

  退出交互

- begin

  在 if 语句中执行多条

  ```scheme
  (if (even? x)
      (begin (display x) x)
      (x)
  )
  ```

