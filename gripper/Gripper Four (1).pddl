(define (problem gripper-four)
    ; let the planner know about the the domain (:domain domainName)
    (:domain gripper)
    
    ; Introduce objects
    (:objects
        room_a room_b
        ball_1 ball_2 ball_3 ball_4
        left right
    )
    
    ; assert the initial state
    (:init 
        ; tell the planner about the rooms, balls and grippers
        (ROOM room_a) (ROOM room_b)
        (BALL ball_1) (BALL ball_2) (BALL ball_3) (BALL ball_4)
        (GRIPPER left) (GRIPPER right)
        ; the robot is initially in room_a
        (at-robby room_a)
        ; All the balls are initially in room_a
        (at-ball ball_1 room_a) (at-ball ball_2 room_a) 
        (at-ball ball_3 room_a) (at-ball ball_4 room_a)
        ; The grippers are free
        (free left) (free right)
    )
    
    ; Assert the goal state(s)
    (:goal (and (at-ball ball_1 room_b) (at-ball ball_2 room_b)
                (at-ball ball_3 room_b) (at-ball ball_4 room_b))
    )
)