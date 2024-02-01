(define (problem robarm-two)
    (:domain robarm)
    ;; objects
    (:objects
        room_1 room_2 room_3               ;two rooms
        nut_1 nut_2 ;four balls
        screw_1 screw_2
    )
    ;; initial state
    (:init 
        (ROOM room_1) (ROOM room_2) (ROOM room_3) ;room_a and room_b are rooms
        (NUT nut_1) (NUT nut_2) (SCREW screw_1) (SCREW screw_2)
        (robot-at room_1) (nut-at nut_1 room_1) (nut-at nut_2 room_2)
        (screw-at screw_1 room_2) (screw-at screw_2 room_3) 
        ; Literals that define the initial state of affairs (they change)
        ; robby is initially 
        ; predicates that robot
    )
    
    ;; goal specification
    (:goal (and (robot-at room_1)(tight-nut nut_1) (tight-nut nut_2)
                (tight-screw screw_1) (tight-screw screw_2))
    )
)