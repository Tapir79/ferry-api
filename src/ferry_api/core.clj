(ns ferry-api.core
  (:gen-class)
  (:use [org.httpkit.server :only [run-server]])
  (:require [ring.middleware.reload :as reload]
            [compojure.core :refer :all]
            [compojure.route :as route]
            [compojure.handler :refer [site]]
            ;[ring.middleware.defaults :refer [wrap-defaults api-defaults]]
            [ring.util.json-response :as json-response]
            ;[ring.middleware.json :refer [wrap-json-response wrap-json-body]]
            [ring.middleware.cors :refer [wrap-cors]]
            [ferry-api.flyway-migrations :as flyway]
            [ferry-api.queries.test :as sql-test]))

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

(defn general-handler [req]
  {:status  200
   :headers {"Content-Type" "text/html"}
   :body    "A general handler for anything!"})

(defroutes app-routes
           (GET "/tests" [] get-handler)
           (GET "/tests/:id" [id] (get-one-handler (read-string id)))
           (POST "/tests" {body :body} (post-new-handler (slurp body)))
           (ANY "/anything-goes" [] general-handler)
           (route/not-found "The route was not found!"))

(def app
  (-> app-routes
      (wrap-cors
        :access-control-allow-origin [#".*"]
        :access-control-allow-headers ["Origin" "X-Requested-With" "Content-Type" "Accept"]
        :access-control-allow-methods [:get :post :put])))

;;add this as env/profile param
(def ^{:const true} in-dev? true)

(defn -main
  "This is our app's entry point"
  [& args]
  (let [port (Integer/parseInt (or (System/getenv "PORT") "8080"))
        handler (if in-dev?
                  (reload/wrap-reload (site #'app))
                  (site app))]
    (run-server handler {:port port})
    (println (str "Running webserver at http:/127.0.0.1:" port "/"))
    (flyway/reset)))
