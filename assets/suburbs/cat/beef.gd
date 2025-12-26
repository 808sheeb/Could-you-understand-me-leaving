extends CharacterBody3D

@export var isWalking : bool = false
@onready var ap: AnimationPlayer = $cat2/AnimationPlayer
@onready var timer: Timer = $Timer
@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
var destination_points := [Vector3(-99.7, -1.5, -5.5), Vector3(-91.8, -1.5, -5.3), Vector3(-100.44, -7.6, -15.66)]
var destination_direction := [Vector3(0.0, -170, 0.0), Vector3(0.0, -127.2, 0.0), Vector3(0.0, 88.4, 0.0)]


func _ready() -> void:
	timer.one_shot = true
	timer.start(randi_range(3, 6))

#func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("ui_accept"):
		#var n_position := Vector3(-99.7, -1.5, -6.9 )
		#nav_agent.set_target_position(n_position)

func _process(_delta) -> void:
	if isWalking:
		ap.play("Walk")
	elif !isWalking:
		ap.play("Idle_02")
	#print(timer.time_left)

func _physics_process(_delta) -> void:
	var destination = nav_agent.get_next_path_position()
	var local_destination = destination - global_position
	var direction = local_destination.normalized()
	velocity = direction * 5
	move_and_slide()

func stateMachine():
		nav_agent.set_target_position(destination_points[randi_range(0,2)])

func _on_target_reached() -> void:
	timer.one_shot = true
	timer.start(randi_range(3, 6))
