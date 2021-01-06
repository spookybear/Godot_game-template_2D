extends Area2D
var direction = Vector2(1, 0)
func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
#		"speed" : speed,
		"direction_x" : direction.x,
		"direction_y" : direction.y
	}
	return save_dict


func _on_coin_body_entered(body: Node) -> void:
	Global.emit_signal("collect")
	queue_free()
