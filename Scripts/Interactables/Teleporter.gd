extends Area2D

class_name CampEntry

@export var target_scene : String
@export var target_coordinate : Vector2

func change_scene():
	Global.target_coordinate = target_coordinate
	get_tree().change_scene_to_file(target_scene)
