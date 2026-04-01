extends Node2D
@onready var alarm: Timer = $Alarm
@onready var init: Timer = $Init
var rng = RandomNumberGenerator.new()
@export var snooze = true

signal snoozed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initGame()

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
		GlobalMessenger.SPAWN_KEYS.emit()
		snoozed.emit()

func startAlarm():
	var snoozeTime = rng.randi_range(20, 30)
	#var snoozeTime = rng.randi_range(240,470)
	#print(snoozeTime)
	alarm.start(snoozeTime)
	snooze = true

func initGame():
	var initTime = 1
	init.start(initTime)
	
func _on_init_timeout() -> void:
	startAlarm()
	GlobalMessenger.SPAWN_KEYS.emit()
