extends Node2D

@onready var player: Node2D = $Player


func _ready():
	#Q. Why do we need group instead of simple Node ?
	for node in get_tree().get_nodes_in_group("external_inventory"):
		node.toggle_inventory.connect(player.toggle_inventory_interface)

	
