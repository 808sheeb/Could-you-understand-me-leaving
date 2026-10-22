extends Node3D
var keyt = preload("uid://cjlsagu7xsrbm").instantiate()
var inWorld = false

func _ready() -> void:
	GlobalMessenger.connect("SPAWN_KEYS", spawn)
	GlobalMessenger.connect("KEY_VILLAGE", activeToggle)
	GlobalMessenger.connect("ALARM_SNOOZE", snoozed)
	
func spawn():
	if !inWorld:
		keyt.transform.origin = Vector3(-8.228,3.28,-18.314)
		keyt.rotation_degrees = Vector3(-73.6, 0, -11.1)
		self.add_child(keyt)
		#print("Bathroom Key Spawned")
		inWorld = true

func activeToggle():
	inWorld = false

func snoozed():
	inWorld = true
