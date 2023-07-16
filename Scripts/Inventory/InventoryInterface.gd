extends Control

var grabbed_slot_data: InventorySlotData

@onready var player_inventory: PanelContainer = $PlayerInventory
@onready var grabbed_slot = $GrabbedSlot

func _physics_process(_delta:float):
	if grabbed_slot.visible:
		grabbed_slot.global_position = get_global_mouse_position() + Vector2(5,5) 

func set_player_inventory_data(inventory_data: InventoryData):
	inventory_data.inventory_interact.connect(on_inventory_interact)
	player_inventory.set_inventory_data(inventory_data)

func on_inventory_interact(inventory_data: InventoryData, index: int, button_index: int):	
	match [grabbed_slot_data, button_index]:
		[null, MOUSE_BUTTON_LEFT]:
			grabbed_slot_data = inventory_data.grab_slot_data(index)
		[_, MOUSE_BUTTON_LEFT]:
			grabbed_slot_data = inventory_data.drop_slot_data(grabbed_slot_data, index)
		[null, MOUSE_BUTTON_RIGHT]:
			pass
		[_, MOUSE_BUTTON_RIGHT]:
			grabbed_slot_data = inventory_data.drop_single_slot_data(grabbed_slot_data, index)
		
	update_grabbed_slot()

func update_grabbed_slot():
	if grabbed_slot_data:
		grabbed_slot.set_slot_data(grabbed_slot_data)
		grabbed_slot.show()
	else:
		grabbed_slot.hide()
