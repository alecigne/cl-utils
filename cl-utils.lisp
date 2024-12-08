(defpackage :cl-utils
  (:use :cl)
  (:export
   :ppmx
   :with-gensyms))

(in-package #:cl-utils)

;; See "references" at the end of the file

(defmacro ppmx (form)
  "Pretty prints the macro expansion of FORM."
  `(let* ((exp1 (macroexpand-1 ',form))
          (exp (macroexpand exp1))
          (*print-circle* nil))
     (cond ((equal exp exp1)
            (format t "~&Macro expansion:")
            (pprint exp))
           (t (format t "~&First step of expansion:")
              (pprint exp1)
              (format t "~%~%Final expansion:")
              (pprint exp)))
     (format t "~%~%")
     (values)))

(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

;;; References

;; ppmx: Common Lisp: A Gentle Introduction to Symbolic Computation (Touretsky),
;; p426

;; with-gensyms: Practical Common Lisp (Seibel), p101.
