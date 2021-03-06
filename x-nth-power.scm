;; calculate x^n
;; tail recursive
(define (power x n)
  (define (iter n result)
    (if (= n 0)
      result
      (iter (- n 1) (* result x))))
  (iter n 1))

;; recursive power
(define (power_recursive x n)
  (if (= n 0)
      1
      (* x (power_recursive x (- n 1)))))


;; find the root of
;; x^n - y = 0
;; for given n and y.
(define (solve-expon n y)
  ;; absolute value
  (define (abs x)
    ((if (< x 0) - +) x))
  
  ;; improve the guess with newton's method
  ;; applied to equations in the form of
  ;; x^n - y = 0
  (define (improve guess)
    (/ (+ (* guess (- n 1)) (/ y (power guess (- n 1)))) n))

  ;; if the difference between previous and current
  ;; guesses is less than a fraction, we accept the guess.
  ;; fraction can be changed for desired precision.
  (define (good-enough? old-guess new-guess)
    (< (abs (- old-guess new-guess)) (* old-guess 0.000000001)))

  ;; main iteration with old and new guesses passed as
  ;; parameters.
  (define (iter old-guess new-guess)
    (if (good-enough? old-guess new-guess)
	new-guess
	(iter new-guess (improve new-guess))))

  ;; start the iteration with 0 and 1.0 as initial parameters.
  (iter 0 1.0))


;; tests
(solve-expon 2 2)
(solve-expon 3 27)
(solve-expon 2 0.0000000000001)
(solve-expon 2 100000000000000)
