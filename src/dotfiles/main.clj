#!/usr/bin/env bb

; link all files
; add file
; git status + bash coloring
; open tig?

(ns dotfiles.main
  (:require [clojure.java.io :as io]
            [clojure.core.match :refer [match]]
            [clojure.string :as str]
            [clojure.pprint :as p]
            [clojure.edn :as edn]
            [babashka.process :refer [shell sh]]
            [babashka.cli :as cli]
            [babashka.fs :as fs]))


  
(def dotfiles-dir (fs/expand-home "~/.dotfiles"))
(def source-files-dir (io/resource "files"))
(def home-dir (fs/expand-home "~"))
(def links-resource (io/resource "links.edn"))


(defn get-target-path [relative-path]
  (fs/path home-dir relative-path))

(defn get-source-path [relative-path]
  (fs/path source-files-dir relative-path))

; (defn get-pretty-path [relative-path]
;   (fs/path "~" relative-path))
;
; (defn get-source-files []
;   (->> (sh "find" (str source-files-dir) "-type" "f")
;        :out
;        str/split-lines
;        (filter not-empty)
;        (map fs/path)))

(defn make-link [relative-path]
  (let [source-path (get-source-path relative-path)
        target-path (get-target-path relative-path)]
    (if (fs/exists? target-path)
      (assert (fs/same-file? source-path target-path))
      (fs/create-sym-link target-path source-path))))

(defn link-all-files []
  (let [links (-> links-resource slurp edn/read-string :links)]
    (doall (map #(make-link (:path %)) links))))


(defn add-file [path submodule-url]
  (let [relative-path (->> path fs/expand-home fs/absolutize (fs/relativize home-dir))
        source-path (get-source-path relative-path)
        target-path (get-target-path relative-path)]

    (assert (not (fs/sym-link? target-path)) "File is a symlink")
    (assert (not (str/starts-with? relative-path "..")) "File must be in user's home directory")

    (if submodule-url
      ; Assuming for now that submodules aren't top-level, so don't need to be linked
      (shell {:dir (str dotfiles-dir)} "git" "submodule" "add" submodule-url source-path)
      (do
        (assert (fs/exists? target-path) "File does not exist")
        (fs/create-dirs (fs/parent source-path))
        (fs/move target-path source-path)
        (make-link relative-path)

        (-> links-resource
            slurp
            edn/read-string
            (update :links (fn [links]
                             (as-> links $
                                   (conj $ {:path (str relative-path)})
                                   (sort-by :path $)
                                   (into [] $))))
            (p/pprint (io/writer links-resource)))))
    nil))

;
(defn cli-add [{{file :file submodule-url :url} :opts}]
  (add-file file submodule-url))

(defn cli-link [_]
  (link-all-files))

(defn cli-status [_]
  (println (:out (shell {:out :string :dir (str dotfiles-dir)} "git" "status" "--short"))))

(defn cli-help [_]
  (print (str "Example usage:\n"
              "  dotfiles add [--url <submodule url>] <file>\n"
              "  dotfiles link\n"
              "  dotfiles status\n")))

(def table
  [{:cmds ["add"]    :fn cli-add  :args->opts [:file]}
   {:cmds ["link"]   :fn cli-link}
   {:cmds ["status"] :fn cli-status}
   {:cmds []         :fn cli-help}])

(defn -main [& args]
  (cli/dispatch table args))
;
