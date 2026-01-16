extends CharacterBody2D


var SPEED = 10
var dir = 1
@onready var timer: Timer = $Timer

func _physics_process(delta: float) -> void:
	position.x += SPEED * dir + (Global.score * 1.5) * delta
	if dir ==1:
		scale.x = abs(scale.x) * 1
	else:
		scale.x = abs(scale.x) * -1
func _on_timer_timeout() -> void:
	get_parent().logCount -=1
	queue_free()
	
