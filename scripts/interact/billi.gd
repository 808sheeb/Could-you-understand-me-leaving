extends Cat
@onready var move_timer: Timer = $moveTimer
@onready var player: CharacterBody3D = $"../../../player"
var keyDestinations := [Vector3(-94, -1.5, 5.2), Vector3(-91.5, -1.5, 5.6), Vector3(-100, -1.5, -8.1), Vector3(-99, -1.5, -5.5), Vector3(-100.87, -1.5, -7.4)]
var isPickable := false
var pickedUp := false

var keyBody = null
var keyParent = null

#func _input(event: InputEvent) -> void:
	###move units
	#if event.is_action_pressed("left click"):
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
	#
func _ready() -> void:
	has_target = true
	target_pos = destination_points[randi_range(0, destination_points.size()-1)]
	GlobalMessenger.connect("ALARM_SNOOZE", reset_key)
	
func _process(_delta) -> void:
	if has_target:
		ap.play("Walk")
	elif !has_target:
		ap.play("Idle_02")
		
	if velocity == Vector3.ZERO and move_timer.time_left == 0:
		# get a random number from 0 to 1
		var r = randf_range(0, 0.6)
		# if rand is higher than 0.7 , 30% of the time do this
		if r > 0.7:
			target_pos = destination_points[randi_range(0,destination_points.size() - 1)]
			#print(move_timer.time_left)
		#otherwise do this
		else:
			target_pos = keyDestinations[randi_range(0, keyDestinations.size()-1)]
			
		move_timer.start(randf_range(5,10))
		has_target = true
		
	if velocity == Vector3.ZERO:
		look_at(player.get_global_position(), Vector3.UP, true)
		
	if isPickable:
		prompt_message = "Pick Up"
	elif !isPickable:
		prompt_message = "Pet"

func _on_interacted(_body) -> void:
	if isPickable:
		keyBody = _body.get_parent_node_3d()
		keyParent = keyBody.get_parent_node_3d()
		keyBody.remove_child(self)
		pickedUp = true
		GlobalMessenger.KEY_ISLE.emit()

func entered_table(_body):
	isPickable = true
	#print("entered")
	
func exited_table(_body):
	isPickable = false
	#print("exited")

func reset_key():
	if pickedUp:
		keyParent.add_child(self)
		self.set_position(Vector3(-94.4, -1.5, -24.98))
		pickedUp = false
		isPickable = false
