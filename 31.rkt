#lang racket

(define (accumulate f start xs)
  (if (null? xs)
      start
      (accumulate f (f (car xs) start) (cdr xs))))

(define (myappend x1 x2)
  (accumulate cons x2 (reverse x1)))

(myappend '(1 2 3) '(4 5 6))