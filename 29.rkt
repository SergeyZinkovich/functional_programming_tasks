#lang racket

(define (deep-reverse list)
  (define (reverse-iter list reverse-list)
    (if (null? list)
        reverse-list
        (reverse-iter (cdr list) (cons 
                                  (if (pair? (car list))
                                           (deep-reverse (car list))
                                           (car list))
                                       reverse-list))))
  (reverse-iter list '()))

(deep-reverse '(1 (2 3) (4 (5 6) (7 8 (9)))))