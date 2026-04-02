extends Node2D
@onready var alarm: Timer = $Alarm
@onready var init: Timer = $Init
var rng = RandomNumberGenerator.new()
@export var snooze = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initGame()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	#print("Alarm: " + str(alarm.time_left))
	#print('Init: ' + str(init.time_left))
	
func _on_alarm_timeout() -> void:
	GlobalMessenger.ALARM_TIMEOUT.emit()
	snooze = false

func _on_button_interacted(_body):
	if !snooze:
		GlobalMessenger.ALARM_SNOOZE.emit()
		initGame()

func startAlarm():
	var snoozeTime = rng.randi_range(25,300)
	alarm.start(snoozeTime)

func initGame():
	var initTime = rng.randi_range(45, 80)
	init.start(initTime)
	snooze = true
	
func _on_init_timeout() -> void:
	GlobalMessenger.SPAWN_KEYS.emit()
	GlobalMessenger.INIT_READY.emit()
	startAlarm()
