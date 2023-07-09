extends Node

var current_scene = "Main";
var target_coordinate = Vector2.ZERO


func finish_change_scenes(new_scene: String):
	current_scene = new_scene
