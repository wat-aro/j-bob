(load "./j-bob-lang.scm")
(load "./j-bob.scm")

;; Cons theorem
(dethm atom/cons (x y)
       (equal (atom (cons x y)) 'nil))

(dethm car/cons (x y)
       (equal (car (cons x y)) x))

(dethm cdr/cons (x y)
       (equal (cdr (cons x y)) y))

(J-Bob/step (prelude)
            '(atom (cdr (cons (car (cons p q)) '())))
            '(((1 1 1) (car/cons p q))
              ((1) (cdr/cons p '()))
              (() (atom '()))))
