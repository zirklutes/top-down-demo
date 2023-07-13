extends Sprite2D

func add_fish():
	var player = get_tree().get_nodes_in_group("Player")[0]
	player.inventory.items["fish"] = 1
