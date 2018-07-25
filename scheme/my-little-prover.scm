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
            '(((1 1 1) (car/cons p q))  ; '(atom (cdr (cons p '())))
              ((1) (cdr/cons p '()))    ; '(atom ())
              (() (atom '()))))         ; 't

;; Equal theorem
(dethm equal-same (x)
       (equal (equal x x) 't))

(dethm equal-swap (x y)
       (equal (eqaul x y) (equal y x)))

(dethm equal-if (x y)
       (if (equal x y) (equal x y) 't))

(J-Bob/step (prelude)
            '(car
              (cons (equal (cons x y) (cons x y))
                    '(and crumpets)))
            '(((1 1) (equal-same (cons x y))) ; '(car (cons 't '(and crumpets)))
              (() (car/cons 't '(and crumpets))))) ; 't

(J-Bob/step (prelude)
            '(atom (car (cons (car a) (cdr b))))
            '(((1) (car/cons (car a) (cdr b))))) ; '(atom (car a))

;; If theorem
(dethm if-true (x y)
       (equal (if 't x y) x))

(dethm if-false (x y)
       (equal (if 'nil x y) y))

(dethm if-same (x y)
       (equal (if x y y) y))

(J-Bob/step (prelude)
            '(if (if (equal a 't)
                     a
                     (equal 'or '(black coffee)))
                 c
                 c)
            '(((Q A) (equal-if  a 't))))
