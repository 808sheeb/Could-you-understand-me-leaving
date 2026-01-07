extends Node3D
@onready var cutter: CSGBox3D = $"Floors & Walls/shihab_wall_2/Cutter"
var keyIsActive = false
var isAlarmGoingOff = false


#THERE IS A PROBLEM HERE FIX THIS
#i think i fixed 
func _ready() -> void:
	GlobalMessenger.connect("KEY_WINTER", activeToggle)
	GlobalMessenger.connect("ALARM_SNOOZE", alarmSnooze)
	
func _process(_delta: float) -> void:
	if keyIsActive:
		cutter.visible = true
		#print("key active")
	else:
		cutter.visible = false
		#print("key inactive")

func activeToggle():
	keyIsActive = true

func alarmSnooze():
	keyIsActive = false
