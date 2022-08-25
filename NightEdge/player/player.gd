extends KinematicBody2D

export var ACCELERATION = 350
export var MAX_SPEED = 120
export var FRICTION = 400


var velocity = Vector2.ZERO

func _ready():
	print("[info]Player has been load.")

func _physics_process(delta):
	move_state(delta)

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_slide(velocity)
