extends CharacterBody2D

@export var speed = 300.0

var input_vec = Vector2(0,0) # Used to map the input by the user to the actual movement direction

func _physics_process(delta):
	if Input.is_action_pressed("up"):
		input_vec.y -= 1
	if Input.is_action_pressed("down"):
		input_vec.y += 1
	if Input.is_action_pressed("left"):
		input_vec.x -= 1
	if Input.is_action_pressed("right"):
		input_vec.x += 1

	velocity = input_vec.normalized() * speed # Normalizing the input vector to make diagonal movement the same speed as cardinal movement
	move_and_slide()
	input_vec = Vector2.ZERO
