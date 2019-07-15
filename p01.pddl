
(define (problem patient-monitor)
(:domain isolation-chamber)
(:objects 
p1 - patient r1 - room)
(:init 
    (in p1 r1)

    ;; Set the threshold values here
    ( = (temperature-threshold-low) 15)
    ( = (temperature-threshold-high) 23)
    ( = (humidity-threshold-low) 30)
    ( = (humidity-threshold-high) 50)
    ( = (luminance-threshold-low) 0.5)
    ( = (luminance-threshold-high) 10)
    ( = (uv-threshold-high) 1.5)
    ( = (motion-threshold-low) 0)
    ( = (motion-threshold-high) 2)

    ;; Set the current sensor readings here
    (= (temperature r1) 25.0)
    (= (humidity r1) 45.0)
    (= (luminance r1) 12.56)
    (= (motion r1) 1.0)
    (= (uv r1) 1.6)
)
(:goal (AND 
    (hvac-under-control)
    (light-under-control)
    (shade-under-control)
    (record-under-control)
))
)
