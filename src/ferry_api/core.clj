(ns ferry-api.core
  (:gen-class)
  (:use [org.httpkit.server :only [run-server]])
  (:require [ring.middleware.reload :as reload]
            [compojure.core :refer :all]
            [compojure.route :as route]
            [compojure.handler :refer [site]]
            ;[ring.middleware.defaults :refer [wrap-defaults api-defaults]]
            ;[ring.middleware.json :refer [wrap-json-response wrap-json-body]]
            [ring.middleware.cors :refer [wrap-cors]]
            [ferry-api.flyway-migrations :as flyway]
            [ferry-api.queries.test :as sql-test]
            [ferry-api.queries.timetables.timetables :as timetables]
            [ferry-api.routes.api-routes :as api-routes]))

(def app
  (-> api-routes/app-routes
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
