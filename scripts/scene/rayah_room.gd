extends Node3D
@onready var cutter: CSGBox3D = $"Walls & Floors/rayah_wall_back/RayahCutter"
var keyIsActive = false

func _ready() -> void:
	GlobalMessenger.connect("KEY_ISLE", activeToggle)
	GlobalMessenger.connect("ALARM_SNOOZE", alarmSnooze)
	
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
	
func alarmSnooze():
	keyIsActive = false
