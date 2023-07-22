extends Sprite2D

var fish = load("res://Resources/Inventory/Fish.tres")

func add_fish():
	var fish_slot_data = InventorySlotData.new()
	fish_slot_data.inventory_item_data = fish
	fish_slot_data.quantity = 1
	
	var available_slot_index
	var slots = Global.inventory_data.inventory_slots_data
	
	for index in slots.size():
		var item = slots[index]
		
		if !item || (item.inventory_item_data.name == fish.name && item.quantity < 20):
			available_slot_index = index
			break
			
	#Q. Smarter way to check if exists including 0?
	if available_slot_index || available_slot_index == 0:
		Global.inventory_data.drop_single_slot_data(fish_slot_data, available_slot_index)
	else:
		print("Show warning inventory full")
