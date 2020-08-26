#lang racket

(define (accumulate f start xs)
  (if (null? xs)
      start
      (accumulate f (f (car xs) start) (cdr xs))))

(define (mylength l)
  (accumulate (lambda (x y) (+ y 1)) 0 l))

(mylength '(1 2 3 4))