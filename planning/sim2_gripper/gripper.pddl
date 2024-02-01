(define (domain gripper)

    (:requirements :strips)
    
    (:predicates
        ; Predicates to distinguish among objects
        (ROOM ?r) (OBJECT ?o) (GRIPPER ?g)
        ; Objects can be heavy or light
        (heavy ?o)
        (light ?o)
        ; Fluents
        ; The robot is in room ?r
        (at_robby ?r)
        ; The object ?o is in room ?r
        (at_object ?o ?r)
        ; The gripper ?g is free
        (free ?g)
        ; The gripper ?g is carrying object ?o
        (carrying ?g ?o)
        ; Predicate to state that the two grippers ?g1 and ?g2 are different
        (different ?g1 ?g2)
    )
    
    (:action move
        ; move the robot from room ?from to room ?to
        :parameters (?from ?to)
        :precondition (and (ROOM ?from) (ROOM ?to) (at_robby ?from))
        :effect (and (at_robby ?to) (not (at_robby ?from)))
    )
    
    (:action pickup_light
        ; pick up light object ?o in room ?r with gripper ?g
        :parameters (?o ?r ?g)
        :precondition (and (OBJECT ?o) (ROOM ?r) (GRIPPER ?g)
                            (light ?o)
                            (at_robby ?r) (at_object ?o ?r) (free ?g))
        :effect (and (carrying ?g ?o) (not (at_object ?o ?r)) (not (free ?g)))
    )
    
    (:action pickup_heavy
        ; pick up light object ?o in room ?r with grippers ?g1 ?g2
        :parameters (?o ?r ?g1 ?g2)
        :precondition (and (OBJECT ?o) (ROOM ?r) (GRIPPER ?g1) (GRIPPER ?g2)
                            (heavy ?o) (different ?g1 ?g2)
                            (at_robby ?r) (at_object ?o ?r) (free ?g1) (free ?g2))
        :effect (and (carrying ?g1 ?o) (carrying ?g2 ?o) 
                            (not (at_object ?o ?r)) (not (free ?g1)) (not (free ?g2)))
    )
    
    (:action putdown_light
        ; put down object ?o in room ?r with gripper ?g
        :parameters (?o ?r ?g)
        :precondition (and (OBJECT ?o) (ROOM ?r) (GRIPPER ?g)
                            (light ?o)
                            (carrying ?g ?o) (at_robby ?r))
        :effect (and (at_object ?o ?r) (free ?g) (not (carrying ?g ?o)))
    )
    
    (:action putdown_heavy
        ; put down object ?o in room ?r with grippers ?g1 ?g2
        :parameters (?o ?r ?g1 ?g2)
        :precondition (and (OBJECT ?o) (ROOM ?r) (GRIPPER ?g1) (GRIPPER ?g2)
                            (heavy ?o) (different ?g1 ?g2)
                            (carrying ?g1 ?o) (carrying ?g2 ?o) (at_robby ?r))
        :effect (and (at_object ?o ?r) 
                            (free ?g1) (free ?g2)
                            (not (carrying ?g1 ?o)) (not (carrying ?g2 ?o)))
    )

)