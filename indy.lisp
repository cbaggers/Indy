(in-package #:indy)

(defun idolize (val) (indy-internals:%make-idol :ref val))

(defun behold (idol) (indy-internals:%idol-ref idol))

(defun swap (idol function &rest args)
  (indy-internals:swap! (indy-internals:%idol-ref idol)
                        (lambda (args old-val) (funcall function old-val args))
                        args))

(defun swap-val (idol val)
  (indy-internals:swap! (indy-internals:%idol-ref idol) #'val-swapper val))

(defun val-swapper (new-val old-val)
  (declare (ignore old-val))
  new-val)
