#lang racket

(provide classify)


(define (factors n)
  (define (helper i accumulator target)
    (cond ((> i (sqrt target)) (reverse accumulator))
          ((= (modulo target i) 0)
           (if (= (/ target i) i) (helper (add1 i) (cons i accumulator) target)
           (helper (add1 i) (cons i (cons (/ target i) accumulator)) target)))
          (else (helper (+ i 1) accumulator target))))
 (helper 1 '() n))


(define (aliquot-sum number)
  (foldr + 0 (cdr (factors number)))) ;using cdr because we want to exclude number from the factor


(define (classify number)
  (cond
    [(= (aliquot-sum number) number) 'perfect]
    [(> (aliquot-sum number) number) 'abundant]
    [else 'deficient]))