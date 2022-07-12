# Notes

## ChezScheme 内置函数

- (random a)
  生成小于 a 的随机数

- (ceiling a)
  对 a 向上取整

  ```scheme
  (ceiling 2.3) ; 3.0
  ```

- (floor a)
     对 a 向下取整

     ```scheme
     (floor 2.6) ; 2.0
     ```

- (abs a)

     对 a 取绝对值

     ```scheme
     (abs -3) ; 3
     ```

- (sin a)

     正弦函数 sin(a)

- (cos a)

     余弦函数 cos(a)

- (tan a)

     正切函数 tan(a)

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

