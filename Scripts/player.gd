extends CharacterBody2D
class_name Player

@onready var animation_tree: AnimationTree = $AnimatedSprite2D/AnimationTree
var sprite_preload = preload("res://icon.svg")
var whereToGoAfterLosing = preload("res://Scenes/Game over.tscn")
var targetPos:Vector2
var moving :=false
var onLog:=false
var currentLog:log=null
var onWater:=false
signal death
func _ready() -> void:
	animation_tree["parameters/conditions/normalPlatyPus"] = true
	targetPos = global_position
	death.connect(died)
func _process(delta: float) -> void:
	if moving:
		global_position = global_position.move_toward(targetPos, 2000 * delta)
		if global_position == targetPos:
			moving=false
	if onLog == true and currentLog:
		global_position.x = currentLog.global_position.x
	if global_position.x <0 or global_position.x > 1280:
		emit_signal("death")
	if onWater:
		emit_signal("death")
func move(dir:Vector2):
	if moving:
		return
	animation_tree["parameters/BlendSpace2D/blend_position"] = dir
	animation_tree["parameters/BlendSpace2D 2/blend_position"] = dir
	targetPos += dir * Global.tileSize
	if targetPos.y >  592.0:
		targetPos.y =  592.0
	moving = true
	
#if we wanted to move with arrow key this is where we'd do it, with event
func _input(event):
	if event.is_action_pressed("up"):
		move(Vector2.UP)
	elif event.is_action_pressed("left"):
		move(Vector2.LEFT)
	elif event.is_action_pressed("right"):
		move(Vector2.RIGHT)
	elif event.is_action_pressed("down"):
		move(Vector2.DOWN)
		
func died():
	Global._save()
	get_tree().change_scene_to_packed(whereToGoAfterLosing)



func _entered_hurtbox(body: Node2D) -> void:
	if body is car:
		emit_signal("death")
