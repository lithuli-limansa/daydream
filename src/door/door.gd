extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if GameManager.current_collected_coins == GameManager.current_total_coins:
			GameManager.go_to_next_level()
