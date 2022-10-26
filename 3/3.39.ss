#|
(s (lambda () (* x x))) 和 (s (lambda () (set! x (+ x 1)))) 都在同一个串行化环境 s 里，所以这两个都可以看做是原子性的
将其简化为两个原子操作 s1 和 s2
即 (parallel-execute
    (lambda () (set! x s1))
    s2)
set! 会有读和写两个步骤，这里将其分开为 get set 两步
所以会有以下可能顺序：
1. get x -> set x s1 -> s2
2. get x -> s2 -> set x s1
3. s2 -> get x -> set x s1
结果为：
1. 10 -> 10*10 -> 100+1 => 101
2. 10 -> 10+1 -> 11*11 => 121
3. 10+1 -> 11 -> 11*11 = 121
|#
