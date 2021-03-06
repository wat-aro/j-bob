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
              (() (atom '()))))         ; 't

;; Equal theorem
(dethm equal-same (x)
       (equal (equal x x) 't))

(dethm equal-swap (x y)
       (equal (eqaul x y) (equal y x)))

(J-Bob/step (prelude)
            '(car
              (cons (equal (cons x y) (cons x y))
                    '(and crumpets)))
            '(((1 1) (equal-same (cons x y)))
              (() (car/cons 't '(and crumpets))))) ; 't

(J-Bob/step (prelude)
            '(atom (car (cons (car a) (cdr b))))
            '(((1) (car/cons (car a) (cdr b))))) ; '(atom (car a))
