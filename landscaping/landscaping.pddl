(define (domain  landscaping)
    ; we require STRIPS planning (classical planning)
    ; tells to the planner to restrict the domain to take into account
    ; all the restrictive assumptions we made (A0 - A7)
    (:requirements :strips)

    ; predicates
    (:predicates
        ; "Type" predicates
        (ROBOT ?r) (PLANT ?p)
        (SPOT ?s)

        
        ; plant ?p is in spot ?s
        (at-plant ?p ?s)
        ; The robot is in room x
        (at-robby ?s)
        ; The vase ?v is in spot ?s
        (at-vase ?v ?s)
        ; robot ?r is free
        (free ?r)
        ; robot ?r carries plant ?p
        (carry-plant ?r ?p)
        
        ; plant ?p is in vase x
        (with-vase ?p)

        ; you can only put this one in vase in the store
        (can-put-in-vase ?s)
        
        ; checks whether spots are connected
        (is-reachable ?s1 ?s2)
    )
    
    ; Operators
    (:action move
        ; move the robot from ?from to room ?to 
        :parameters (?from ?to)
        :precondition (and (SPOT ?from) (SPOT ?to)
                         (at-robby ?from)  (is-reachable ?from ?to))
        :effect (and (at-robby ?to) (not (at-robby ?from)))    
    )
    
    (:action pickup-plant
        ; picking up the plant ?p in spot ?s with gripper ?r
        :parameters (?p ?s ?r)
        :precondition (and (PLANT ?p) (SPOT ?s) (ROBOT ?r)
                           (at-plant ?p ?s) (at-robby ?s) (free ?r)
                           )
        :effect (and (carry-plant ?r ?p) (not (free ?r)) (not (at-plant ?p ?s)))
    )

    (:action put-in-vase
        ;put down a ball ?b in a room ?r with gripper ?g
        :parameters (?p ?r ?s ?v)
        :precondition (and (PLANT ?p) (ROBOT ?r) (SPOT ?s) 
                           (carry-plant ?r ?p) (at-robby ?s)
                           )
        :effect (and (free ?r) (not (carry-plant ?r ?p)) (at-plant ?p ?s) (with-vase ?p))
    )

    (:action put-down-plant
        ;put down a plant ?p in a spot ?s with robot r
        :parameters (?p ?r ?s)
        :precondition (and (PLANT ?p) (ROBOT ?r) (SPOT ?s) 
                           (carry-plant ?r ?p) (at-robby ?s))
        :effect (and (free ?r) (not (carry-plant ?r ?p)) (at-plant ?p ?s))
    )

)


