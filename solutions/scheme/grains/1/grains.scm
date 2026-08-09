(import (rnrs))

(define (square n) 
  (cond [(zero? n) (error("square 0 raises an exception"))]
        [(< n 0) (error("negative square"))]
        [(> n 64) (error("too big"))]
                          
    (else (expt 2 (- n 1)))))

(define (total)
  (letrec ([helper
            (lambda (acc n) 
        (if (> n 64)
        acc
        (helper (+ acc (expt 2 (- n 1))) (+ 1 n))))])
(helper 0 1)))
