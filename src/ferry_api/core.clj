(ns ferry-api.core
  (:gen-class)
  (:require [org.httpkit.server :as server]
            [compojure.core :refer :all]
            [compojure.route :as route]
            [ring.middleware.json :only [wrap-json-body]]
            [ring.util.json-response :as json-response]
            [ferry-api.flyway-migrations :as flyway]
            [ferry-api.queries.test :as sql-test]))

(defn get-handler [req]
  {:status  200
   :headers {"Content-Type" "text/json"}
   :body    (:body (json-response/json-response (sql-test/all-tests)))})

#_(defn get-handler [req]
  {:status  200
   :headers {"Content-Type" "text/json"}
   :body    (sql-test/all-tests)})
(defn get-one-handler [id]
  {:status  200
   :headers {"Content-Type" "text/json"}
   :body    (sql-test/one-test id)})

(defn post-new-handler [body]
    {:status 200
     :headers {"Content-Type" "text/json"}
     :body    (sql-test/new-test-body body)})

(defn general-handler [req]
  {:status  200
   :headers {"Content-Type" "text/html"}
   :body    "A general handler for anything!"})

(defroutes app-routes
           (GET "/tests" [] get-handler)
           (GET "/tests/:id" [id] (get-one-handler (read-string id)))
           ; muunna body keywordeiksi
           (POST "/tests" {body :body} (post-new-handler (slurp body)))
           (POST "/posttest" [] (str(sql-test/new-test)))
           (ANY "/anything-goes" [] general-handler)
           (route/not-found "The route was not found!"))

(defn -main
  "This is our app's entry point"
  [& args]
  (let [port (Integer/parseInt (or (System/getenv "PORT") "8080"))]
    (server/run-server #'app-routes {:port port})
    (println (str "Running webserver at http:/127.0.0.1:" port "/"))
    (flyway/reset)))