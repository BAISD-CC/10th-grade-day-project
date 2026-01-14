extends Camera2D

@export var player:CharacterBody2D
@export var follow_speed := 2.0
func _process(delta):
	global_position.y = lerp(
		global_position.y,
		player.global_position.y + 6,
		follow_speed * delta
	)
