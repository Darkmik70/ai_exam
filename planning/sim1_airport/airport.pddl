(define (domain airport)

    (:requirements :strips)

    (:predicates
        (AGENT ?a)
        (LOCATION ?l)
        (TRANSPORT ?t)
        (at-agent ?a ?l)
        (at-transport ?t ?l)
        (in ?a ?t)
        (can-go ?t ?from ?to)
    )

    (:action board
        :parameters (?a ?t ?l)
        :precondition (and (AGENT ?a) (TRANSPORT ?t) (LOCATION ?l)
                            (at-agent ?a ?l) (at-transport ?t ?l))
        :effect (and (in ?a ?t) (not (at-agent ?a ?l)))
    )
    
    (:action unboard
        :parameters (?a ?t ?l)
        :precondition (and (AGENT ?a) (TRANSPORT ?t)
                            (in ?a ?t) (at-transport ?t ?l))
        :effect (and (at-agent ?a ?l) (not (in ?a ?t)))
    )
    
    (:action move
        :parameters (?a ?t ?from ?to)
        :precondition (and (AGENT ?a) (TRANSPORT ?t) (LOCATION ?from) (LOCATION ?to)
                            (at-transport ?t ?from) (in ?a ?t) (can-go ?t ?from ?to))
        :effect (and (at-transport ?t ?to) (not (at-transport ?t ?from)))
    )
)