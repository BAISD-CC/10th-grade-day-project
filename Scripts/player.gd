extends CharacterBody2D
var targetPos:Vector2
var moving :=false
func _ready() -> void:
	targetPos = global_position

func _process(delta: float) -> void:

	if moving:
		global_position = global_position.move_toward(targetPos, 2000 * delta)
		if global_position == targetPos:
			moving=false
func move(dir:Vector2):
	if moving:
		return
	targetPos += dir * Global.tileSize
	moving = true
	
func _input(event):
	if event.is_action_pressed("ui_up"):
		move(Vector2.UP)
	elif event.is_action_pressed("ui_left"):
		move(Vector2.LEFT)
	elif event.is_action_pressed("ui_right"):
		move(Vector2.RIGHT)
