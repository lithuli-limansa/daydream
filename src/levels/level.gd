extends Node2D

@export var next_level_scene : PackedScene
@export var total_coins : int = 0


func _ready() -> void:
	GameManager.current_next_level_scene = next_level_scene
	GameManager.current_total_coins = total_coins
	GameManager.current_collected_coins = 0
