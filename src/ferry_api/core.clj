(ns ferry-api.core
  (:gen-class)
  (:require [org.httpkit.server :as server]
            [compojure.core :refer :all]
            [compojure.route :as route]))

(defn fps-handler [req]
  {:status  200
   :headers {"Content-Type" "text/html"}
   :body    "Root"})
(defn mail-text []
  "{\"myKey\": \"myText\"}")
(defn mail-handler [req]
  {:status  200
   :headers {"Content-Type" "text/json"} ;(1)
   :body    (mail-text)}) ;(2)
(defn general-handler [req]
  {:status  200
   :headers {"Content-Type" "text/html"}
   :body    "A general handler for anything!"})
(defroutes app-routes ;(3)
           (GET "/" [] fps-handler)
           (POST "/postoffice" [] mail-handler)
           (ANY "/anything-goes" [] general-handler)
           (route/not-found "The route was not found")) ;(4)
(defn -main
  "This is our app's entry point"
  [& args]
  (let [port (Integer/parseInt (or (System/getenv "PORT") "8080"))]
    (server/run-server #'app-routes {:port port})
    (println (str "Running webserver at http:/127.0.0.1:" port "/"))))