extends CharacterBody2D

@export var speed = 300.0
@onready var inventory_interface = Global.inventory_interface

var input_vec = Vector2(0,0) # Used to map the input by the user to the actual movement direction
var current_interactable = null # Used to keep track of which interactable we would interact with once we press the interact button

func _ready():
	if Global.target_coordinate != Vector2.ZERO:
		global_position = Global.target_coordinate
		Global.target_coordinate = Vector2.ZERO
	$InteractionRange.connect("area_entered", on_area_entered)
	$InteractionRange.connect("area_exited", on_area_exited)
	await get_tree().process_frame
	inventory_interface.set_player_inventory_data(Global.inventory_data)

func _physics_process(_delta):
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
	else:
		area.change_scene()

func on_area_exited(area):
	if area is Interactable:
		current_interactable = null

func _unhandled_input(event: InputEvent):
	if event.is_action_released("interact"):
		if current_interactable:
			current_interactable.interact()

	if Input.is_action_just_pressed("inventory"):
		toggle_inventory_interface()
		
		
func toggle_inventory_interface(external_inventory_owner = null):
	inventory_interface.visible = !inventory_interface.visible
		
	if external_inventory_owner and inventory_interface.visible:
		inventory_interface.set_external_inventory_data(external_inventory_owner)
	elif external_inventory_owner:
		inventory_interface.clear_external_inventory()
