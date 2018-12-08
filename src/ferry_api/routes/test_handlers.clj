(ns ferry-api.routes.test-handlers
  (:require [ring.util.json-response :as json-response]
            [compojure.core :refer :all]
            [compojure.handler :refer [site]]
            [ring.middleware.cors :refer [wrap-cors]]
            [ferry-api.queries.test :as sql-test]
            [ferry-api.queries.timetables.timetables :as sql-timetables]
            [ferry-api.util.ws :as ws]))

(defn get-handler [req]
  {:status  200
   :headers {"Content-Type" "text/json"}
   :body    (:body (json-response/json-response (sql-test/all-tests)))})
;:body (sql-test/all-tests)})

(defn get-one-handler [id]
  {:status  200
   :headers {"Content-Type" "text/json"}
   :body    (:body (json-response/json-response (sql-test/one-test id)))})
;:body (sql-test/one-test id)})

(defn post-new-handler [body]
  {:status  200
   :headers {"Content-Type" "text/json"}
   :body    (sql-test/new-test-body body)})

(defn post-new-booking-handler [body]
  {:status  200
   :headers {"Content-Type" "text/json"}
   :body    ((sql-timetables/new-booking body)
              (ws/broadcast-to-all-clients! body))})

(defn general-handler [req]
  {:status  200
   :headers {"Content-Type" "text/html"}
   :body    "A general handler for anything!"})

(defn json-handler [data]
  {:status 200
   :headers {"Content-Type" "text/json;charset=utf-8"}
   :body (:body (json-response/json-response data))})
