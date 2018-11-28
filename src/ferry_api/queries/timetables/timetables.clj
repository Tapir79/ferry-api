(ns ferry-api.queries.timetables.timetables
    (require [yesql.core :refer [defqueries]]))

(def db-spec {:classname   "org.postgresql.Driver"
    :subprotocol "postgresql"
    :subname     "//localhost:5432/ferry"
    :user        "ferry"
    :password    "ferry"})

(defqueries "ferry_api/queries/timetables/timetables.sql"
      {:connection db-spec})

(defn stops [] (get-stops))
(defn ships [] (get-ships))
(defn lines [] (get-lines))
(defn line-segments [] (get-linesegments))
(defn stop-routes [] (get-stoproutes))

(defn departures [stop]
    (get-departures {:stop (Long/valueOf stop)}))
