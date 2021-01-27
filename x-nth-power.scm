(define (power-iter x n p)
  (if (= n 0)
      p
      (power-iter x (- n 1) (* p x))))

(define (power x n)
  (power-iter x n 1))

(define (improve-n x y n)
  (/ (+ (* x (- n 1)) (/ y (power x (- n 1)))) n))

(define (good-enough-n? x y n)
  (< (abs (- (power x n) y)) 0.00000001))

(define (n-iter x y n)
  (if (good-enough-n? x y n)
      x
      (n-iter (improve-n x y n) y n)))

(define (x-over-n n y)
  (n-iter 1.0 y n))
