extends CharacterBody2D
var is_moving:=false

func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	if Input.is_action_just_pressed('up'):
		direction = Vector2(0,-1)
		Global.score +=1
		_move(direction)
	elif Input.is_action_just_pressed("down"):
		direction = Vector2(0,1)
		_move(direction)
	elif Input.is_action_just_pressed("left"):
		direction = Vector2(-1,0)
		_move(direction)
	elif Input.is_action_just_pressed("right"):
		direction = Vector2(1,0)
		_move(direction)
func _move(dir:Vector2):
	if(not is_moving):
		is_moving
		var tween = create_tween()
		tween.tween_property(self, "position", position + dir*Global.tileSize * Global.howManyTiles,0.2)
		tween.tween_callback(_notMoving)
		
func _notMoving():
	is_moving = false
