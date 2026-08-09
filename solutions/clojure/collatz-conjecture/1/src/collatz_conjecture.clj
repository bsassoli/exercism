(ns collatz-conjecture)

(defn collatz [num] ;; <- arglist goes here
  (if (= 1 num) 0
    (+ 1 (if (= (mod num 2) 0)  
      (collatz (/ num 2))
      (collatz (+ (* 3 num) 1))))))
