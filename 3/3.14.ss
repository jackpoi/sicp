#|
反转链表
新建一个空链表 y
不断将原链表 x 的第一个元素指向新链表 y ，完成链表反转
|#
(define (reverse-list x)
  (define (loop x y)
    (if (null? x)
      y
      (let ((temp (cdr x)))
        (set-cdr! x y)
        (loop temp x)))
  )
  (loop x '())
)

(define v '(a b c d))
(define w (reverse-list v))
(display v) (newline)
(display w) (newline)

#|
v=> a->b->c->d->()
reverse-list
  =>
    x=> a->b->c->d->()
    y=> ()
  =>
    x=> b->c->d->()
    y=> a->()
  =>
    x=> c->d->()
    y=> b->a->()
  =>
    x=> d->()
    y=> c->b->a->()
  =>
    x=> ()
    y=> d->c->b->a->()
w=>y=> a->b->c->d->()
x=> a->()
其中只有第一次是真正对原始的 x 进行了修改 (set-cdr! x y)。此时 x 为 (a b c d)，y 为 ()，所以 x 最终为 (a)
之后的 loop 递归中的修改的 x 其实是每次的 temp，最后返回的是 y
|#

(exit)
