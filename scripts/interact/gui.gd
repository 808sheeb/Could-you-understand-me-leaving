extends Node2D
@onready var alarm = $alarm_timer
@onready var light = $"../floorplan/Parents/light_alarm"
var rng = RandomNumberGenerator.new()
var snooze = true
signal isSnoozed()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light.light_color = Color.WHITE
	var randTime = rng.randi_range(8,12)
	alarm.start(randTime)
	print(randTime)
	isSnoozed.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_alarm_timeout() -> void:
	print("alarm timeout")
	snooze = false
	if !snooze:
		light.light_color = Color.RED
		isSnoozed.emit()

func _on_button_push(_body):
	if !snooze:
		snooze = true
		light.light_color = Color.WHITE
		isSnoozed.emit()
		var randTime = rng.randi_range(8,12)
		alarm.start(randTime)
		print(randTime)
