extends CharacterBody2D
class_name Player

#Nothing should be touched here.
@onready var animation_tree: AnimationTree = $AnimatedSprite2D/AnimationTree
var whereToGoAfterLosing = preload("res://Scenes/Game over.tscn")
var targetPos:Vector2
var moving :=false
var onLog:=false
var currentLog:log=null
var onWater:=false
var logffset :float = 0
var SPEED = 500
signal death


#Can be changed to another player skin by changing what's in quotations.  
var whichAnimations :="normalPlatyPus"


#Nothing should be touched here.
#applies the animations, target position isinitalized, and a signal is connected.
func _ready() -> void:
	animation_tree["parameters/conditions/" + whichAnimations] = true
	targetPos = global_position
	death.connect(died)
func _process(delta: float) -> void:
	#Normal movement
	if Global.debug != true:
		if moving:
			global_position = global_position.move_toward(targetPos, 2000 * delta)
		if global_position == targetPos:
			moving=false
		if onLog == true and currentLog and not moving:
			global_position.x = currentLog.global_position.x + logffset
		if global_position.x <0 or global_position.x > 1280:
			emit_signal("death")
		elif onWater == true and not onLog and not moving:
			emit_signal("death")
	#debug movement
	else:
		var dir := Input.get_vector("left","right","up","down")
		velocity = SPEED * dir
		move_and_slide()
#changes the target position to the new on, Direction, and 
func move(dir:Vector2):
	if moving:
		return
	animation_tree["parameters/BlendSpace2D/blend_position"] = dir
	animation_tree["parameters/BlendSpace2D 2/blend_position"] = dir
	targetPos += dir * Global.tileSize
	if onLog:
		onLog = false
		currentLog = null
		logffset = 0
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


#Smacks the player with a cars if it got hit from one 
func _entered_hurtbox(body: Node2D) -> void:
	if Global.debug !=true:
		if body is car:
			emit_signal("death")
