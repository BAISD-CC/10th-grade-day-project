extends CharacterBody2D
class_name Player
@onready var player_sprite: Sprite2D = $PlayerSprite

var sprite_preload = preload("res://icon.svg")
var whereToGoAfterLosing = preload("res://Scenes/Game over.tscn")
var targetPos:Vector2
var moving :=false
var onLog:=false
var currentLog:log=null
signal death
func _ready() -> void:
	targetPos = global_position
	player_sprite.texture = sprite_preload
	death.connect(died)
func _process(delta: float) -> void:
	if moving:
		global_position = global_position.move_toward(targetPos, 2000 * delta)
		if global_position == targetPos:
			moving=false
	if onLog == true and currentLog:
		global_position.x = currentLog.global_position.x
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
func died():
	Global._save()
	get_tree().change_scene_to_packed(whereToGoAfterLosing)


func _entered_hurtbox(body: Node2D) -> void:
	if body is car:
		emit_signal("death")
