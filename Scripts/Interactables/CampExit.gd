extends Area2D

class_name Door

func _ready():
	pass

func change_scene():
	if Global.current_scene == "Camp":
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
		Global.game_first_load = false
		Global.finish_change_scenes("Main")
