(in-package :mu-cl-resources)

(defparameter *cache-count-queries* nil)
(defparameter *include-count-in-paginated-responses* t
  "when non-nil, all paginated listings will contain the number
   of responses in the result object's meta.")
(defparameter *max-group-sorted-properties* nil)

(read-domain-file "master-log-domain.lisp")
