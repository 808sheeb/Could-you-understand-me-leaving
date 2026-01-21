extends Cat
@onready var move_timer: Timer = $moveTimer
@onready var player: CharacterBody3D = $"../../../player"

## DEBUG CAT
#func _input(event: InputEvent) -> void:
	###move units
	#if event.is_action_pressed("right click"):
		#var ray := _mouse_screen_to_world(get_viewport().get_camera_3d(), 1)
		#if ray:
			#target_pos = ray["position"]
			#has_target = true
#
### Raycast mouse position to world 3d
#func _mouse_screen_to_world(camera: Camera3D, ray_collision_mask: int = 0xFFFFFFFF) -> Dictionary:
	#var mouse_position = camera.get_viewport().get_mouse_position()
	#var ray_origin = camera.project_ray_origin(mouse_position)
	#var ray_end = ray_origin + camera.project_ray_normal(mouse_position)*100
	#
	#var space_state = camera.get_world_3d().direct_space_state
	#var query := PhysicsRayQueryParameters3D.new()
	#query.from = ray_origin
	#query.to = ray_end
	#query.collision_mask = ray_collision_mask
	#var raycast = space_state.intersect_ray(query)
	#
	#return raycast
func _ready() -> void:
	has_target = true
	target_pos = destination_points[randi_range(0, destination_points.size()-1)]
	
func _process(_delta) -> void:
	if has_target:
		ap.play("Walk")
	elif !has_target:
		ap.play("Idle_02")
		
	if velocity == Vector3.ZERO and move_timer.time_left == 0:
		look_at(Vector3.ZERO)
		has_target = true
		target_pos = destination_points[randi_range(0,destination_points.size() - 1)]
		move_timer.start(randf_range(10,100))
		#print(move_timer.time_left)
		
	if velocity == Vector3.ZERO:
		if player != null:
			look_at(player.get_global_position(), Vector3.UP, true)
