(display (car '' abracadabra)) (newline)
(display (cdr '' abracadabra)) (newline)
(display (cadr '' abracadabra))

#|
' 是quote的语法糖，运行时会将语法糖 ' 转换为quote
也就是运行时(car '' abracadabra)其实会变成(car '(quote abracadabra))
而'(quote abracadabra)其实就是(quote abracadabra)
所以car是quote，cdr就是abracadabra了
|#

(exit)
