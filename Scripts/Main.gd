extends Node2D

func _ready():
	if Global.game_first_load == true:
		$Player.position.x = Global.player_start_posx
		$Player.position.y = Global.player_start_posy
	else:
		$Player.position.x = Global.player_exit_camp_posx
		$Player.position.y = Global.player_exit_camp_posy
