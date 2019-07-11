(define (problem problem1)

  (:domain isolation-chamber)

  (:objects 
    abc - room
    x - patient
    hvac alarm - actuator
    ;temperature humidity motion uv battery - sensor
    )
  (:init 
    (in x abc)
    (room abc)
    (= (hvac-on) 0)
    (= (temperature) 29 )
    (= (humidity) 2 )
    (= (motion) 0 )
  )
  (:goal 
  (= (temperature) 23)
  )

  )