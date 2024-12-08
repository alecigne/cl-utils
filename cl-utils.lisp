(defpackage :cl-utils
  (:use :cl)
  (:export
   :with-gensyms))

(in-package #:cl-utils)

;; See "references" at the end of the file

(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

;;; References

;; with-gensyms: Practical Common Lisp (Seibel), p101.
