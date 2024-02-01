;Header and description

(define (domain tsp)

;remove requirements that are not needed
(:requirements :strips)


(:predicates ;todo: define predicates here
    
    (CITY ?c)
    
    (AGENT ?a)

    ; agent is in the city
    (at-agent ?c)

    ; salesman needs to visit the city
    (to-see ?c)

    ; salesman has seen this city
    (has-seen ?c)

    ; are the two cities connected
    (is-connected ?c1 ?c2)

)

(:action move
    :parameters (?from ?to ?a)
    :precondition (and 
        (CITY ?from) (CITY ?to) (AGENT ?a)
        (is-connected ?from ?to) (to-see ?to) (at-agent ?from)
    )
    :effect (and 
        (not (at-agent ?from)) (at-agent ?to) (not (to-see ?to)) (has-seen ?to))
    )
)
