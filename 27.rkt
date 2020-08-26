#lang racket

(define (print-list-structure x)
  (define (print-contents y)
    (print-list-structure (car y))
    (cond
      ((null? (cdr y)) '())
      ((not (pair? (cdr y))) (display " . ") (print-list-structure (cdr y)))
      (else (display " ") (print-contents (cdr y)))))
  (cond
    ((null? x) (display "()"))
    ((not (pair? x)) (display x))
    (else (display "(") (print-contents x) (display ")"))))

(print-list-structure (cons 1 (cons 2 3)))
(display "\n")
(print-list-structure (cons (cons 1 2) (cons 3 '())))
(display "\n")
(print-list-structure (cons (cons 1 2) 3))