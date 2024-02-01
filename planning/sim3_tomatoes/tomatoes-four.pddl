(define (problem tomatoes-four)
    (:domain tomatoes)
    
    (:objects
        l1 l2 l3 l4
        t1 t2 t3 t4
    )
    
    (:init
        (LOCATION l1) (LOCATION l2) (LOCATION l3) (LOCATION l4)
        (TOMATO t1) (TOMATO t2) (TOMATO t3) (TOMATO t4)
        (on_table t1) (on_table t2) (on_table t3) (on_table t4) 
        (empty l1) (empty l2) (empty l3) (empty l4) 
    )
    
    (:goal
        (and (at_loc t1 l1) (at_loc t2 l2) (at_loc t3 l3) (at_loc t4 l4))
    )
)