extends Area2D
# This class can be considered as a "motherclass" for all the future
# Interactables. It'll mainly just pass signals down to future
# classes like NPCs, signs, or whatever we want to interact with
class_name Interactable # In order to be able to reference to this class i need to give it a name

# This function needs to be overwritten by any child class
func interact():
	print("please override me")
