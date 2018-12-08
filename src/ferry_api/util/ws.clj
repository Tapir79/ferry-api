(ns ferry-api.util.ws
  (:require
    [taoensso.sente :as sente]
    [taoensso.sente.server-adapters.http-kit :refer (get-sch-adapter)]))

(let [packer :edn
      chsk-server (sente/make-channel-socket-server!
                    (get-sch-adapter)
                    {:packer packer})
      {:keys [ch-recv send-fn connected-uids ajax-post-fn ajax-get-or-ws-handshake-fn]}
      chsk-server]

  (def ring-ajax-post                ajax-post-fn)
  (def ring-ajax-get-or-ws-handshake ajax-get-or-ws-handshake-fn)
  (def ch-chsk                       ch-recv) ; ChannelSocket's receive channel
  (def chsk-send!                    send-fn) ; ChannelSocket's send API fn
  (def connected-uids                connected-uids) ; Watchable, read-only atom
  )

(defn broadcast-to-all-clients! [data]
  (let [uids (:any @connected-uids)]
    (println "Broadcasting booking data to user uids" (count uids))
    (doseq [uid uids]
      (chsk-send! uid [:booking/broadcast data]))))

(add-watch connected-uids :connected-uids
           (fn [_ _ old new]
             (when (not= old new)
               (println (str "Connected uids change: " new)))))

(defmulti -event-msg-handler
          "Multimethod to handle Sente `event-msg`s"
          :id ; Dispatch on event-id
          )

(defn event-msg-handler
  "Wraps `-event-msg-handler` with logging, error catching, etc."
  [{:as ev-msg :keys [id ?data event]}]
  (-event-msg-handler ev-msg))

(defmethod -event-msg-handler
  :default ; Default/fallback case (no other matching handler)
  [{:as ev-msg :keys [event id ?data ring-req ?reply-fn send-fn]}]
  (let [session (:session ring-req)
        uid     (:uid     session)]
    (println "Unhandled event: " event)
    (when ?reply-fn
      (?reply-fn {:umatched-event-as-echoed-from-from-server event}))))

(defonce router_ (atom nil))

(defn stop-router! [] (when-let [stop-fn @router_] (stop-fn)))

(defn start-router! []
  (stop-router!)
  (reset! router_
          (sente/start-server-chsk-router!
            ch-chsk event-msg-handler)))
