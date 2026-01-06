extends Label

var textState := 0;
var alarmingItem := "Before you can pick up this item, Please disarm the home alarm. \n Please wake up."
var alarmingDoor := "Please wake up. Before continuing you must disarm the alarm."
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
	if alarmIsTimedout:
		if textState == 0:
			activeText = ""
		elif textState == 1:
			activeText = alarmingItem
		elif textState == 2:
			activeText = alarmingDoor
		elif textState == 3:
			activeText = alarmingWorld
	
	text = activeText
	
func alarmTimedout():
	alarmIsTimedout = true

func alarmSnoozed():
	alarmIsTimedout = false
	
func itemCalled():
	textState = 1
	t.stop()
	t.start()
	
func doorCalled():
	textState = 2
	t.stop()
	t.start()
	
func worldCalled():
	textState = 3
	t.stop()
	t.start()

func textTimeout():
	textState = 0
