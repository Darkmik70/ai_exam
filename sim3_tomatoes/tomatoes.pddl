(define (domain tomatoes)

    (:requirements :strips)

    (:predicates 
        (TOMATO ?t)
        (LOCATION ?l)
        (on_table ?t)
        (at_loc ?t ?l)
        (empty ?l)
    )

    (:action move_to
        :parameters (?t ?l)
        :precondition (and (TOMATO ?t) (LOCATION ?l)
                            (on_table ?t) (empty ?l))
        :effect (and (at_loc ?t ?l) (not (on_table ?t)) (not (empty ?l)))
    )
)