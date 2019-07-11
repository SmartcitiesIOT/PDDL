

(define (domain isolation-chamber)
  (:requirements :strips :typing :fluents)
  (:types 
  patient room)
  (:predicates 
		   (hvac-on)
		   (light-on)
		   (under-control)
		   (in ?patient1 - patient ?room1 -room)
	       )

(:functions
	(temperature ?room1 - room)
	(humidity ?room1 - room)
	(motion)
	(uv)
	(battery)
	(temperature-threshold-low)
	(temperature-threshold-high)
	(humidity-threshold-low)
	(humidity-threshold-high)
)

  (:action turn-off-hvac
	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 (in ?patient1 ?room1)
		 (< (temperature ?room1) (temperature-threshold-low) )
		 ) 
	     :effect
	     (and 
		   (not(hvac-on))
		   (under-control)
		   ))

  (:action turn-on-hvac
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 (in ?patient1 ?room1)
		 (> (temperature ?room1) (temperature-threshold-high) ))
     	:effect
	     (and 
			(hvac-on)
		 	(under-control)			
			))


 
		
)

