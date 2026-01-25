extends CharacterBody2D
class_name car

var SPEED = 600
var SecondarySPEED = randf_range(-300,300)
var dir = 1
var facing_right = true
func _ready() -> void:
	var highest = 0
	if dir ==1:
		scale.x = abs(scale.x) * 1
		facing_right = true
	else:
		scale.x = abs(scale.x) * -1
		facing_right = false
func _physics_process(delta: float) -> void:
	velocity.x =( SPEED  * dir ) + SecondarySPEED + (Global.score * 2)
	if facing_right and position.x >1290:
		position.x =0
		randomizeSpeed()
	elif not facing_right and position.x < -10:
		position.x =1280
		randomizeSpeed()
	
	move_and_slide()
func randomizeSpeed():
	SecondarySPEED = randf_range(-300,300)
	
