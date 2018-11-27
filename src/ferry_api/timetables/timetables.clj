(ns ferry-api.timetables.timetables
    (require [yesql.core :refer [defqueries]]))

(def db-spec {:classname   "org.postgresql.Driver"
    :subprotocol "postgresql"
    :subname     "//localhost:5432/ferry"
    :user        "ferry"
    :password    "ferry"})

(defqueries "ferry_api/timetables/timetables.sql"
      {:connection db-spec})

(defn stops []
    (get-stops))

(defn departures [stop]
    (get-departures {:stop (Long/valueOf stop)}))