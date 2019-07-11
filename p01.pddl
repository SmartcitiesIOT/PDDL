
(define (problem BLOCKS-4-0)
(:domain isolation-chamber)
(:objects 
p1 - patient r1 - room)
(:init 
    (in p1 r1)

    ;; Set the threshold values here
    ( = (temperature-threshold-low) 15)
    ( = (temperature-threshold-high) 23)
    ( = (humidity-threshold-low) 0.5)
    ( = (humidity-threshold-high) 10)

    (= (temperature r1) 10)

    (= (humidity r1) 12 )
    (= (motion) 0 ))
(:goal (AND 
    (under-control)
))
)
