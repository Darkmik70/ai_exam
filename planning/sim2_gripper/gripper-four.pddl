(define (problem gripper-four)

    (:domain gripper)
    
    (:objects
        room_1 room_2 room_3 room_4
        object_1 object_2 object_3 object_4
        left right
    )
    
    (:init
        (ROOM room_1) (ROOM room_2) (ROOM room_3) (ROOM room_4)
        (OBJECT object_1) (OBJECT object_2) (OBJECT object_3) (OBJECT object_4)
        (GRIPPER left) (GRIPPER right)
        (heavy object_1) (heavy object_3)
        (light object_2) (light object_4)
        ; The robot is initially in room_1
        (at_robby room_1)
        ; The grippers are empty
        (free left) (free right)
        ; The grippers are different
        (different left right)
        ; The objects are placed inside room 2 and room 3
        (at_object object_1 room_2) (at_object object_2 room_2)
        (at_object object_3 room_3) (at_object object_4 room_3)
    )

    (:goal
        (and (at_object object_1 room_4) (at_object object_2 room_4)
             (at_object object_3 room_4) (at_object object_4 room_4))
    )
; OPTIMAL PLAN
;(move room_1 room_2)
;(pickup_light object_2 room_2 left)
;(move room_2 room_3)
;(pickup_light object_4 room_3 right)
;(move room_3 room_4)
;(putdown_light object_2 room_4 left)
;(putdown_light object_3 room_4 right)
;(move room_4 room_2)
;(pickup_heavy object_1 room_2 left right)
;(move room_2 room_4)
;(putdown_heavy object_1 room_4 left right)
;(move room_4 room_3)
;(pickup_heavy object_3 room_3 left right)
;(move room_3 room_4)
;(putdown_heavy object_3 room_4 left right)



)