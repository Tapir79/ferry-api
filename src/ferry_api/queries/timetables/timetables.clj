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

(defn json2edn [data]
  (parse-string (json/read-str (json/write-str data)) true))

(defn edn2json [data]
  (json/write-str (into {} data)))

(defn stops [] (get-stops))

(defn ships [] (get-ships))

(defn lines [] (get-lines))

(defn line-segments [] (get-linesegments))

(defn stop-routes [] (get-stoproutes))

(defn departures [stop]
  (get-departures {:stop (Long/valueOf stop)}))

(defn vehicles [] (get-vehicles))

(defn bookings [] (get-bookings))

(defn new-booking [body]
  (edn2json (post-booking (json2edn body))))

