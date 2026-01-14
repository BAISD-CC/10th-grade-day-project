extends CharacterBody2D


var SPEED = 500.0
var dir = 1
const JUMP_VELOCITY = -400.0
@onready var timer: Timer = $Timer

func _physics_process(delta: float) -> void:
	velocity.x = SPEED * dir + (Global.score * 1.5) * delta
	move_and_slide()
	

func _on_timer_timeout() -> void:
	get_parent().carCount -=1
	queue_free()
	
