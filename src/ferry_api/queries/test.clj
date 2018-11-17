(ns ferry-api.queries.test
  (require [yesql.core :refer [defqueries]]
           [clojure.data.json :as json]
           [cheshire.core :refer :all]))

(def db-spec {:classname "org.postgresql.Driver"
              :subprotocol "postgresql"
              :subname "//localhost:5432/ferry"
              :user "ferry"
              :password "ferry"})

(defqueries "ferry_api/queries/test.sql"
            {:connection db-spec})

(def test {:message "new test"})

(defn json2edn [data]
    (parse-string (json/read-str (json/write-str data)) true))

(defn edn2json [data]
  (json/write-str (into {} data)))

(defn all-tests []
  (all-test-messages))

(defn one-test [id]
  (test-by-id {:id id}))

(defn new-test []
  (new-test<! test))

(defn new-test-body [body]
  (edn2json (new-test<! (json2edn body))))

(defn update-test [])