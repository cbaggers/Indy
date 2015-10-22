(in-package #:indy)

(defun idolize (val) (indy-internals:%make-idol :ref val))

(defun behold (idol) (indy-internals:%idol-ref idol))

(defun swap (idol function)
  (indy-internals:swap! (indy-internals:%idol-ref idol) function))
