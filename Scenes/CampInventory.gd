extends Interactable

signal toggle_inventory(external_inventory_owner)

@export var inventory_data: InventoryData

func interact():
	toggle_inventory.emit(self)
