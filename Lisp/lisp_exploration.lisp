;; Lisp Exploration Project - CSC-430 - Riley Fiske

(format t "1. Test how basic arithmetic expressions are represented in Lisp. Submit a few expressions.~%")
;; Information on different arithmetic expressions from https://www.tutorialspoint.com/lisp/lisp_arithmetic_operators.htm

(defvar a 3) ;; defining a and setting it to 10
(defvar b 17) ;; defining b and setting it to 20
(defvar c) ;; this will be the result

;; add a and b

(setq c (+ a b)) ;; set the value of c to the sum of a and b
(format t "Addition: ~a + ~a = ~a~%" a b c) ;; print text, variable + variable = variable newline with var1 = a, var2 = b, var3 = c

;; subtract a from b

(setq c (- b a)) ;; set the value of c to the difference of b and a
(format t "Subtraction: ~a - ~a = ~a~%" b a c) ;; same print text idea

;; subtract b from a

(setq c (- a b)) ;; set the value of c to the difference of a and b
(format t "Subtraction: ~a - ~a = ~a~%" a b c)

;; multiply a by b

(setq c (* a b)) ;; set the value of c to the product of a and b
(format t "Multiplication: ~a * ~a = ~a, Shockingly!~%" a b c)

;; divide c by b

(setq a (/ c b)) ;; set the value of a to the quotient of c and b
(format t "Division: ~a / ~a = ~a, surprisingly, 51 is not prime!~%" c b a)

;; modulus of b by a

(setq c (mod b a)) ;; set the value of c to b mod a
(format t "Modulus: ~a modulus ~a = ~a~%" b a c)

;; incrementation

(defvar incrementer 2)
(defvar d a)
(incf d incrementer) ;; increment the value of d by the value of the incrementer 
(format t "Incrementation: ~a incremented by ~a is ~a~%" a incrementer d)

;; decrementation

(setq incrementer 3)
(setq d b)
(decf d incrementer)
(format t "Decrementation: ~a decremented by ~a is ~a~%" b incrementer d)

;; -----------------------------------------------------------------------------------------------------

(format t "2. Write a program that reverses a list of atoms (values). Make sure to include detailed comments within the program explaining the purpose of each statement and how it works. Submit the code.~%")
;; Information gathered using ChatGPT as a consultant on how to do certain tasks throughout (i.e. how to define an array, create loops, create functions, set atom values, setf vs. setq, error handling)

;; Notes: set arrays using (make-array num_elements :initial-element x [sets default value])

(defvar array-length 5) ;; define interger to set a number of elements in the array
(defvar array-to-reverse (make-array array-length :initial-element 0)) ;; defined an array of array-length elements with initial values of 0 for each atom
(defvar extracted-value 0) ;; used in the function
(defvar new-array-index 0) ;; used in the function
(defvar new-array (make-array array-length :initial-element 0)) ;; used in the function and the name of the output array

(dotimes (j array-length) ;; loop array-length number of times

    (setf (aref array-to-reverse j) (random 100)) ;; set each atom in the array-to-reverse to a random integer 0-100 --- ChatGPT guided this answer through asking "random integers in Lisp" and receiving information on the (random limit) function

)

(defun invert-array (orig-array) ;; define a function to invert an inserted array and give back an inverted array

    (dotimes (i array-length) ;; loop array-length number of times

        ;;(setq i (decf i 1))
        ;;(format t "i: ~a~%" i)
        ;;(format t "orig-array[i]: ~a~%" (aref orig-array i ))
        (setf extracted-value (aref orig-array i)) ;; set value to the i-th element of the inserted array
        ;;(format t "~a~%" extracted-value)
        (setq new-array-index (- array-length i 1)) ;; set value of index in the new array to insert into
        ;;(format t "New array index: ~a~%" new-array-index)
        (setf (aref new-array new-array-index) extracted-value) ;; set value of new-array-index-th atom to extracted-value

    )

    ;;(format t "~a" new-array)
    new-array ;; the output of the function
)

(defun print-array (array-to-print) ;; define a function to print out the atoms of an array

    (dotimes (k array-length) ;; loop array-length number of times
    
        (format t "~a " (aref array-to-print k)) ;; print out the k-th element of the array

    )

    (format t "~%") ;; add a linebreak

)


(format t "Original Array: ")
(print-array array-to-reverse) ;; print out the array that will be inverted

(setf new-array (invert-array array-to-reverse)) ;; set the array to the output of the invert-array function on the array-to-reverse

(format t "Inverted Array: ")
(print-array new-array) ;; print out the reversed array