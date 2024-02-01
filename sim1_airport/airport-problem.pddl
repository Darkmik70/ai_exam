(define (problem airport-problem)

    (:domain airport)
    
    (:objects 
        a
        car plane
        home airportA airportB
    )
    
    (:init
        (AGENT a)
        (TRANSPORT car) (TRANSPORT plane)
        (LOCATION home) (LOCATION airportA) (LOCATION airportB)
        (can-go car home airportA)
        (can-go plane airportA airportB)
        (at-agent a home)
        (at-transport car home)
        (at-transport plane airportA)
    )
    
    (:goal
        (at-agent a airportB)
    )
)