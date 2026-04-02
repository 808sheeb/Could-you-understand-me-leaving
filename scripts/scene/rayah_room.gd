extends Node3D
@onready var cutter: CSGBox3D = $"Walls & Floors/rayah_wall_back/RayahCutter"
var keyIsActive = false
var inWorld = false

var keym = preload("uid://1ekusom52y8c").instantiate()

func _ready() -> void:
	GlobalMessenger.connect("KEY_MEADOW", activeToggle)
	GlobalMessenger.connect("ALARM_SNOOZE", alarmSnooze)
	GlobalMessenger.connect("SPAWN_KEYS", spawn)

	
func _process(_delta: float) -> void:
	if keyIsActive:
		cutter.visible = true
		#print("key active")
	else:
		cutter.visible = false
		#print("key inactive")
		#pass

func activeToggle():
	keyIsActive = true
	inWorld = false
	
func alarmSnooze():
	keyIsActive = false
	inWorld = true
	
func spawn():
	if !inWorld:
		keym.transform.origin = Vector3(-8.1,1.364,-35.983)
		keym.rotation_degrees = Vector3(0, -34.2, 0)
		keym.scale = Vector3(0.495, 0.495, 0.495)
		self.add_child(keym)
		#print("Meadow Key Spawned")
		inWorld = true
