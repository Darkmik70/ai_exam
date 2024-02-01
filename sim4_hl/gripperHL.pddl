(define (domain gripperHL)

    (:requirements
        :strips
    )

    (:predicates
        (ROOM ?r) (OBJECT ?o) (GRIPPER ?g)
        (at_robot ?r)
        (at_object ?o ?r)
        (heavy ?o)
        (light ?o)
        (free ?g)
        (different ?g1 ?g2)
        (carrying ?o)
    )

    (:action lift_heavy
        ; lift heavy object ?o in room ?r with grippers g1 and g2
        :parameters (?o ?r ?g1 ?g2)
        :precondition (and 
                        (OBJECT ?o) (ROOM ?r) (GRIPPER ?g1) (GRIPPER ?g2) 
                        (heavy ?o) (at_object ?o ?r) 
                        (at_robot ?r) (free ?g1) (free ?g2) (different ?g1 ?g2))
        :effect (and
                    (carrying ?o)
                    (not (at_object ?o ?r)) (not (free ?g1)) (not (free ?g2)))
    )
    
    (:action put_down_heavy
        ; put down heavy object ?o in room ?r with grippers g1 and g2
        :parameters (?o ?r ?g1 ?g2)
        :precondition (and 
                        (OBJECT ?o) (ROOM ?r) (GRIPPER ?g1) (GRIPPER ?g2) 
                        (heavy ?o) (at_robot ?r) (carrying ?o)
                        (different ?g1 ?g2))
        :effect (and
                     (at_object ?o ?r) (free ?g1) (free ?g2)
                     (not (carrying ?o)))
    )
    
    (:action lift_light
        ; lift light object ?o in room ?r with gripper g
        :parameters (?o ?r ?g)
        :precondition (and 
                        (OBJECT ?o) (ROOM ?r) (GRIPPER ?g)  
                        (light ?o) (at_object ?o ?r) 
                        (at_robot ?r) (free ?g))
        :effect (and
                    (carrying ?o)
                    (not (at_object ?o ?r)) (not (free ?g)))
    )
    
    (:action put_down_light
        ; put down light object ?o in room ?r with grippers g1 and g2
        :parameters (?o ?r ?g)
        :precondition (and 
                        (OBJECT ?o) (ROOM ?r) (GRIPPER ?g)  
                        (light ?o) (at_robot ?r) (carrying ?o))
        :effect (and
                     (at_object ?o ?r) (free ?g) 
                     (not (carrying ?o)))
    )
    
    (:action move
        ; move from room ?from to room ?to
        :parameters (?from ?to)
        :precondition (and 
                        (ROOM ?from) (ROOM ?to) (at_robot ?from))
        :effect (and
                    (at_robot ?to) (not (at_robot ?from)))
    )
   
)