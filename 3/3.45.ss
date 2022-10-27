#|
1. 执行 serialized-exchange 时，会将两个账户分别放入各自账户的串行化组
2. serialized-exchange 内部执行 exchange，又会调用账户的 withdraw 和 deposit 过程
3. 新的实现中 withdraw 和 deposit 都是获取账户本身的串行化组，就会出现在 serializer 组中的一个过程在执行中，又将子过程放入父过程的串行化组中，
   这样子过程就会等待父过程释放串行化组，而父过程又在等待子过程执行完，就陷入了死锁

如果串行化组(锁)是可重入的，这样写就不会出现死锁，如果不可重入，就会死锁
|#
