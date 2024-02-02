
(define (domain loose_nuts)

(:requirements :strips)

(:predicates
    (ROOM ?r) (SCREW ?s) (NUT ?n)

    ; We need to know where our robot is
    (at_robot ?r)

    ; define if screw or nut is fixed
    (is-tight-nut ?n)
    (is-tight-screw ?s)
    
    ; nut ?n screw ?s is in room ?r
    (at-nut ?n ?r)
    (at-screw ?s ?r)
)

(:action move
    ; move from room ?from to room ?to
    :parameters (?from ?to)
    :precondition (and 
                    (ROOM ?from) (ROOM ?to) (at_robot ?from))
    :effect (and
                (at_robot ?to) (not (at_robot ?from)))
    )

(:action fix-screw
    ; tighten up screw ?s in room ?r
    :parameters (?r ?s)
    :precondition (and 
                (ROOM ?r) (SCREW ?s) (at-screw ?s ?r)
                (at_robot ?r))
    :effect(and (is-tight-screw ?s))
)

(:action fix-nut
    ; tighten up nut ?n in room ?r
    :parameters (?r ?n)
    :precondition (and 
                (ROOM ?r) (NUT ?n) (at-nut ?n ?r)
                (at_robot ?r))
    :effect(and (is-tight-nut ?n))
)   
)
