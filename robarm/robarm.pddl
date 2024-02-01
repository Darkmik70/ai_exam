(define (domain robarm)


(:predicates
    ;predicates that define "types" of objects
    (ROOM ?r)
    (NUT ?n)
    (SCREW ?s)
    ;predicates that define the state of affairs
    (robot-at ?r) ; robot is at room ?h
    (nut-at ?n ?r)
    (screw-at ?s ?r)
    (tight-nut ?n) ;robby is in room ?r
    (tight-screw ?s)
)

;operator definitions

;Moving the robot among the rooms (move from x to y)
(:action tighten-nut :parameters (?r ?n)
    :precondition (and (ROOM ?r)(NUT ?n)(nut-at ?n ?r)(robot-at ?r))
    :effect (and (tight-nut ?n))
)

(:action tighten-screw :parameters (?r ?s)
    :precondition (and (ROOM ?r)(SCREW ?s)(screw-at ?s ?r)(robot-at ?r))
    :effect (and (tight-screw ?s))
)

(:action move :parameters (?x ?y)
    :precondition (and (ROOM ?x) (ROOM ?y)(robot-at ?x))
    :effect (and (robot-at ?y) (not (robot-at ?x)))
)

)