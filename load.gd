extends Button


func _ready() -> void:
	pass


func _on_load_pressed() -> void:
	Global.emit_signal("load_room")
	Global.emit_signal("load_score")
