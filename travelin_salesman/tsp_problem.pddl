(define (problem tsp_problem) (:domain tsp)
(:objects
    agent
    savona genova bologna verona milano torino
)

(:init
    (CITY savona) (CITY genova) (CITY bologna)
    (CITY verona) (CITY milano) (CITY torino)

    (AGENT agent)

    (at-agent genova)

    (is-connected savona genova) (is-connected genova savona)
    (is-connected savona torino) (is-connected torino savona)
    (is-connected torino genova) (is-connected genova torino)
    (is-connected torino milano) (is-connected milano torino)   
    (is-connected genova milano) (is-connected milano genova) 
    (is-connected genova bologna) (is-connected bologna genova)
    (is-connected bologna milano) (is-connected milano bologna)
    (is-connected bologna verona) (is-connected verona bologna)
    (is-connected verona milano) (is-connected milano verona)

    (to-see savona) (to-see genova) (to-see bologna) (to-see verona)
    (to-see milano) (to-see torino)
)

(:goal (and (at-agent genova)
        (has-seen savona) (has-seen genova) (has-seen bologna)
        (has-seen verona) (has-seen milano) (has-seen torino))
)
)


