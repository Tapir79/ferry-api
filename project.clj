(defproject ferry-api "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [http-kit "2.3.0"]
                 [compojure "1.6.1"]

                 ;; Database
                 ;[yesql "0.5.3"]
                 ;[hikari-cp "2.4.0"]
                 [org.postgresql/postgresql "42.2.2"]
                 ;[funcool/clojure.jdbc "0.9.0"]
                 [org.flywaydb/flyway-core "5.0.7"]]
  :plugins [[lein-environ "1.1.0"]]
  :main ^:skip-aot ferry-api.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})

