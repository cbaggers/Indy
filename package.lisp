;;;; package.lisp

(defpackage #:indy-internals
  (:use #:cl)
  #+ (and sbcl compare-and-swap-vops)
  (:import-from :sb-ext :compare-and-swap)
  #+ (and ccl (or x86 x86-64))
  (:import-from :ccl :defx86lapfunction)
  (:export #:compare-and-swap
           #:compare-and-swap-bool
           #:atomic-incf
           #:swap!
           #:%make-idol
           #:%idol-ref))

(defpackage #:indy
  (:use #:cl)
  (:export :idolize :swap :behold))
