extends Node

var current_scene = "Main";
var target_coordinate = Vector2.ZERO
var inventory_data: InventoryData = preload("res://PlayerInventory.tres")
var camp_inventory_data: InventoryData = preload("res://CampInventory.tres")

var inventory_interface

func finish_change_scenes(new_scene: String):
	current_scene = new_scene
