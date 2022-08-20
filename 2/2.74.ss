#|
将对记录进行的操作看做不同的过程，不同的分支机构看做不同的标志
对不同的分支机构实现各自的过程
就可以画出如下的操作表
          │  branch1  │  branch2  │ ...
──────────┼───────────┼───────────┼────
get-record│get-record1│get-record2│ ...
──────────┼───────────┼───────────┼────
get-salary│get-salary1│get-salary2│ ...
|#

; a) 根据雇员名和所在机构分支获取记录
(define (get-record name branch)
  ((get 'get-record branch) name)
)

; b)
(define (get-salary name branch)
  ((get 'get-salary branch) name)
)

; c) 提供了雇员名和所有分支的列表，递归查找所有分支
(define (find-employee-record name branch-list)
  (define (iter name branch-list res)
    (if (null? branch-list)
      res
      (let ((record (get-record name (car branch-list))))
        (if (null? record)
          (iter name (cdr branch-list) res)
          (iter name (cdr branch-list) (cons record res)))))))
  )
  (iter name branch-list '())
)

; d) 新增了分支机构，只需要将其分支和对应实现的过程传入操作表即可
