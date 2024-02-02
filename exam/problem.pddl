(define (problem loose_nuts_problem) (:domain loose_nuts)
(:objects 
    room_1 room_2 room_3 room_4
    nut_1 screw_2 nut_2 screw_3 screw_4

    
)

(:init
    (ROOM room_1) (ROOM room_2) (ROOM room_3) (ROOM room_4)
    (NUT nut_1) (NUT nut_2) (SCREW screw_2) (SCREW screw_3)
    (SCREW screw_4)
    
    (at-nut nut_1 room_1)
    (at-nut nut_2 room_2) (at-screw screw_2 room_2)
    (at-screw screw_3 room_3)
    (at-screw screw_4 room_4)
    
    ; robot is initially in the room_1
    (at_robot room_1)
)

(:goal (and 
    (at_robot room_1) 
    (is-tight-nut nut_1)
    (is-tight-screw screw_2) (is-tight-nut nut_2)
    (is-tight-screw screw_3)
    (is-tight-screw screw_4)
))

)




