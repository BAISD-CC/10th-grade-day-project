extends car
class_name log

func player_enters_log(body: Node2D) -> void:
	if body is Player:
		var player:Player = body
		player.onLog = true
		player.onWater = false
		player.currentLog = self
func _on_jump_box_body_exited(body: Node2D) -> void:
	if body is Player:
		var player:Player = body
		player.onLog = false
		player.currentLog = null
