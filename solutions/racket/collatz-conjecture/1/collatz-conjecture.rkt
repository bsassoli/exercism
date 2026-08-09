#lang racket/base

(provide collatz)

(define (even? num)
 (= (modulo num 2) 0))

(define (acceptable? num)
  (and (integer? num ) (> num 0)))

(define (collatz num)
  (cond 
        [(not (acceptable? num)) (raise-argument-error 'collatz "enter a positive integer" num)]
        [(= num 1) 0]
        [(even? num)  (+ 1  (collatz(/ num 2)))]
  [else (+ 1 (collatz(+ 1 (* 3 num))))]
))
