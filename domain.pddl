
;Header and description

(define (domain isolation-chamber)

;remove requirements that are not needed
;:strips :fluents  :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality
(:requirements :equality :fluents :negative-preconditions :typing)

(:types room patient actuator sensor;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

; un-comment following line if constants are needed
;(:constants 
;)

(:predicates ;todo: define predicates here
	(patient ?x)
	(room ?abc)
	;(sensor ?temperature ?humidity ?motion ?uv ?battery)
	;(sensor ?temperature ?humidity ?motion)
	(actuator ?hvac ?alarm)
	(in ?x ?abc)



	;( ?x-patient ?108-room)
	;(and (> ?temperature-sensor 20) (< ?temperature-sensor 24))
	;(and (> ?humidity-sensor 0.5) (< ?temperature-sensor 1))
	;(< ?UV-sensor 0.6)

)


(:functions ;todo: define numeric functions here
	(temperature)
	(humidity)
	(motion)
	(uv)
	(battery)
	(hvac-on)
	(light-on)
)


(:action turn-on-hvac
	:parameters ()
	:precondition (or (> (temperature) 24) 
						(or (< (humidity) 0.1) (> (humidity) 0.8))
						 )
	:effect (and 
	(increase (hvac-on) 1)
	( decrease (temperature) 1)
	)

 ;todo: define numeric functions here
)


(:action turn-off-hvac
	:parameters ()
	:precondition (and (< (temperature) 20) 
						(or (< (humidity) 0.1) (> (humidity) 0.8))
						;(= (hvac-on) 1))
						 )
	:effect (and 
		(decrease (hvac-on) 1)
		( increase (temperature) 1)
	)

 ;todo: define numeric functions here
)

)