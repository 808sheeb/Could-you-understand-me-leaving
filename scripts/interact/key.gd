extends Interactable
class_name Key

@export var keyName = ""
var keyBody = null
var keyParent = null
var pickedUp = false
var isAlarmGoingOff = false
var readyForPickup = false

func _ready() -> void:
	GlobalMessenger.connect('SPAWN_KEYS', reset_key)
	GlobalMessenger.connect('ALARM_TIMEOUT', alarming)
	#GlobalMessenger.connect('ALARM_SNOOZE', snooze)
	GlobalMessenger.connect('INIT_READY', initReady)

func _process(_delta) -> void:
	#print(readyForPickup)
	pass
	
func _on_interacted(_body):
	if !isAlarmGoingOff and readyForPickup:
		keyBody = _body.get_parent_node_3d()
		keyParent = keyBody.get_parent_node_3d()
		keyBody.remove_child(self)
		pickedUp = true
	
		if keyName == "winter":
			GlobalMessenger.KEY_WINTER.emit()
		elif keyName == "merry":
			GlobalMessenger.KEY_VILLAGE.emit()
		elif keyName == "meadow":
			GlobalMessenger.KEY_MEADOW.emit()
	elif isAlarmGoingOff || !readyForPickup:
		GlobalMessenger.UI_ITEM.emit()

func reset_key():
	if pickedUp:
		keyBody.add_child(self)
		#if keyName == "winter":
			#self.transform.origin = Vector3(6.256,1.711,-18.685)
			#self.rotation_degrees = Vector3(0, -62.6, 0)
		#if keyName == "merry":
			#self.transform.origin = Vector3(-8.228,3.28,-18.314)
			#self.rotation_degrees = Vector3(-73.6, 0, -11.1)
			#self.scale = Vector3(0.095, 0.095, 0.095)
		#if keyName == "meadow":
			#self.transform.origin = Vector3(-8.1,1.364,-35.983)
			#self.rotation_degrees = Vector3(0, -34.2, 0)
			#self.scale = Vector3(0.495, 0.495, 0.495)
		pickedUp = false

func alarming():
	isAlarmGoingOff = true
	readyForPickup = false
	#print('cant pickup')
	
func initReady():
	isAlarmGoingOff = false
	readyForPickup = true
	#print("emit recieved")
