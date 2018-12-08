(ns ferry-api.queries.timetables.timetables
  (require [yesql.core :refer [defqueries]]
           [clojure.data.json :as json]
           [cheshire.core :refer :all]))

(def db-spec {:classname   "org.postgresql.Driver"
              :subprotocol "postgresql"
              :subname     "//localhost:5432/ferry"
              :user        "ferry"
              :password    "ferry"})

(defqueries "ferry_api/queries/timetables/timetables.sql"
            {:connection db-spec})

(defn json2edn-time [data]
  (let [edn (parse-string (json/read-str (json/write-str data)) true)
        start-time (clojure.string/replace (:start_time edn) #"T|Z" {"T" " " "Z" ""})
        end-time (clojure.string/replace (:end_time edn) #"T|Z" {"T" " " "Z" ""})
        return-edn (assoc edn :end_time end-time :start_time start-time)]
    (println "before parsing" edn)
    (println "parsed times" start-time " and " end-time)

    (println "after parsing" return-edn)
    return-edn
    ))

(defn json2edn [data]
(parse-string (json/read-str (json/write-str data)) true)
    )




(defn edn2json-time [data]
  (println "inedn2json")
  (println "data" data)
  (let [start-time (str(:start_time data))
        end-time (str(:end_time data))
        #_#_parsed-end-time (clojure.string/replace (:end_time end-time) #"|.0" {"" "T" ".0" "Z"})
        created-at (str (:created_at data))
        parsed-data (assoc data :end_time end-time :start_time start-time :created_at created-at)
        ]
  (println "date strings:" start-time " " end-time " " created-at)
  (json/write-str (into {} parsed-data))
  ))

(defn edn2json [data]
    (json/write-str (into {} data))
    )

(defn stops [] (get-stops))

(defn ships [] (get-ships))

(defn lines [] (get-lines))

(defn line-segments [] (get-linesegments))

(defn stop-routes [] (get-stoproutes))

(defn timetables [] (get-timetables))

(defn departures [stop]
  (get-departures {:stop (Long/valueOf stop)}))

(defn vehicles [] (get-vehicles))

(defn bookings [] (get-bookings))

(defn new-booking [body]
  (edn2json-time (post-booking<! (json2edn body))))


