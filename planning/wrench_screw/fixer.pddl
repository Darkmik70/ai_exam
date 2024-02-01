;Header and description

(define (domain fixer)

;remove requirements that are not needed
(:requirements :strips )

(:predicates ;todo: define predicates here
        
    (ROOM ?r)
    (NUT ?n)
    (SCREW ?s)

    ; in which room robot is
    (at-robot ?r) 
    
    ; where nuts and bolts are
    (at-nut ?n ?r)
    (at-screw ?s ?r)

    ; nuts and bolts are tight
    (tight-nut ?n)
    (tight-screw ?s)
)


; Operators

(:action move ;move ?from room ?to room  
    :parameters(?from ?to) 
    :precondition (and (ROOM ?from) (ROOM ?to) (at-robot ?from))
    :effect (and (not (at-robot ?from)) (at-robot ?to) )
)

(:action screw ; tighten up loose screws
    ; robot ?bob tightens up the screw in room ?r
    :parameters (?r ?s)
    :precondition (and (ROOM ?r) (at-robot ?r)
                       (SCREW ?s) (at-screw ?s ?r)
                       (not (tight-screw ?s)) )
    :effect (and  (tight-screw ?s) )
)

(:action wrench ; tighten up loose wrenchs
    ; robot ?bob tightens up the wrench in room ?r
    :parameters (?r ?wrench)
    :precondition (and (ROOM ?r) (at-robot ?r)
                       (NUT ?wrench) (at-nut ?wrench ?r)
                       (not (tight-nut ?wrench)) )
    :effect (and  (tight-nut ?wrench) )
)

)