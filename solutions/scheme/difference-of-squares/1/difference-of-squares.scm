(import (rnrs))


(define (sum-of-squares num)
  (cond [(zero? num) 1]
        [(= num 1) 1]
  (else (+ (* num num) (sum-of-squares (- num 1))))))

(define (square-of-sum num)
  (let ([sum (/ (* (+ num  1) num) 2)]) (* sum sum)))

(define (difference-of-squares num)
  (- (square-of-sum num) (sum-of-squares num)))

