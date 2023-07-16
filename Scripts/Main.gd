extends Node2D

@onready var player: Node2D = $Player
@onready var inventory_interface: Control = $UI/InventoryInterface


func _ready():
	DialogueManager.dialogue_ended.connect(pause)
	player.toggle_inventory.connect(toogle_inventory_interface)
	inventory_interface.set_player_inventory_data(player.inventory_data)
	

func pause(_t):
	get_tree().paused = false

func toogle_inventory_interface():
	inventory_interface.visible = !inventory_interface.visible
