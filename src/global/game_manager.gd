extends Node

var current_collected_coins : int = 0
var current_next_level_scene : PackedScene
var current_total_coins : int = 0


func go_to_next_level() -> void:
	get_tree().call_deferred("change_scene_to_packed",current_next_level_scene)
