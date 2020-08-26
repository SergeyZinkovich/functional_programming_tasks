#lang racket

(define (accumulate f start xs)
  (if (null? xs)
      start
      (accumulate f (f (car xs) start) (cdr xs))))

(define (mymap f l)
  (accumulate
   (lambda (x y)
     (append y (list (f x))))
   '() l))

(mymap (lambda (x) (* x x)) '(1 2 3 4))