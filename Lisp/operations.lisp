;; Test how basic arithmetic expressions are represented in Lisp. Submit a few expressions.

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