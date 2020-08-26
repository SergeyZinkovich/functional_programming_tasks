#lang racket

(require math)

(define (my_cons a b) (* (expt 2 a) (expt 3 b)))

(define (my_car x)
  (define (my_car_2 x ans)
    (if (= (modulo x 2) 0)
        (my_car_2 (/ x 2) (+ ans 1))
        ans))
  (my_car_2 x 0))

(define (my_cdr x)
  (define (my_cdr_2 x ans)
    (if (= (modulo x 3) 0)
        (my_cdr_2 (/ x 3) (+ ans 1))
        ans))
  (my_cdr_2 x 0))



(print (my_car (my_cons 2 3)))
(newline)
(print (my_cdr (my_cons 2 3)))