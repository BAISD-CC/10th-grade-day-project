extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
@onready var timer: Timer = $Timer

func _physics_process(delta: float) -> void:
	velocity.x = SPEED 
	move_and_slide()
	

func _on_timer_timeout() -> void:
	queue_free()
