extends Control
#script location--project settings--autoload
var score = 0

func _ready() -> void:
	pass
func _input(event: InputEvent) -> void:
	Global.connect("collect",self,"update")
	Global.connect("load_score",self,"load_save_file")
	Global.connect("save_score",self,"save_game")
func update_hud():
	$score.set_text("Score: "+str(score))
	
	
func update():
	score += 1
	$score.set_text("Score: "+str(score))
	save_game()
	
	pass



func save_game():
	print("Saving game to: " + OS.get_user_data_dir())
	var file = File.new()
	var location = "user://save_game.save"

	if file.open(location, File.WRITE) != 0:
		print("Cannot write save file to " + location)
	else:
		file.store_line(to_json(score))
		file.close()
		print(score)
func load_save_file():
	var file = File.new()
	file.open("user://save_game.save", file.READ)
	var text = file.get_as_text()
	score = parse_json(text)
	update_hud()
	
	print(score)
	file.close()