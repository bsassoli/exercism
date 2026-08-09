#lang racket
(provide balanced?)


(define (helper lst stack)
  (let [(opening '(#\[ #\( #\{))
        (closing '(#\] #\) #\}))]
    (cond [(null? lst) (null? stack)]
          [(member (car lst) closing)
           (cond [(null? stack) #f]
                 [(char=? (car lst) #\]) (if (char=? (car stack) #\[) (helper (cdr lst) (cdr stack)) #f)]
                 [(char=? (car lst) #\)) (if (char=? (car stack) #\() (helper (cdr lst) (cdr stack)) #f)]
                 [(char=? (car lst) #\}) (if (char=? (car stack) #\{) (helper (cdr lst) (cdr stack)) #f)]
                 [else #f])]
          [(char=? (car lst) #\[) (helper (cdr lst) (cons (car lst) stack))]
          [(char=? (car lst) #\() (helper (cdr lst) (cons (car lst) stack))]
          [(char=? (car lst) #\{) (helper (cdr lst) (cons (car lst) stack))]
          [else (helper (cdr lst) stack)])))

(define (balanced? str)
  (helper (string->list str) '()))

