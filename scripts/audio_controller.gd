extends Node
var isAlarmGoingOff := false
@export var mute: bool = false
var playBackgroundMusic := true
var trackNo = 0

func _ready() -> void:
	GlobalMessenger.connect("ALARM_SNOOZE", stop_alarm)
	GlobalMessenger.connect("ALARM_TIMEOUT", play_alarm)
	if playBackgroundMusic:
		if trackNo == 0:
			$bg1.play()

func play_alarm() -> void:
	if not mute:
		$alarm.play()
		
func stop_alarm():
	if not mute:
		$alarm.stop()
