(defrule cogerDatosTiradorEl "coger datos"

  ?el <- (tirador (id el) (edad ?edadEl)(altura ?alturaEl)(puno ?punoEl)(intimidado ?intimidadoEl))
  ?yo <- (tirador (id yo) (edad ?edadYo)(altura ?alturaYo)(puno ?punoYo))
  ;(test (> ?edadEl ?edadYo))
  =>
    (assert
        (alturaEl ?alturaEl)(alturaYo ?alturaYo)
        (edadEl ?edadEl)(edadYo ?edadYo)
        (punoEl ?punoEl)(punoYo ?punoYo)
        (intimidadoEl ?intimidadoEl)
    )

    (retract ?el)
    (retract ?yo)
)


;---------------------------------
;
;       Sacamos la altura
;
;----------------------------------




(defrule compararAltura1
  (alturaEl ?x)(alturaYo ?y)
  (test (> ?x ?y))
  (test (> (- ?x ?y) 5)) ;seria para comprobar que la diferencia es mayor que 5
  =>
  (assert (altura masEl))
)

(defrule compararAltura1_2
  (alturaEl ?x)(alturaYo ?y)
  (test (> ?x ?y))
  (test (<= (- ?x ?y) 5)) ;seria para comprobar que la diferencia es mayor que 5
  =>
  (assert (altura igual))
)

(defrule compararAltura2_1
  (alturaEl ?x)(alturaYo ?y)
  (test (< ?x ?y))
  =>
  (assert (altura masYo))
)

(defrule compararAltura2_2
  (alturaEl ?x)(alturaYo ?y)
  (test (<= ?x ?y))
  (test (<= (- ?y ?x) 5)) ;seria para comprobar que la diferencia es mayor que 5

  =>
  (assert (altura igual))
)


