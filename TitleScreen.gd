extends Control
onready var hud = get_node("/root/Hud")
func _ready() -> void:
	pass

func _on_start_game_pressed() -> void:
	get_tree().change_scene("res://world.tscn")



	
	







