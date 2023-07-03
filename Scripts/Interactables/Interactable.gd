extends Area2D
# This class can be considered as a "motherclass" for all the future
# Interactables. It'll mainly just pass signals down to future
# classes like NPCs, signs, or whatever we want to interact with
class_name Interactable # In order to be able to reference to this class i need to give it a name

const Balloon = preload("res://Dialogues/balloon.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"


# This function needs to be overwritten by any child class
func interact():
	var balloon: Node =  Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
