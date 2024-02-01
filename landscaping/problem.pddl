(define (problem landscape)
    ; let the planner know about the the domain (:domain domainName)
    (:domain landscaping)
    
    ; Introduce objects
    (:objects
        plant_1 plant_2 plant_3 plant_4
        store spot_a spot_b spot_c spot_d
        robot
    )
    
    ; assert the initial state
    (:init 

        (ROBOT robot)

        (SPOT store)
        (SPOT spot_a) (SPOT spot_b) 
        (SPOT spot_c) (SPOT spot_d)

        (is-reachable store spot_a) (is-reachable spot_a store)
        (is-reachable store spot_b) (is-reachable spot_b store)
        (is-reachable spot_a spot_c) (is-reachable spot_c spot_a)
        (is-reachable spot_b spot_d) (is-reachable spot_d spot_b)

        (at-robby store) (free robot)

        (PLANT plant_1) (PLANT plant_2) (PLANT plant_3) (PLANT plant_4)
        (at-plant plant_1 store) (at-plant plant_2 store) (at-plant plant_3 store) (at-plant plant_4 store)

        ; the only place where you can put plant in vase
        (can-put-in-vase store)
    )
    
    ; Assert the goal state(s)
    (:goal (and 
            (at-plant plant_1 spot_a) (with-vase plant_1)
            (at-plant plant_2 spot_b) (with-vase plant_2)
            (at-plant plant_3 spot_c) (with-vase plant_3)
            (at-plant plant_4 spot_d) (with-vase plant_4)
    )
    )
)