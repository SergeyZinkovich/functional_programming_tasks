#lang racket

(define (accumulate f start xs)
  (if (null? xs)
      start
      (accumulate f (f (car xs) start) (cdr xs))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(define (myappend .  seqs)
  (accumulate (lambda (x y)
                (accumulate (lambda (x y) (append y (list x))) y x))
              '() seqs))

(myappend '(1 2 3)'(4 5 6)'(7))
