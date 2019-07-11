

(define (domain isolation-chamber)
  (:requirements :strips :typing :fluents)
  (:types block
  patient room)
  (:predicates (on ?x - block ?y - block)
	       (ontable ?x - block)
	       (clear ?x - block)
	       (handempty)
		   (hvac-on)
		   (light-on)
		   (under-control)
	       (holding ?x - block)
		   (in ?patient1 - patient ?room1 -room)
	       )

(:functions
	(temperature ?room1 - room)
	(humidity)
	(motion)
	(uv)
	(battery)
)

  (:action turn-off-hvac
	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 (in ?patient1 ?room1)
		 (< (temperature ?room1) 24)) 
	     :effect
	     (and 
		 ;(not (holding ?x))
		  ; (clear ?x)
		   (not(hvac-on))
		   (under-control)
		   ( decrease (temperature ?room1) 1)
		   ;(ontable ?x)
		   ))

  (:action turn-on-hvac
  	     :parameters (?patient1 - patient ?room1 - room)
	     :precondition (and 
		 (in ?patient1 ?room1)
		 (> (temperature ?room1) 23))
     	:effect
	     (and 
			(hvac-on)
		 	(under-control)
			 ( increase (temperature ?room1) 1)
			
			))


 
		
)

