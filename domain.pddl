

(define (domain isolation-chamber)
  (:requirements :strips :typing :fluents)
  (:types 
  patient room)
  (:predicates 
		   (hvac-on)
		   (light-on)
		   (hvac-under-control)
		   (light-under-control)
		   (in ?patient1 - patient ?room1 -room)
	       )

(:functions
	(temperature ?room1 - room)
	(humidity ?room1 - room)
	(luminance ?room1 - room)
	(motion)
	(uv)
	(battery)
	(temperature-threshold-low)
	(temperature-threshold-high)
	(humidity-threshold-low)
	(humidity-threshold-high)
	(luminance-threshold-low)
	(luminance-threshold-high)
)

  (:action turn-off-hvac
	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 ;(< (temperature ?room1) (temperature-threshold-low) )
		 
			( > (temperature ?room1) (temperature-threshold-low))
		 	( < (temperature ?room1) (temperature-threshold-high))

			( > (humidity ?room1) (humidity-threshold-low))
		 	( < (humidity ?room1) (humidity-threshold-high))
			
		 )

	     :effect
	     (and 
		   (not(hvac-on))
		   (hvac-under-control)
		   ))

  (:action turn-on-hvac
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 (in ?patient1 ?room1)
		 ;(> (temperature ?room1) (temperature-threshold-high) )
		 
		 (or
			 	( < (temperature ?room1) (temperature-threshold-low))
		 		(> (temperature ?room1) (temperature-threshold-high))

		 		(< (humidity ?room1) (humidity-threshold-low))
		 		(> (humidity ?room1) (humidity-threshold-high))
			) 
		 

		 )
     	:effect
	     (and 
			(hvac-on)
		 	(hvac-under-control)			
			))

  (:action turn-on-light
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 		 
			( < (luminance ?room1) (luminance-threshold-low))

		) 
		 
     	:effect
	     (and 
			(light-on)
		 	(light-under-control)			
			))
 
		
)

