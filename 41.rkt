#lang racket

(define p (list list +))
(define q '(list +))
(define r (list 'list '+))

((car p) 3 4)
; (list 3 4)

((cadr p) 3 4)
;(+ 3 4)

((car r) 3 4)
;error

((cadr q) 3 4)
;error