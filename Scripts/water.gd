extends road




func _on_death_zone_body_entered(body: Node2D) -> void:
	if body is Player:
		var player:Player = body
		if player.onLog ==false and player.currentLog == null:
			player.onWater = true
			


func _on_death_zone_body_exited(body: Node2D) -> void:
	if body is Player:
		var player:Player = body
		player.onWater = false
