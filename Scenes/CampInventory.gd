extends Interactable

signal toggle_inventory(external_inventory_owner)


func interact():
	toggle_inventory.emit(Global.camp_inventory_data)
