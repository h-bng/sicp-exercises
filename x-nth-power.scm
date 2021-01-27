(define (power x n)
  (define (power-iter n result)
    (if (= n 0)
      result
      (power-iter (- n 1) (* result x))))
  (power-iter n 1))

(define (solve-expon n y)
  (define (abs x)
    ((if (< x 0) - +) x))
  (define (improve x)
    (/ (+ (* x (- n 1)) (/ y (power x (- n 1)))) n))
  (define (good-enough? x)
    (< (abs (- (power x n) y)) 0.00000001))
  (define (iter x)
    (if (good-enough? x)
	x
	(iter (improve x))))
  (iter 1.0))
