extends Node3D

var winterActive =  false
@onready var winter_portal: Portal3D = $WinterPortal

func _ready() -> void:
	#on alarm reset, do this
	GlobalMessenger.connect('ALARM_SNOOZE', resetPortal)
	
	#on key pickup, do this
	GlobalMessenger.connect("KEY_WINTER", winterPortal)

func winterPortal():
	winterActive = true
	winter_portal.activate()
	
func resetPortal():
	winterActive = false
	winter_portal.deactivate()
