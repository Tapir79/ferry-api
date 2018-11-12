(ns ferry-api.core
  (:gen-class)
  (:require [org.httpkit.server :as server]
            [compojure.core :refer :all]
            [compojure.route :as route]))

(defn fps-handler [req]
  {:status  200
   :headers {"Content-Type" "text/html"}
   :body    "Pew pew!"})
(defn mail-man []
  "{\"Spongebob Narrator\": \"5 years later...\"}")
(defn mail-handler [req]
  {:status  200
   :headers {"Content-Type" "text/json"} ;(1)
   :body    (mail-man)}) ;(2)
(defn general-handler [req]
  {:status  200
   :headers {"Content-Type" "text/html"}
   :body    "All hail General Zod!"})
(defroutes app-routes ;(3)
           (GET "/" [] fps-handler)
           (POST "/postoffice" [] mail-handler)
           (ANY "/anything-goes" [] general-handler)
           (route/not-found "You Must Be New Here")) ;(4)
(defn -main
  "This is our app's entry point"
  [& args]
  (let [port (Integer/parseInt (or (System/getenv "PORT") "8080"))]
    (server/run-server #'app-routes {:port port})
    (println (str "Running webserver at http:/127.0.0.1:" port "/"))))