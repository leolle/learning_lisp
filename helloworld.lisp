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
  (if (eql x y)
      x
    (if (> x y)
    x
    y)))

(defun return-max (x y)
  (if (> x y)
      x
    y))
(defun our-member (obj lst)
  (if (null lst)
      nil
    (if (eql (car lst) obj)
        lst
      (our-member obj (cdr lst)))))

(defun our-member (lst)
  (if (null lst)
      nil
  (if (listp (car (cdr lst)))
    T
    (our-member (cdr lst)))))
