
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
    ( = (luminance-threshold-low) 0.5)
    ( = (luminance-threshold-high) 10)

    ;; Set the current sensor readings here
    (= (temperature r1) 17)
    (= (humidity r1) 8 )
    (= (luminance r1) 0.2 )
    (= (motion) 0 ))
(:goal (AND 
    (hvac-under-control)
    (light-under-control)
))
)
