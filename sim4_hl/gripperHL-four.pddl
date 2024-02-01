(define (problem gripperHL-four)

    (:domain gripperHL)

    (:objects 
        room_1 room_2 room_3 room_4
        object_1 object_2 object_3 object_4
        left right
    )
    
    (:init 
        (ROOM room_1) (ROOM room_2) (ROOM room_3) (ROOM room_4)
        (OBJECT object_1) (OBJECT object_2) (OBJECT object_3) (OBJECT object_4)
        (GRIPPER left) (GRIPPER right)
        (heavy object_1) (heavy object_2) (light object_3) (light object_4)
        (at_robot room_1)
        (at_object object_1 room_2)
        (at_object object_2 room_3)
        (at_object object_3 room_2)
        (at_object object_4 room_3)
        (free left)
        (free right)
        (different left right)
    )
    
    (:goal
        ; All objects should be in room 4
        (and
            (at_object object_1 room_4)
            (at_object object_2 room_4)
            (at_object object_3 room_4)
            (at_object object_4 room_4)
        )        
    
    )

)