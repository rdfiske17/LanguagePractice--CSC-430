;; Variable Declarations
;;
;; defvar: define a variable and optionally assign a value
(defvar defined_var 42)
;;
;; setq: set the value of a variable. If it doesn't already exist, create it
;; fix: my version of Lisp doesn't seem to like this. Define it using defvar, modify it using setq...
(defvar set_var 3)
(setq defined_var set_var)

(format t "SetVar: ~a" set_var) ;; ~a prints the variable in readable form, ~% puts a newline after the statement
(format t "DefinedVar: ~a~%" defined_var)
(format t "test")

