

(define (domain isolation-chamber)
  (:requirements :strips :typing :fluents :equality)
  (:types 
  patient room)
  (:predicates 
		   (hvac-on)
		   (light-on)
		   (shade-on)
		   (record-on)
		   (hvac-under-control)
		   (light-under-control)
		   (shade-under-control)
		   (record-under-control)
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

  (:action turn-on-light-adjust
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 		 
			(or
			 	( < (luminance ?room1) (luminance-threshold-low))
		 		(> (luminance ?room1) (luminance-threshold-high))

		 		(< (luminance ?room1) (luminance-threshold-low))
		 		(> (luminance ?room1) (luminance-threshold-high))
			) 

		) 
		 
     	:effect
	     (and 
			(light-on)
		 	(light-under-control)			
			))
 
   (:action turn-off-light-adjust
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)

			( > (luminance ?room1) (luminance-threshold-low))
		 	( < (luminance ?room1) (luminance-threshold-high))

			( > (luminance ?room1) (luminance-threshold-low))
		 	( < (luminance ?room1) (luminance-threshold-high))	 
			

		) 
		 
     	:effect
	     (and 
			(not(light-on))
		 	(light-under-control)			
			))


  (:action turn-on-shade
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 		 
			( > (uv ?room1) (uv-threshold-high))

		) 
		 
     	:effect
	     (and 
			(shade-on)
		 	(shade-under-control)			
			))
 
   (:action turn-off-shade
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 		 
			( < (uv ?room1) (uv-threshold-high))

		) 
		 
     	:effect
	     (and 
			(not(shade-on))
		 	(shade-under-control)			
			))

  (:action turn-on-record
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 		 
			( > (motion ?room1) (motion-threshold-low))

		) 
		 
     	:effect
	     (and 
			(record-on)
		 	(record-under-control)			
			))
 
   (:action turn-off-record
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 	(in ?patient1 ?room1)
		 		 
			( < (motion ?room1) (motion-threshold-high))

		) 
		 
     	:effect
	     (and 
			(not(record-on))
		 	(record-under-control)			
			))
		
)

