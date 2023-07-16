extends PanelContainer

const Slot = preload("res://Scenes/Inventory/Slot.tscn")

@onready var grid_container: GridContainer = $MarginContainer/ItemGrid

func set_inventory_data(inventory_data: InventoryData):
	inventory_data.inventory_updated.connect(populate_inventory_items)
	populate_inventory_items(inventory_data)

func populate_inventory_items(inventory_data: InventoryData):
	for child in grid_container.get_children():
		child.queue_free()
		
	for slot_data in inventory_data.inventory_slots_data:
		var slot = Slot.instantiate()
		grid_container.add_child(slot)
		
		slot.slot_clicked.connect(inventory_data.on_slot_clicked)
		
		if slot_data:
			slot.set_slot_data(slot_data)
