extends Node2D

@onready var player: Node2D = $Player
@onready var ui: CanvasLayer = $UI
@onready var fishing_hole: Sprite2D = $FishingHole

var notification  = preload("res://Scenes/Notification.tscn")

func _ready():
	DialogueManager.dialogue_ended.connect(pause)
	fishing_hole.display_notification.connect(self.display_notification)
	
func pause(_t):
	get_tree().paused = false

func display_notification(text):
	var temp_notification = notification.instantiate()
	
	temp_notification.get_node("Label").text = text
	#temp_notification.set_position(Vector2(0, 0))
	ui.add_child(temp_notification)
	
	await get_tree().create_timer(2).timeout
	temp_notification.queue_free()
