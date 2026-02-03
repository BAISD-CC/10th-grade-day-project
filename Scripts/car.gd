extends CharacterBody2D
class_name car
#Nothing should be touched here.
var BaseSPEED :int
var dir = 1
var facing_right = true
#determines which direction it's facing
func _ready() -> void:
	if dir ==1:
		scale.x = abs(scale.x) * 1
		facing_right = true
	else:
		scale.x = abs(scale.x) * -1
		facing_right = false
#Moves based off the baseSpeed(determined in roads), score and the direction(-1,1) 
func _physics_process(delta: float) -> void:
	velocity.x = (BaseSPEED +(Global.score * 2)) * dir
	#destorys the moving object depending on how far it is off the screen, mainly for optimization purposes
	if facing_right and position.x >1300:
		queue_free()
		
	elif not facing_right and position.x < -30:
		queue_free()
		
	
	move_and_slide()

	
