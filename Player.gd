extends KinematicBody2D

var velocity = Vector2(0,0)

const SPEED = 200
const GRAVITY = 75
func _input(event: InputEvent) -> void:
	Global.connect("load_player",self,"load_game")
	Global.connect("save_player",self,"save")

func _process(delta: float) -> void:
		velocity.y = velocity.y + GRAVITY
		velocity = move_and_slide(velocity,Vector2.UP)
		velocity.x = lerp(velocity.x,0,0.1)			

	
	
func _physics_process(delta):
	
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = - SPEED
#this is the code that saves the player position in the game		
func to_dictionary():
	return {
		"position" : [position.x, position.y],

		}
func from_dictionary(data):
	position = Vector2(data.position[0], data.position[1])

#
func save():
	var data = {
		"player" : to_dictionary(),
		}
	var file = File.new()
	file.open("user://save_position.save", File.WRITE)
	var json = to_json(data)
	file.store_line(json)
	file.close()

func load_game():
	var file = File.new()
	file.open("user://save_position.save", File.READ)
	var data = parse_json(file.get_as_text())
	file.close()
	from_dictionary(data.player)
