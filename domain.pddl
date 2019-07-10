
;Header and description

(define (domain isolation-chamber)

;remove requirements that are not needed
;:strips :fluents  :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality
(:requirements :equality :fluents :typing :negative-preconditions)

(:types room patient actuator sensor  ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

; un-comment following line if constants are needed
;(:constants 
;)

(:predicates ;todo: define predicates here
	(in ?x-patient ?abc-room)
	(hvac-on)
	(light-on)
	;( ?x-patient ?108-room)
	;(and (> ?temperature-sensor 20) (< ?temperature-sensor 24))
	;(and (> ?humidity-sensor 0.5) (< ?temperature-sensor 1))
	;(< ?UV-sensor 0.6)

)


(:functions ;todo: define numeric functions here
)


(:action turn-on-hvac
	:parameters (?temperature-sensor)
	:precondition (or (> (temperature-sensor) 24) 
						(or (< (humidity-sensor) 0.1) (> (humidity-sensor) 0.8))
						 )
	:effect (and (hvac-on)
	(= (temperature-sensor) 22)
	)

 ;todo: define numeric functions here
)


(:action turn-off-hvac
	:parameters (?temperature-sensor)
	:precondition (and (< ?temperature-sensor 20) 
						(or (< ?humidity-sensor 0.1) (> ?temperature-sensor 0.8))
						 )
	:effect (not(hvac-on)
		(increase (?temperature-sensor) 1)
	)

 ;todo: define numeric functions here
)

)