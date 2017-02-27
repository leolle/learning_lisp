(+ 1 1)
(print "Hello World")
'(+ 3 5)


(defun our-third (x)
  (car (cdr (cdr x))))

(our-third '(a b c d))
