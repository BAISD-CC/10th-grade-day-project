extends CharacterBody2D
class_name car

var SPEED = 500
var dir = 1
var facing_right = true
func _ready() -> void:
	var highest = 0
	SPEED = randf_range(500,600)
	if dir ==1:
		scale.x = abs(scale.x) * 1
		facing_right = true
	else:
		scale.x = abs(scale.x) * -1
		facing_right = false
func _physics_process(delta: float) -> void:
	velocity.x =SPEED  * dir  + Global.score
	
	if facing_right and position.x >1280:
		position.x =0
	elif not facing_right and position.x < 0:
		position.x =1280
	
	move_and_slide()

	
