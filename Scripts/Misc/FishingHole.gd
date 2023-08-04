extends Sprite2D

var fish = load("res://Resources/Inventory/Fish.tres")

signal display_notification;

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
			
	if available_slot_index != null:
		await Global.inventory_data.drop_single_slot_data(fish_slot_data, available_slot_index)
		display_notification.emit("1 Fish added!")
	else:
		display_notification.emit("Inventory full!")
