extends Node3D
@onready var cutter: CSGBox3D = $"Floors & Walls/shihab_wall_2/Cutter"
@onready var flavor_text: Sprite3D = $FlavorText
var keyIsActive = false

var keyw = preload("uid://celmha118kao6").instantiate()

#THERE IS A PROBLEM HERE FIX THIS
#i think i fixed 
func _ready() -> void:
	GlobalMessenger.connect("KEY_WINTER", activeToggle)
	GlobalMessenger.connect("ALARM_SNOOZE", alarmSnooze)
	GlobalMessenger.connect("SPAWN_KEYS", spawn)
	
func _process(_delta: float) -> void:
	if keyIsActive:
		cutter.visible = true
		flavor_text.visible = true
		#print("key active")
	else:
		cutter.visible = false
		flavor_text.visible = false
		#print("key inactive")

func activeToggle():
	keyIsActive = true

func alarmSnooze():
	keyIsActive = false
	
func spawn():
	if keyIsActive:
		keyw.transform.origin = Vector3(6.256,1.711,-18.685)
		keyw.rotation_degrees = Vector3(0, -62.6, 0)
		self.add_child(keyw)
