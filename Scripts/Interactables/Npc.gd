extends CharacterBody2D
@export var speed: float = 50.0

@export var navigation_agent: NavigationAgent2D
@export var target_points: Array[Vector2]
@export var target_animations: Array[String]

var action_index = -1

func _ready():
	navigation_agent.path_desired_distance = 6.0
	navigation_agent.target_desired_distance = 4.0

	call_deferred("actor_setup")

func actor_setup():
	await get_tree().physics_frame
	action_index = randi()%target_points.size()
	navigation_agent.target_position = target_points[action_index]
	$AnimationPlayer.play("walk")

func _physics_process(_delta):
	if navigation_agent.is_navigation_finished() && $Timer.is_stopped():
		$Timer.start()
		$AnimationPlayer.play(target_animations[action_index])
		return
	if !$Timer.is_stopped():
		return
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 =  navigation_agent.get_next_path_position()

	var new_velocity: Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity*speed

	velocity = new_velocity
	move_and_slide()


func _on_timer_timeout():
	action_index = randi()%target_points.size()
	navigation_agent.target_position = target_points[action_index]
	$AnimationPlayer.play("walk")
