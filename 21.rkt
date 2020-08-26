#lang racket

(define (call as l)
  (cond
    [(empty? l) 0]
    [(= as 0)    1]
    [(< as 0)    0]
    [else (+ (call as (cdr l)) (call (- as (first l)) l))]))

(call 5 (list 1 5 10 25 50))