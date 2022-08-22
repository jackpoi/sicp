#|
z = ('complex ('rectangular (3 + 4i)))
(magnitude z)
=> (magnitude ('complex ('rectangular (3 4))))
=> (apply-generic 'magnitude z)
=> (map type-tag (list z)) : 'complex
=> (get 'magnitude '(complex)) : not found produce 'magnitude'，在complex下找不到magnitude函数
加入新过程之后
=> (get 'magnitude '(complex)) : produce 'magnitude'，complex下的magnitude函数
=> (apply magnitude (map contents (list z))) : magnitude('rectangular (3 + 4i))
=> (applu-generic 'magnitude '(rectangular 3 4))
=> (map type-tag (list '(rectangular 3 4))) : 'rectangular
=> (get 'magnitude '(rectangular)) : produce 'magnitude'，rectangular下的magnitude函数
=> (apply magnitude (map contents (list '(rectangular 3 4)))) : magnitude(3 4)
=> (magnitude '(3 4))
=> √(3^2 + 4^2)
=> √(9+16)
=> 5
|#
