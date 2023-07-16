extends Resource

class_name InventoryData

signal inventory_updated(inventory_data: InventoryData)
signal inventory_interact(inventory_data: InventoryData, index: int, button_index: int)

@export var inventory_slots_data: Array[InventorySlotData]

func grab_slot_data(index: int):
	var slot_data = inventory_slots_data[index]
	
	if slot_data:
		inventory_slots_data[index] = null
		inventory_updated.emit(self)
		return slot_data
	else:
		return null


func drop_slot_data(grabbed_slot_data: InventorySlotData, index: int):
	var slot_data = inventory_slots_data[index]
	
	if grabbed_slot_data.inventory_item_data.stackable \
		&& grabbed_slot_data.inventory_item_data.name == grabbed_slot_data.inventory_item_data.name:
			pass
	var return_slot_data: InventorySlotData
	
	if slot_data and slot_data.can_fully_merge_with(grabbed_slot_data):
		slot_data.fully_merge_with(grabbed_slot_data)
	else:
		inventory_slots_data[index] = grabbed_slot_data
		return_slot_data = slot_data
		
	inventory_updated.emit(self)
	return return_slot_data


func drop_single_slot_data(grabbed_slot_data: InventorySlotData, index: int):
	var slot_data = inventory_slots_data[index]
	
	if !slot_data:
		inventory_slots_data[index] = grabbed_slot_data.create_single_slot_data()
	elif slot_data.can_merge_with(grabbed_slot_data):
		slot_data.fully_merge_with(grabbed_slot_data.create_single_slot_data())
			
	inventory_updated.emit(self)
	
	if grabbed_slot_data.quantity > 0:
		return grabbed_slot_data
	else:
		return null


func on_slot_clicked(index: int, button_index: int):
	inventory_interact.emit(self, index, button_index)
	
