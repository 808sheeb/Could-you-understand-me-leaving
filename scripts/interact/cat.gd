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
var destination_points := [Vector3(-99.7, -1.5, -5.5), Vector3(-91.8, -1.5, -5.3), Vector3(-100.44, -7.6, -15.66)]
var destination_direction := [Vector3(0.0, -170, 0.0), Vector3(0.0, -127.2, 0.0), Vector3(0.0, 88.4, 0.0)]


func _ready() -> void:
	has_target = true
	target_pos = destination_points[1]

func _process(_delta) -> void:
	pass
	#print(timer.time_left)

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
