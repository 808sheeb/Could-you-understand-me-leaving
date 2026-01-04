extends CharacterBody3D
class_name Cat

@onready var ap: AnimationPlayer = %AnimationPlayer
@export var prompt_message = "Interact"
@export var prompt_input = "interact"
signal interacted(body)

var has_target: bool = false
var target_pos: Vector3
@export var SPEED := 2.35

@onready var nav_agent: NavigationAgent3D = $Nav/NavigationAgent3D
var destination_points := [Vector3(-94.116, -1.5, 4.05), Vector3(-96.05, -1.5, -8.938), Vector3(-95.614, -1.5, -0.853), Vector3(-96.44, -1.5, -2.98), Vector3(-102.01, -1.5, -5.4), Vector3(-103.35, -1.5, -1.47), Vector3(-103.35, -1.5, -13.1), Vector3(-96.33, -1.5, -19.62), Vector3(-97.42, -7.48, -18.23), Vector3(-89.32, -3.68, -16.6), Vector3(-88.5, -3.68, -12.7), Vector3(-91.5, -1.5, 5.6), Vector3(-99.7, -1.5, -5.5), Vector3(-91.8, -1.5, -5.2), Vector3(-100.44, -7.6, -15.66)]

func _physics_process(delta: float) -> void:
	if has_target:
		nav_agent.target_position = target_pos
		var next_path_pos := nav_agent.get_next_path_position()
		var direction := global_position.direction_to(next_path_pos)
		velocity = direction * SPEED
		
		if nav_agent.is_navigation_finished():
			has_target = false
			velocity = Vector3.ZERO
		
		var ROTATION_SPEED = 4
		var target_rotation := direction.signed_angle_to(Vector3.MODEL_FRONT, Vector3.DOWN)
		if abs(target_rotation - rotation.y) > deg_to_rad(60):
			ROTATION_SPEED = 20
		rotation.y = move_toward(rotation.y, target_rotation, delta * ROTATION_SPEED)
		
	move_and_slide()

func get_prompt():
	var key_name = ""
	for action in InputMap.action_get_events(prompt_input):
		if action is InputEventKey:
			key_name = action.as_text_physical_keycode()
			break
	return prompt_message + "\n[" + key_name + "]"

func interact(body):
	interacted.emit(body)
