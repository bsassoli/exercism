#lang racket

(provide my-length
         my-reverse
         my-map
         my-filter
         my-fold
         my-append
         my-concatenate)

(define (my-length sequence)
  (if (null? sequence)
      0 
      (+ 1 (my-length (cdr sequence)))))

(define (my-reverse sequence)
  (define (helper seq acc)
    (if (null? seq)
        acc
        (helper (cdr seq) (cons (car seq) acc))))
  (helper sequence '()))

(define (my-map operation sequence)
  (if (null? sequence)
      '() 
      (cons (operation (car sequence)) (my-map operation (cdr sequence)))))

(define (my-filter operation? sequence)
  (if (null? sequence)
    '()
    (if (operation? (car sequence))
     (cons (car sequence) (my-filter operation? (cdr sequence)))
     (my-filter operation? (cdr sequence)))))

(define (my-fold operation accumulator sequence)
   (if (null? sequence)
    accumulator
    (my-fold operation (operation (car sequence) accumulator) (cdr sequence))))

(define (my-append sequence1 sequence2)
  (if (null? sequence1)
    sequence2
    (cons (car sequence1) (my-append (cdr sequence1) sequence2))))

(define (my-concatenate sequence-of-sequences)
  (if (null? sequence-of-sequences)
      '()
      (if (list? (car sequence-of-sequences))
          (my-append (my-concatenate (car sequence-of-sequences)) (my-concatenate (cdr sequence-of-sequences)))
          (cons (car sequence-of-sequences) (my-concatenate (cdr sequence-of-sequences))))))
