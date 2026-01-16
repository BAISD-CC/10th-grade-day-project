extends CharacterBody2D
class_name Player
var targetPos:Vector2
var moving :=false
signal log
signal offLog
var on_log = false
var logVel
@onready var player_sprite: Sprite2D = $PlayerSprite
var sprite_preload = preload("res://icon.svg")
func _ready() -> void:
	targetPos = global_position
	player_sprite.texture = sprite_preload
	log.connect(_got_in_log)
func _process(delta: float) -> void:

	if moving:
		global_position = global_position.move_toward(targetPos, 2000 * delta)
		if global_position == targetPos:
			moving=false
	if on_log:
		velocity.x = logVel
	else:
		platform_on_leave
func move(dir:Vector2):
	if moving:
		return
	targetPos += dir * Global.tileSize
	moving = true
	
#if we wanted to move with arrow key this is where we'd do it, with event
func _input(event):
	if event.is_action_pressed("up"):
		move(Vector2.UP)
		player_sprite.rotation_degrees = 0
	elif event.is_action_pressed("left"):
		move(Vector2.LEFT)
		player_sprite.rotation_degrees = 90
	elif event.is_action_pressed("right"):
		move(Vector2.RIGHT)
		player_sprite.rotation_degrees = -90
func _got_in_log(velcoty):
	on_log = true
	logVel = velcoty
func _offLog():
	on_log = false
