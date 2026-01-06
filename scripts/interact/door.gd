extends Interactable
var toggle = false
var isAlarmGoingOff := false
@export var playback : AnimationPlayer

func _ready() -> void:
	prompt_message = "Open Door"
	GlobalMessenger.connect("ALARM_TIMEOUT", alarmTimedout)
	GlobalMessenger.connect("ALARM_SNOOZE", alarmSnoozed)
	pass
	

func _process(_delta) -> void:
	if toggle:
		prompt_message = "Close Door"
	elif !toggle:
		prompt_message = "Open Door"

func _on_interacted(_body):
	if !isAlarmGoingOff:
		toggle = !toggle
		if toggle:
			playback.play("Open")
		if !toggle:
			playback.play("Close")
	elif isAlarmGoingOff:
		GlobalMessenger.UI_DOOR.emit()

func alarmTimedout():
	isAlarmGoingOff = true

func alarmSnoozed():
	isAlarmGoingOff = false
