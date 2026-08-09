#lang racket
(require racket/string)

(provide two-fer)

(define (two-fer [name "you"])
  (string-append "One for " name ", one for me."))