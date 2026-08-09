#lang racket
(provide armstrong-number?)

(define (length n)
    (+ 1 (floor (/ (log n) (log 10)))))

(define (digits num)
  (cond [(< num 1) '()]
        (else (cons
                   (get-first-digit num)
                   (digits (get-other-digits num))))))

(define (sum-all nums)
  (foldl + 0 nums))

(define (get-first-digit num)
  (quotient num (expt 10 (sub1 (length num)))))

(define (get-other-digits num)
  (remainder num (expt 10 (sub1 (length num)))))

(define (raise-digits-to-n exp nums)
  (map (lambda (x)  (expt x exp)) nums))

(define (armstrong-number? n)
  (if (= n 0) #t (= (sum-all (raise-digits-to-n (length n) (digits n))) n)))
