extends CharacterBody3D

@export var isWalking : bool = false
var has_target: bool = false
var target_pos: Vector3
@export var SPEED = 2.35
@onready var ap: AnimationPlayer = $cat2/AnimationPlayer
@onready var timer: Timer = $Timer
@onready var nav_agent: NavigationAgent3D = $Nav/NavigationAgent3D
var destination_points := [Vector3(-99.7, -1.5, -5.5), Vector3(-91.8, -1.5, -5.3), Vector3(-100.44, -7.6, -15.66)]
var destination_direction := [Vector3(0.0, -170, 0.0), Vector3(0.0, -127.2, 0.0), Vector3(0.0, 88.4, 0.0)]


func _ready() -> void:
	has_target = true
	target_pos = destination_points[1]
	pass

func _process(_delta) -> void:
	if has_target:
		ap.play("Walk")
	elif !has_target:
		ap.play("Idle_02")
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
	
func _input(event: InputEvent) -> void:
	##move units
	if event.is_action_pressed("right click"):
		var ray := _mouse_screen_to_world(get_viewport().get_camera_3d(), 1)
		if ray:
			target_pos = ray["position"]
			has_target = true

## Raycast mouse position to world 3d
func _mouse_screen_to_world(camera: Camera3D, ray_collision_mask: int = 0xFFFFFFFF) -> Dictionary:
	var mouse_position = camera.get_viewport().get_mouse_position()
	var ray_origin = camera.project_ray_origin(mouse_position)
	var ray_end = ray_origin + camera.project_ray_normal(mouse_position)*100
	
	var space_state = camera.get_world_3d().direct_space_state
	var query := PhysicsRayQueryParameters3D.new()
	query.from = ray_origin
	query.to = ray_end
	query.collision_mask = ray_collision_mask
	var raycast = space_state.intersect_ray(query)
	
	return raycast
