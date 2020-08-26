#lang racket

(define (fringe tree)
  (if (null? tree)
      '()
       (if (pair? (car tree))
           (append (fringe (car tree)) (fringe (cdr tree)))
           (cons (car tree) (fringe (cdr tree))))))
            
(fringe '(1 (2 3) (4 (5 6) (7 8 (9)))))