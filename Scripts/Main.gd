extends Node2D


func _ready():
	DialogueManager.dialogue_ended.connect(pause)
	

func pause(t):
	get_tree().paused = false
