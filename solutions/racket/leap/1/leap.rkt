#lang racket

(provide leap-year?)

(define (leap-year? year)
  (and 
    (= (modulo year 4) 0) 
    (or 
        (= (modulo year 400) 0)
        (not (= (modulo year 100) 0)))))