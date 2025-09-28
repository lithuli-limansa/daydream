extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.current_collected_coins += 1
		body.update_hud_coins()
		$AudioStreamPlayer2D.play()
		visible = false
		await $AudioStreamPlayer2D.finished
		queue_free()
	
	
