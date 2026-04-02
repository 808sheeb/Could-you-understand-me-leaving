extends Label

var textState := 0;
var alarmingItem := "This item is unavailable right now. \n Please give it time."
var alarmingDoor := "Please wake up. Before continuing you must disable the alarm."
var alarmingWorld := "To continute exploring, please disarm the alarm."
var alarmSnooze := "Please wake up. Please find yourself."
var activeText := ""
var alarmIsTimedout = false
@onready var t: Timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalMessenger.connect("ALARM_TIMEOUT", alarmTimedout)
	GlobalMessenger.connect("ALARM_SNOOZE", alarmSnoozed)
	GlobalMessenger.connect("UI_ITEM", itemCalled)
	GlobalMessenger.connect("UI_DOOR", doorCalled)
	GlobalMessenger.connect("UI_WORLD", worldCalled)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if textState == 1:
		activeText = alarmingItem
	if alarmIsTimedout:
		if textState == 2:
			activeText = alarmingDoor
		elif textState == 3:
			activeText = alarmingWorld
	if textState == 0:
		activeText = ""
	if textState == 5:
		activeText = alarmSnooze
	text = activeText
	
func alarmTimedout():
	alarmIsTimedout = true

func alarmSnoozed():
	alarmIsTimedout = false
	textState = 5
	t.stop()
	t.start(3)
	
func itemCalled():
	textState = 1
	t.stop()
	t.start(3)
	
func doorCalled():
	textState = 2
	t.stop()
	t.start(3)
	
func worldCalled():
	textState = 3
	t.stop()
	t.start(3)
	

func textTimeout():
	textState = 0
