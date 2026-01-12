extends Node3D
@onready var cutter: CSGBox3D = $"Floors & Walls/cubby_backwall/cutter"
@onready var portal: Node3D = $portal
var keyIsActive := false
var isAlarmGoingOff := false

func _ready() -> void:
	GlobalMessenger.connect("KEY_VILLAGE", activeToggle)
	GlobalMessenger.connect("ALARM_SNOOZE", alarmSnoozed)
	
func _process(_delta) -> void:
	if keyIsActive:
		cutter.visible = true
		portal.visible = true
	else:
		cutter.visible = false
		portal.visible = false
	
func activeToggle():
	keyIsActive = true

func alarmSnoozed():
	keyIsActive = false
