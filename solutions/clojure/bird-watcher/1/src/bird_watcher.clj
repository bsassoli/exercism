(ns bird-watcher)

(def last-week 
  [0 2 5 3 7 8 4]
  )

(defn today [birds]
  (get birds 6)
  )

(defn inc-bird [birds]  
  (assoc birds 6 
      (+ 1 (today birds)))
)

(defn day-without-birds? [birds]
  (if (empty? birds) false
  (or (zero? (first birds)) (day-without-birds? (rest birds))))
)

(defn n-days-count [birds n]
  (if (= 1 n) (get birds 0) 
    (+ (get birds (- n 1))  (n-days-count birds (- n 1)))))

(defn busy-days [birds]
  (if (empty? birds) 0 
    (if (>= (first birds) 5)
          (+ 1 (busy-days (rest birds)))
          (busy-days (rest birds)))))

(defn odd-week? [birds]
    (= birds [1 0 1 0 1 0 1]))
