(ns ferry-api.routes.api-routes
  (:require [compojure.core :refer :all]
            [compojure.route :as route]
            [compojure.handler :refer [site]]
            [ring.middleware.cors :refer [wrap-cors]]
            [ferry-api.queries.timetables.timetables :as timetables]
            [ferry-api.routes.test-handlers :as handlers]
            ))

(defroutes app-routes
           (GET "/tests" [] handlers/get-handler)
           (GET "/tests/:id" [id] (handlers/get-one-handler (read-string id)))
           (POST "/tests" {body :body} (handlers/post-new-handler (slurp body)))
           (ANY "/anything-goes" [] handlers/general-handler)
           (GET "/stops" [] (handlers/json-handler (timetables/stops)))
           (GET "/ships" [] (handlers/json-handler (timetables/ships)))
           (GET "/lines" [] (handlers/json-handler (timetables/lines)))
           (GET "/departures/:stop" [stop] (handlers/json-handler (timetables/departures stop)))
           (GET "/linesegments" [] (handlers/json-handler (timetables/line-segments)))
           (GET "/stoproutes" [] (handlers/json-handler (timetables/stop-routes)))
           (GET "/bookings" [] (handlers/json-handler (timetables/bookings)))
           (POST "/bookings" {body :body} (handlers/post-new-booking-handler (slurp body)))
           (GET "/vehicles" [] (handlers/json-handler (timetables/vehicles)))
           (route/not-found "The route was not found!"))
