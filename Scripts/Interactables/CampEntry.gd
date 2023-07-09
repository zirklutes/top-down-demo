extends Area2D

class_name CampEntry

func _ready():
	pass

func change_scene():
	if Global.current_scene == "Main":
		get_tree().change_scene_to_file("res://Scenes/Camp.tscn")
		Global.finish_change_scenes("Camp")
