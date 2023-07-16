extends Resource

class_name InventorySlotData

const MAX_STACK_SIZE: int = 20

@export var inventory_item_data: InventoryItemData
@export_range(1, MAX_STACK_SIZE) var quantity: int = 1: set = set_quantity

func can_merge_with(other_slot_data: InventorySlotData):
	return inventory_item_data == other_slot_data.inventory_item_data \
	and inventory_item_data.stackable \
	and quantity < MAX_STACK_SIZE

func can_fully_merge_with(other_slot_data: InventorySlotData):
	return inventory_item_data == other_slot_data.inventory_item_data \
	and inventory_item_data.stackable \
	and quantity + other_slot_data.quantity <= MAX_STACK_SIZE

func fully_merge_with(other_slot_data: InventorySlotData):
	quantity += other_slot_data.quantity

func create_single_slot_data():
	#This feels confusing as it creates copy and also decrease current slot items count
	var new_slot_data = duplicate()
	new_slot_data.quantity = 1;
	quantity -= 1
	return new_slot_data

func set_quantity(value: int):
	if value > 1 && !inventory_item_data.stackable:
		quantity = 1
		push_error("%s is not stackable, quantity set to 1" % inventory_item_data.name)
	else:
		quantity = value
		
