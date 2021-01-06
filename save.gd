extends Button


func _ready() -> void:
	pass


func _on_save_pressed() -> void:
	Global.emit_signal("save_game")
	Global.emit_signal("save_score")
