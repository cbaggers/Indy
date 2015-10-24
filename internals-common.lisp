(in-package :indy-internals)

(defstruct (idol (:conc-name %idol-) (:constructor %make-idol))
  (ref (error "idol cannot be created without a value") :type t)
  (id (gensym "I") :type symbol))

(defmacro atomic-incf (place &optional (delta 1))
  (let ((old (gensym)) (new (gensym)))
    `(loop for ,old = ,place for ,new = (+ ,delta ,old)
        when (eq ,old (compare-and-swap ,place ,old ,new))
        return ,new)))

(defmethod print-object ((object idol) stream)
  (format stream "#<IDOL ~s>" (%idol-id object)))

#- (or sbcl ccl)
(defmacro compare-and-swap (place old new)
  (declare (ignore place old new))
  `(error "Not supported yet."))

#+ (and sbcl (not compare-and-swap-vops))
(defmacro compare-and-swap (place old new)
  (warn "COMPARE-AND-SWAP is not implemented atomically on this platform.")
  `(sb-ext:compare-and-swap ,place ,old ,new))

#+ (and ccl ccl-1.10)
(progn
  (warn "CCL's conditional-store operations are not exported. Caveat usor.")
  (defmacro compare-and-swap (place old new)
    (if (atom place)
        (error 'type-error :datum place :expected-type 'cons)
        (ecase (car place)    ; TODO: upstream these into ccl::conditional-store
          (car `(ccl::%rplaca-conditional ,(cadr place) ,old ,new))
          (cdr `(ccl::%rplacd-conditional ,(cadr place) ,old ,new))
          (svref `(ccl::conditional-store ,place ,old ,new))))))

(defmacro compare-and-swap-bool (place old-val new-val)
  (let ((old (gensym "old")))
    `(let ((,old ,old-val))
       (if (eq ,old (compare-and-swap ,place ,old ,new-val)) t nil))))

#+sbcl
(defmacro swap! (place function &rest args)
  `(sb-ext:atomic-update ,place ,function ,@args))
