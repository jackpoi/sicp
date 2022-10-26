#|
一开始还以为是位图，类似以布隆过滤器。，
看了下解析原来是多维表格，嵌套Map
插入和更新都需要传入传入 key-list，需要递归的去解析 key-list，来不断的创建/查询子表

https://sicp.readthedocs.io/en/latest/chp3/25.html
在 insert! 的每个 case 之后，都会将 table 返回，当需要递归地创建子表时，就会用上这些返回值。
当 insert! 或者 lookup 的输入键只是单个值而不是一个列表时，它会被转换成一个列表，然后重新调用过程。
为了可读性，将新记录添加到表的操作被抽象成 join-in-table 过程。
对 make-table 做了修改，让它可以在调用时接受给定的表名， insert! 的第三个 case 就用到了这个特性；如果没有给定表名，那么就使用默认的 '*table* 。
|#
(define (insert! key-list value table)
    (if (list? key-list)
        (let ((current-key (car key-list))
              (remain-key (cdr key-list)))
            (let ((record (assoc current-key (cdr table))))
                (cond
                    ; 1) 有记录，且没有其他关键字
                    ;    更新记录的值
                    ((and record (null? remain-key))
                         (set-cdr! record value)
                         table)
                    ; 2) 有记录，且还有其他关键字
                    ;    说明这个记录实际上是一个子表
                    ;    使用 insert! 递归地进行插入操作
                    ((and record remain-key)
                        (insert! remain-key value record)
                        table)
                    ; 3) 无记录，且有其他关键字
                    ;    需要执行以下三步：
                    ;    一、 创建子表
                    ;    二、 对子表进行插入
                    ;    三、 将子表加入到 table
                    ;    这三个步骤可以用一句完成，wow！
                    ((and (not record) (not (null? remain-key)))
                        (join-in-table (insert! remain-key value (make-table current-key)) table)
                        table)
                    ; 4) 无记录，且无其他关键字
                    ;    创建记录并将它加入到 table
                    ((and (not record) (null? remain-key))
                        (let ((new-record (cons current-key value)))
                            (join-in-table new-record table)
                            table)))))
        (insert! (list key-list) value table)))  ; 将单个键转换成列表

(define (join-in-table new-record table)
    (set-cdr! table
              (cons new-record (cdr table))))

(define (lookup key-list table)
    (if (list? key-list)
        (let ((current-key (car key-list))
              (remain-key (cdr key-list)))
            (let ((record (assoc current-key (cdr table))))
                (if record
                    (if (null? remain-key)
                        (cdr record)
                        (lookup remain-key record))
                    #f)))
        (lookup (list key-list) table)))    ; 将单个键转换成列表

(define (make-table . table-name)
    (if (null? table-name)
        (list '*table*)
        table-name))

; p 184
(define (assoc key records)
    (cond ((null? records)
            #f)
          ((equal? key (caar records))
            (car records))
          (else
            (assoc key (cdr records)))))

(define t (make-table))
(insert! 'a-single-key 10086 t)
(display (lookup 'a-single-key t)) (newline)
(insert! (list 'key-1 'key-2 'key-3) 123 t)
(display (lookup (list 'key-1 'key-2 'key-3) t)) (newline)
(insert! (list 'key-1 'key-2 'key-3) 'hello-moto t)
(display (lookup (list 'key-1 'key-2 'key-3) t)) (newline)
(exit)
