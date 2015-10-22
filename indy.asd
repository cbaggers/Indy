;;;; indy.asd

(asdf:defsystem #:indy
  :description "Describe indy here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :serial t
  :depends-on (:bordeaux-threads)
  :components ((:file "package")
               (:file "internals-common")
               (:file "indy")))
