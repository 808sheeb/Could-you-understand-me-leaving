extends FogVolume
var isSnoozed = true
var house_green = Color("b8ffc7")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalMessenger.connect("ALARM_TIMEOUT", alarm_toggle)
	GlobalMessenger.connect("ALARM_SNOOZE", alarm_toggle)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if isSnoozed:
		self.material.emission = house_green
	if !isSnoozed:
		self.material.emission = Color.RED
	
func alarm_toggle():
	isSnoozed = !isSnoozed
