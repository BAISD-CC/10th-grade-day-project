extends Camera2D
#Nothing should be touched here.
@export var player:CharacterBody2D
@export var follow_speed := 2.0
@export var scroll_speed := 4
@onready var timer: Timer = $Timer
var moving_up
func _process(delta):
	#moves the camera nased off the player's y positon
	global_position.y = lerp(
				global_position.y,
				player.global_position.y + 6,
				follow_speed * delta
			)
