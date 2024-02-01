;Header and description

(define (domain pizzeria)

;remove requirements that are not needed
(:requirements :strips)


(:predicates ;todo: define predicates here
    
    ; predicates that define the 'types'
    (TRAY ?p)
    (HAND ?h)
    (TOPPING ?t)


    ; predicates that define the state of affairs
    (has-dough ?p) ; dough is in the tray
    (has-tomato ?p) ;pizza has tomato
    (has-cheese ?p) ;pizza has cheese
    (has-topping ?p ?t) ;pizza has topping
    (is-baked ?p)
    
    (free ?r) ;is hand free

)

(:action fetch-pizza 
    ; put dough on this pizza tray
    :parameters (?h ?p)
    :precondition (and  (HAND ?h) (TRAY ?p) (free ?h))
    :effect (and (has-dough ?p) (not (free ?h)))
)
; Robot puts tomato
(:action  put-tomato
    ; robot ;r puts tomato on tray ;t
    :parameters (?p)
    :precondition (and (has-dough ?p))
    :effect (and (has-tomato ?p) (not (has-dough ?p))) ;has-dough tells if it only has dough
)

(:action  put-cheese
    ; robot puts cheese on tray ;t
    :parameters (?p)
    :precondition (and (TRAY ?p) (has-tomato ?p))
    :effect (and (has-cheese ?p) (not (has-tomato ?p))) 
)

(:action put-topping
    ; puts topping on the tray
    :parameters (?p ?t)
    :precondition (and (TRAY ?p) (TOPPING ?t) (has-cheese ?p) (not (is-baked ?p)))
    :effect (and (has-topping ?p ?t))
)   

(:action bake
    :parameters(?h ?p)
    :precondition (and (TRAY ?p) (HAND ?h) (has-cheese ?p))
    :effect (and (is-baked ?p) (free ?h) (not (has-cheese ?p))
)
)
)
