#lang racket

(provide square total)

(define (square n) 
    (expt 2 (- n 1)))

(define (total)
  (letrec ([helper
            (lambda (acc n) 
        (if (> n 64)
        acc
        (helper (+ acc (expt 2 (- n 1))) (+ 1 n))))])
(helper 0 1)))





