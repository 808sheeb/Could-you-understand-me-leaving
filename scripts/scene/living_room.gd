extends Node3D
var keyIsActive = false
var inWorld = false

var keyw = preload("uid://celmha118kao6").instantiate()

#THERE IS A PROBLEM HERE FIX THIS
#i think i fixed 
func _ready() -> void:
	GlobalMessenger.connect("KEY_XBOX", activeToggle)
	GlobalMessenger.connect("ALARM_SNOOZE", alarmSnooze)
	GlobalMessenger.connect("SPAWN_KEYS", spawn)
	

func activeToggle():
	keyIsActive = true
	inWorld = false

func alarmSnooze():
	keyIsActive = false
	inWorld = true
	
func spawn():
	if !inWorld:
		keyw.transform.origin = Vector3(-1.284,0.936,0.45)
		keyw.rotation_degrees = Vector3(0, -41.5, 0)
		self.add_child(keyw)
		print("Xbox Key Spawned")
		inWorld = true
