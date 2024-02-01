(define (problem problem_name) (:domain pizzeria)
(:objects 
    robot
    pizza_1 pizza_2 pizza_3
    ham salami olives mushrooms
)

(:init
    (TRAY pizza_1) (TRAY pizza_2) (TRAY pizza_3)
    (HAND robot)
    (TOPPING ham) (TOPPING salami) (TOPPING olives) (TOPPING mushrooms)

    (free robot)
)

(:goal (and (is-baked pizza_1) 
            (is-baked pizza_2) (has-topping pizza_2 olives)
            (is-baked pizza_3) (has-topping pizza_3 mushrooms))
)
)
