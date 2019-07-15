
(define (domain isolation-chamber)
  (:requirements :strips :typing :fluents :equality)
  (:types 
  patient room)
  (:predicates 
		   (temperature-control-on)
		   (light-control-on)
		   (humidity-control-on)
		   (motion-alert-on)
		   (uv-alert-on)
		   
		   (temperature-under-control)
		   (light-under-control)
		   (humidity-under-control)
		   (uv-under-control)
		   (motion-under-control)
		   
		   (in ?patient1 - patient ?room1 -room)
	       )

(:functions
	(temperature ?room1 - room)
	(humidity ?room1 - room)
	(luminance ?room1 - room)
	(motion ?room1 - room)
	(uv ?room1 - room)
	(battery)
	(temperature-threshold-low)
	(temperature-threshold-high)
	(humidity-threshold-low)
	(humidity-threshold-high)
	(luminance-threshold-low)
	(luminance-threshold-high)
	(uv-threshold-high)
	(motion-threshold-low)
	(motion-threshold-high)
)

  (:action turn-off-temperature-control
	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 
			( > (temperature ?room1) (temperature-threshold-low))
		 	( < (temperature ?room1) (temperature-threshold-high))
			
		 )

	     :effect
	     (and 
		   (not(temperature-control-on))
		   (temperature-under-control)
		   ))

  (:action turn-on-temperature-control
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 (in ?patient1 ?room1)
		 
		 (or
			 	( < (temperature ?room1) (temperature-threshold-low))
		 		(> (temperature ?room1) (temperature-threshold-high))

			) 

		 )
     	:effect
	     (and 
			(temperature-control-on)
		 	(temperature-under-control)			
			))



  (:action turn-off-humidity-control
	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		
			( > (humidity ?room1) (humidity-threshold-low))
		 	( < (humidity ?room1) (humidity-threshold-high))
			
		 )

	     :effect
	     (and 
		   (not(humidity-control-on))
		   (humidity-under-control)
		   ))

  (:action turn-on-humidity-control
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 (in ?patient1 ?room1)

		 (or
		 		(< (humidity ?room1) (humidity-threshold-low))
		 		(> (humidity ?room1) (humidity-threshold-high))

			) 

		 )
     	:effect
	     (and 
			(humidity-control-on)
		 	(humidity-under-control)			
			))




  (:action turn-on-light-control
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 		 
			(or
		 		(< (luminance ?room1) (luminance-threshold-low))
		 		(> (luminance ?room1) (luminance-threshold-high))
			) 

		) 
		 
     	:effect
	     (and 
			(light-control-on)
		 	(light-under-control)			
			))
 
   (:action turn-off-light-control
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)

			( > (luminance ?room1) (luminance-threshold-low))
		 	( < (luminance ?room1) (luminance-threshold-high))	 
			
		) 
		 
     	:effect
	     (and 
			(not(light-control-on))
		 	(light-under-control)			
			))


  (:action turn-on-uv-alert
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 		 
			( > (uv ?room1) (uv-threshold-high))

		) 
		 
     	:effect
	     (and 
			(uv-alert-on)
		 	(uv-under-control)			
			))
 
   (:action turn-off-uv-alert
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 		 
			( < (uv ?room1) (uv-threshold-high))

		) 
		 
     	:effect
	     (and 
			(not(uv-alert-on))
		 	(uv-under-control)			
			))

  (:action turn-on-motion-alert
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 		 
			( > (motion ?room1) (motion-threshold-low))

		) 
		 
     	:effect
	     (and 
			(motion-alert-on)
		 	(motion-under-control)			
			))
 
   (:action turn-off-motion-alert
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 		 
			( < (motion ?room1) (motion-threshold-high))

		) 
		 
     	:effect
	     (and 
			(not(motion-alert-on))
		 	(motion-under-control)			
			))
		
)

