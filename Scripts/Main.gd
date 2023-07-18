extends Node2D

@onready var player: Node2D = $Player


func _ready():
	DialogueManager.dialogue_ended.connect(pause)
	

func pause(_t):
	get_tree().paused = false
