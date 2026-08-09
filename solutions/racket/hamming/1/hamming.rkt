#lang racket

(provide hamming-distance)

(define (helper first second)
      (cond [(null? first) 0]
          [(equal? (car first) (car second)) (helper (cdr first) (cdr second))]
          [else (add1 (helper (cdr first) (cdr second)))]))

(define (hamming-distance source target)
  (if 
    (not (equal? (string-length source) (string-length target))) (raise (error "dif lengths"))
    (helper (string->list source) (string->list target))
  ))

