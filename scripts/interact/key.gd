extends Interactable
class_name Key

@export var keyName = ""
var keyBody = null
var keyParent = null
var pickedUp = false

func _ready() -> void:
	GlobalMessenger.connect('ALARM_SNOOZE', reset_key)

func _on_interacted(_body):
	keyBody = _body.get_parent_node_3d()
	keyParent = keyBody.get_parent_node_3d()
	keyBody.remove_child(self)
	pickedUp = true
	
	if keyName == "winter":
		GlobalMessenger.KEY_WINTER.emit()
	elif keyName == "merry":
		GlobalMessenger.KEY_MERRY.emit()

func reset_key():
	if pickedUp:
		keyParent.add_child(self)
		if keyName == "winter":
			self.transform.origin = Vector3(-1.164,0.939,0.336)
			self.rotation_degrees = Vector3(0, 56.5, 0)
		if keyName == "merry":
			self.transform.origin = Vector3(-8.228,3.28,-18.314)
			self.rotation_degrees = Vector3(-73.6, 0, -11.1)
			self.scale = Vector3(0.095, 0.095, 0.095)
		pickedUp = false
