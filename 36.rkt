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

(define (dot-product x y)
  (accumulate + 0 (accumulate-n * 1 (list x y))))

(dot-product '(1 2 3) '(1 2 3))

(define (matrix-*-vector m v)
  (map (lambda (y) (dot-product y v)) m))

(matrix-*-vector '((1 2 3) (4 5 6) (7 8 9)) '(1 2 3))

(define (transpose m)
  (accumulate-n (lambda (x y) (append y (list x))) '() m))

(transpose '((1 2 3) (4 5 6) (7 8 9)))

(define (matrix-*-matrix m1 m2)
  (map (lambda (x) (matrix-*-vector (transpose m1) x)) m2))

(matrix-*-matrix '((1 2 3) (4 5 6) (7 8 9)) '((1 2 3) (4 5 6) (7 8 9)))