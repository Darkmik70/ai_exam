;Header and description

(define (domain tsp)

;remove requirements that are not needed
(:requirements :strips)


(:predicates ;todo: define predicates here
    
    (CITY ?c)
    (MAN ?m)

    ; has salesman seen the city
    (has-seen ?c)

    ; are the two cities connected
    (is-connected ?c1 ?c2)
    
    

    ; in which room robot is
    (at-robot ?r) 
    
    ; where nuts and bolts are
    (at-nut ?n ?r)
    (at-screw ?s ?r)

    ; nuts and bolts are tight
    (tight-nut ?n)
    (tight-screw ?s)
)
)


(:action move
    
)

;define actions here

)