{:user {:plugins [[cider/cider-nrepl "0.9.0-SNAPSHOT"]]
        :dependencies [[com.cemerick/piggieback "0.1.3"]
                       [weasel "0.3.0"]]
        :repl-options {:nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]}}}
