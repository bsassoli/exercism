#lang racket

(require racket/date)

(provide add-gigasecond)

(define (add-gigasecond datetime)
(seconds->date (+ (date->seconds datetime) (expt 10 9))))
