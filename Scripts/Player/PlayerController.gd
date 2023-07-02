extends CharacterBody2D

@export var speed = 300.0

var input_vec = Vector2(0,0) # Used to map the input by the user to the actual movement direction

var current_interactable = null # Used to keep track of which interactable we would interact with once we press the interact button


func _ready():
	$InteractionRange.connect("area_entered", on_area_entered)
	$InteractionRange.connect("area_exited", on_area_exited)

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

func on_area_entered(area):
	if area is Interactable:
		current_interactable = area

func on_area_exited(area):
	if area is Interactable:
		current_interactable = null

func _input(event):
	if event.is_action_released("interact"):
		if current_interactable:
			current_interactable.interact()
