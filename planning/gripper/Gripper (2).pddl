(define (domain  gripper)
    ; we require STRIPS planning (classical planning)
    ; tells to the planner to restrict the domain to take into account
    ; all the restrictive assumptions we made (A0 - A7)
    (:requirements :strips)

    ; predicates
    (:predicates
        ; "Type" predicates
        (ROOM ?r) (BALL ?b) (GRIPPER ?g)
        ; The robot is in room x
        (at-robby ?r)
        ; ball is in room x
        (at-ball ?b ?r)
        ; Gripper g is free
        (free ?g)
        ; gripper g is carrtying ball b
        (carry ?g ?b)
    )
    
    ; Operators
    (:action move
        ; move the robot from ?from to room ?to 
        :parameters (?from ?to)
        :precondition (and (ROOM ?from) (ROOM ?to) (at-robby ?from))
        :effect (and (at-robby ?to) (not (at-robby ?from)))    
    )
    
    (:action pickup
        ; picking up the ball ?b in a room ?r with gripper ?g
        :parameters (?b ?r ?g)
        :precondition (and (BALL ?b) (ROOM ?r) (GRIPPER ?g)
                           (at-ball ?b ?r) (at-robby ?r) (free ?g))
        :effect (and (carry ?g ?b) (not (free ?g)) (not (at-ball ?b ?r)))
    )
    
    (:action putdown
        ;put down a ball ?b in a room ?r with gripper ?g
        :parameters (?b ?r ?g)
        :precondition (and (BALL ?b) (ROOM ?r) (GRIPPER ?g)
                           (carry ?g ?b) (at-robby ?r))
        :effect (and (free ?g) (not (carry ?g ?b)) (at-ball ?b ?r))
    )
)


