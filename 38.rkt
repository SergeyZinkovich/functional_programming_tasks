#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (accumulate op (op initial (car sequence)) (cdr sequence))))

(define (flatmap op sequence)
  (accumulate append '() (map op sequence)))

(define (enumerate-list low high)
  (if (> low high)
      '()
      (cons low (enumerate-list (+ low 1) high))))

(define (unique-triples n)
  (flatmap (lambda (i) 
             (flatmap (lambda (j) 
                        (map (lambda (k) 
                               (list i j k)) 
                             (enumerate-list 1 (- j 1)))) 
                      (enumerate-list 1 (- i 1))))
           (enumerate-list 1 n)))

(define (sum-to-s? s)
  (lambda (triple)
    (= (accumulate + 0 triple) s)))

(define (triple-sum-combinations n s)
  (filter (sum-to-s? s) (unique-triples n)))

(triple-sum-combinations 6 9)