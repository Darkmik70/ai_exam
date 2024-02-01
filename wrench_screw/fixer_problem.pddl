(define (problem fixer_problem) (:domain fixer)
(:objects
    room_1 room_2 room_3
    screw_1 screw_2 nut_2 screw_3
)

(:init
    (ROOM room_1) (ROOM room_2) (ROOM room_3)
    (SCREW screw_1) (SCREW screw_2) (SCREW screw_3)
    (NUT nut_2)

    (at-robot room_1)

    (at-screw screw_1 room_1)
    (at-screw screw_2 room_2) (at-screw screw_3 room_3)
    (at-nut nut_2 room_2)
    (not (tight-screw screw_1)) (not (tight-screw screw_2)) (not (tight-screw screw_3))
    (not (tight-nut nut_2)) 

)

(:goal (and (at-robot room_1) (tight-screw screw_1)
            (tight-nut nut_2) (tight-screw screw_2)
            (tight-screw screw_3)
)
)
)


