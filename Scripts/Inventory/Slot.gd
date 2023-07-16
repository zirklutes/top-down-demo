extends PanelContainer

signal slot_clicked(index: int, button_index: int)

@onready var quantity_label = $QuantityLabel
@onready var texture_rect = $TextureRect

func set_slot_data(slot_data: InventorySlotData):
	var item_data = slot_data.inventory_item_data
	texture_rect.texture = item_data.texture
	
	tooltip_text = "%s\n%s" % [item_data.name, item_data.description]
	
	if slot_data.quantity > 1:
		quantity_label.text = "x%s" % slot_data.quantity
		quantity_label.show()
	else:
		quantity_label.hide()


func _on_gui_input(event: InputEvent):
	if event is InputEventMouseButton \
			and (event.button_index == MOUSE_BUTTON_LEFT or event.button_index == MOUSE_BUTTON_RIGHT) \
			and event.is_pressed():
		slot_clicked.emit(get_index(), event.button_index)
