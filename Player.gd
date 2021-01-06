extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
const SPEED = 200
const GRAVITY = 75
const JUMPFORCE = -1700
onready var animation = $AnimatedSprite
func _process(delta: float) -> void:
		velocity.y = velocity.y + GRAVITY
		velocity = move_and_slide(velocity,Vector2.UP)
		velocity.x = lerp(velocity.x,0,0.1)			
func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
#		"speed" : speed,
#		"direction_x" : direction.x,
#		"direction_y" : direction.y
	}
	return save_dict
	
	
func _physics_process(delta):
	
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
#		$AnimatedSprite.play("run")
#		$AnimatedSprite.flip_h = false

	elif Input.is_action_pressed("ui_left"):
		velocity.x = - SPEED
#		$AnimatedSprite.play("run")
#		$AnimatedSprite.flip_h = true
#	else:
#		$AnimatedSprite.play("idle")
	
