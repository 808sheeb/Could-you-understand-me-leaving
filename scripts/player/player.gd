extends CharacterBody3D

# Player Nodes
@onready var head: Node3D = $head
@onready var standing_collision_shape: CollisionShape3D = $standing_collision_shape
@onready var crouching_collision_shape: CollisionShape3D = $crouching_collision_shape
@onready var ray_cast_3d: RayCast3D = $crouch_checker
@onready var audio: Node = $PlayerAudio

@onready var ap: AnimationPlayer = $head/PSX_First_Person_Arms/AnimationPlayer


var gV
var newV

# Speed variables
# have this be 3 for actual gameplay
# be 7 - 10 for debug
var CURRENT_SPEED = 2.5

# defaults are 3, 5, & 2
const WALKING_SPEED = 2.5
const SPRINTING_SPEED = 5.0
const CROUCHING_SPEED = 2.0


# Input variables
const mouse_sens = 0.08
var direction = Vector3.ZERO

# Movement Variables
var lerp_speed = 10.0
const JUMP_VELOCITY = 5.2
var crouching_depth = -0.9


# Audio
@onready var snow: AudioStreamPlayer = $PlayerAudio/Snow
@onready var wood: AnimationPlayer = $PlayerAudio/WoodSound


# Constrain mouse to window
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	ap.play("Relax_hands_idle_start")
	ap.queue("Relax_hands_idle")
	GlobalMessenger.connect("INTERACTED", animationGrab)
	

func _input(event: InputEvent) -> void:
	# Mouse looking logic
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))
	
func _physics_process(delta: float) -> void:
	gV = get_real_velocity()
	newV = gV.x + gV.y + gV.z
	#if %interact_ray.is_colliding():
		#var target = %interact_ray.get_collider()
		#print(target)
	
# Handle Movement State
	# Crouching
	if Input.is_action_pressed("crouch"):
		CURRENT_SPEED = CROUCHING_SPEED
		head.position.y = lerp(head.position.y, 1.8 + crouching_depth, delta*lerp_speed)
		standing_collision_shape.disabled = true
		crouching_collision_shape.disabled = false
	# Standing
	elif !ray_cast_3d.is_colliding():
		crouching_collision_shape.disabled = true
		standing_collision_shape.disabled = false
		head.position.y = lerp(head.position.y, 1.8, delta*lerp_speed)
		# Sprinting
		if Input.is_action_pressed("sprint"):
			CURRENT_SPEED = SPRINTING_SPEED
		else:
			# Walking
			CURRENT_SPEED = WALKING_SPEED

	if Input.is_action_pressed("escape"):
		get_tree().quit()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	direction = lerp(direction, (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta*lerp_speed)
	
	if direction:
		velocity.x = direction.x * CURRENT_SPEED
		velocity.z = direction.z * CURRENT_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, CURRENT_SPEED)
		velocity.z = move_toward(velocity.z, 0, CURRENT_SPEED)
		
	move_and_slide()


	var moving = isMoving()
	
	#if is_on_floor() && moving :
		#wood.play("Audio")
	#else:
		#wood.stop()
		
	
	if !ap.is_playing():
		ap.play("Relax_hands_idle")

func animationGrab():
	ap.play("Collect_something")
	ap.queue("Relax_hands_idle_start")
	ap.queue("Relax_hands_idle")
	
func isMoving():
	#print(newV)
	if newV > 0.32:
		return true
	elif newV < -0.32:
		return true
	else:
		return false
