extends car
class_name log

func player_enters_log(body: Node2D) -> void:
	if body is Player:
		var player:Player = body
		player.onLog = true
		player.onWater = false
		player.currentLog = self
		player.logffset = player.global_position.x - global_position.x
		player.global_position.x = lerp(
		player.global_position.x,
		global_position.x + player.logffset,
		0.3)
func _on_jump_box_body_exited(body: Node2D) -> void:
	if body is Player:
		var player:Player = body
		body.targetPos.x = round(global_position.x/Global.tileSize) * Global.tileSize
