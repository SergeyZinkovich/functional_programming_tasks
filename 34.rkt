#lang racket

(define (accumulate f start xs)
  (if (null? xs)
      start
      (accumulate f (f (car xs) start) (cdr xs))))

(define (accumulate-n op init x)
  (if (null? (car x))
      '()
      (cons (accumulate op init (map (lambda (x) (car x)) x))
            (accumulate-n op init (map (lambda (x) (cdr x)) x)))))

(accumulate-n cons '() '((1 2 3) (4 5 6) (7 8 9)))