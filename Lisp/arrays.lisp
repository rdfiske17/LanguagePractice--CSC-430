;; set arrays using (make-array num_elements :initial-element x [sets default value])

;; TODO: comment code, combine files, then do a write-up

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