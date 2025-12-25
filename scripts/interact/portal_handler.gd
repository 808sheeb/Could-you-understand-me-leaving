extends Node3D

var winterActive =  false
@onready var winter_portal: Portal3D = $WinterBorder/WinterPortal
@onready var winter_border: Node3D = $WinterBorder

func _ready() -> void:
	winter_border.visible = false
	#on alarm reset, do this
	GlobalMessenger.connect('ALARM_SNOOZE', resetPortal)
	
	#on key pickup, do this
	GlobalMessenger.connect("KEY_WINTER", winterPortal)

func winterPortal():
	winter_border.visible = true
	winterActive = true
	#winter_portal.activate()
	
func resetPortal():
	winterActive = false
	winter_border.visible = false
	#winter_portal.deactivate()
