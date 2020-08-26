#lang racket
(define (same-parity p . rest)
  (define (parity par ans list)
    (cond
      ((null? list) ans)
      ((or
        (and (= (modulo par 2) 0) (= (modulo (car list) 2) 0))
        (and (= (modulo par 2) 1) (= (modulo (car list) 2) 1)))
          (parity par (cons (car list) ans) (cdr list)))
      (else (parity par ans (cdr list)))))
  (reverse (parity p (list p) rest))
)

(same-parity 1)
(same-parity 2)
(same-parity 1 2 3 4 5 6)
(same-parity 2 3 4 5 6)