#|
a) 会一直不停地调用 apply-gengric，陷入死循环

b) 显然没有，一旦 apply-gengric 执行查找一个不存在的通用操作，就会陷入死循环

查找 'exp 通用操作失败，试图通过进行类型强制
(apply-generic 'exp (make-scheme-number 1) (make-scheme-2))

强制完成，继续查找
(apply-generic 'exp (scheme-number->scheme-number (make-scheme-number 1)) (make-scheme-2))

再次查找失败，再次进行类型强制
(apply-generic 'exp (make-scheme-number 1) (make-scheme-2))

强制再次完成（其实根本没做什么），继续查找（然后再次失败）
(apply-generic 'exp (scheme-number->scheme-number (make-scheme-number 1)) (make-scheme-2))

……死循环

c) 在进行类型转换之前，判断两个类型是否相等，不相等才进行转换
|#
