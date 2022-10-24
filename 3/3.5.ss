(load "D:/projects/mine/sicp/1/lib/power.ss")

; 返回的结果就是通过 experiment 的次数比上总次数 trials
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0) (/ trials-passed trials))
          ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else (iter (- trials-remaining 1) trials-passed)))
  )
  (iter trials 0)
)

#|
蒙特卡罗法求圆周率就是在圆上切一个正方形
已知圆的半径为 r ，正方形的面积是(2r)^2=4r^2，圆的面积是πr^2
在正方形内随机选 n 个坐标，计算坐标在圆内的数量
落在圆内的几率为圆形面积比上正方形面积：πr^2/4r^2 = π/4
当数量足够大时，落在圆内的几率(坐标数量 c 比上总数量 n)再乘以 4 就会无限接近圆周率，即 (c/n)*4≈π
|#

; 生成指定两点之间的随机数
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range)))
)

; 4*(c/n)
(define (estimate-integral P? x1 x2 y1 y2 trials)
  (* 4
     (monte-carlo trials
                  (lambda ()
                    (P? (random-in-range x1 x2)
                        (random-in-range y1 y2)))))
)

; 假设圆是以原点为中心，半径为1的圆，那么矩形的边长为2
; 矩形内的坐标(x, y)，如果 x^2+y^2=1，说明该点在圆上，如果 <1，说明在圆内，如果 >1，说明在圆外
(define (pi trials)
  (exact->inexact
    (estimate-integral
      (lambda (x y) (< (+ (square x) (square y)) 1.0))
      -1.0
      1.0
      -1.0
      1.0
      trials))
)

(display (pi 1000)) (newline)
(display (pi 10000)) (newline)
(display (pi 100000)) (newline)
(display (pi 1000000)) (newline)
(display (pi 10000000)) (newline)

(exit)
