extends CharacterBody2D

@onready var timer: Timer = $Timer

var SPEED = 5
var dir = 1

static var logCount = 0
const maxLogs = 5
func _ready() -> void:
	if logCount < maxLogs:
		logCount +=1
	else:
		queue_free()

func _physics_process(delta: float) -> void:
	position.x += SPEED * dir + (Global.score * 1.5) * delta
	if dir ==1:
		scale.x = abs(scale.x) * 1
	else:
		scale.x = abs(scale.x) * -1
func _on_timer_timeout() -> void:
	logCount -=1
	queue_free()
	
