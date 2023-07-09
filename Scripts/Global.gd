extends Node

var current_scene = "Main";

var player_exit_camp_posx = 360
var player_exit_camp_posy = 278
var player_start_posx = 456
var player_start_posy = 258

var game_first_load = true;

func finish_change_scenes(new_scene: String):
	current_scene = new_scene
