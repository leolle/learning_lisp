(+ 1 1)
(print "Hello World")
'(+ 3 5)


(defun our-third (x)
  (car (cdr (cdr x))))

(our-third '(a b c d))

(defun return-fourth(list)
  (car (cdr (cdr (cdr list)))))

(return-fourth '(a b c d))

(defun return-max (x y)
  if (eql x y)
    x
    if (> x y)
    x
    y))
