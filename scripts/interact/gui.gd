extends Node2D
@onready var alarm: Timer = $Alarm
var rng = RandomNumberGenerator.new()
@export var snooze = true
signal snoozed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startAlarm()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_alarm_timeout() -> void:
	GlobalMessenger.ALARM_TIMEOUT.emit()
	snooze = false

func _on_button_interacted(_body):
	if !snooze:
		startAlarm()
		GlobalMessenger.ALARM_SNOOZE.emit()
		snoozed.emit()

func startAlarm():
	var snoozeTime = rng.randi_range(30, 100)
	print(snoozeTime)
	alarm.start(snoozeTime)
	snooze = true
