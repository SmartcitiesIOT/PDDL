(define (problem problem1)
  (:domain isolation-chamber)
  (:objects 
    108 - room
    patient1 - patient
    hvac alarm - actuator
     humidity motion uv battery - sensor)
  (:init 
    (= (temperature-sensor) 29)
    (= (humidity-sensor) 2)
  )
  (:goal 
  (= (temperature-sensor) 23)
  )

  )