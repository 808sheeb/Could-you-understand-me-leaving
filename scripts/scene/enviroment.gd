extends Node3D
var isAlarmGoingOff := false
@onready var world: ProceduralSkyMaterial = $WorldEnvironment.get_environment().get_sky().get_material()

func _ready() -> void:
	GlobalMessenger.connect("ALARM_TIMEOUT", alarmToggle)
	GlobalMessenger.connect("ALARM_SNOOZE", alarmToggle)
	
func _process(_delta) -> void:
	pass
	
func alarmToggle():
	isAlarmGoingOff = !isAlarmGoingOff
