(require '[clojure-erlastic.core :refer [run-server]])
(use '[clojure.core.match :only (match)])
(run-server
  (fn [term count] (match term
    [:add n] [:noreply (+ count n)]
    [:rem n] [:noreply (- count n)]
    :get [:reply count count])))
