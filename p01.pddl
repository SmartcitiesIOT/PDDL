
(define (problem BLOCKS-4-0)
(:domain isolation-chamber)
(:objects D B A C - block
p1 - patient r1 - room)
(:init 
    (not(hvac-on))
    (not(light-on))
    (in p1 r1)
    (= (temperature r1) 25)
    (= (humidity) 2 )
    (= (motion) 0 ))
(:goal (AND 
    (under-control)
    (= (temperature r1) 28)
))
)
