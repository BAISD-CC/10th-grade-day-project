extends Camera2D

@export var player:CharacterBody2D
@export var follow_speed := 2.0
@export var scroll_speed := 4
@onready var timer: Timer = $Timer

var moving_up
func _ready() -> void:
	timer.timeout.connect(_notMoving)
func _process(delta):
	if moving_up == false:
		global_position.y = lerp(
				global_position.y,
				player.global_position.y + 6,
				follow_speed * delta
			)
	else:
		global_position.y = lerp(global_position.y, global_position.y-scroll_speed, follow_speed * delta)
	if player.moving == false && timer.is_stopped():
		timer.start(-1)

func _notMoving():
	moving_up = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("up") or event.is_action("down"):
		moving_up = false
