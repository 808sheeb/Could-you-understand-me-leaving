extends Node2D
@onready var alarm: Timer = $Alarm
@onready var alarm_light: OmniLight3D = $"../floorplan/Parents/alarm_light"
var rng = RandomNumberGenerator.new()
@export var snooze = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startAlarm()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_alarm_timeout() -> void:
	alarmTimeout()

func _on_button_interacted(_body):
	if !snooze:
		startAlarm()

func startAlarm():
	var snoozeTime = rng.randi_range(10,20)
	print(snoozeTime)
	alarm.start(snoozeTime)
	alarm_light.light_color = Color.WHITE
	snooze = true

func alarmTimeout():
	snooze = false
	alarm_light.light_color = Color.RED
