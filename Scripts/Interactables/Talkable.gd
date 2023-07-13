extends "res://Scripts/Interactables/Interactable.gd"

const Balloon = preload("res://Dialogues/balloon.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

signal on_interacted

func interact():
	var balloon: Node =  Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
	get_tree().paused = true
	emit_signal("on_interacted")
