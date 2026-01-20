extends road




func _on_death_zone_body_entered(body: Node2D) -> void:
	if body is Player:
		var player:Player = body
		if player.moving !=true:
			player.emit_signal("death")
			
