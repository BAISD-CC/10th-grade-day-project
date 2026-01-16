extends car
class_name log
var player_in_log = false

func player_enters_log(body: Node2D) -> void:
	if body is Player and not body.moving:
		player_in_log = true
		var player:Player = body
		player.emit_signal("log",velocity.x)
func _on_jump_box_body_exited(body: Node2D) -> void:
	if body is Player and not body.moving:
		player_in_log = false
		var player:Player = body
		player.emit_signal("offLog",)
