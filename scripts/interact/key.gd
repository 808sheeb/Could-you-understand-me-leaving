extends Interactable
class_name Key

@export var keyName = ""
var keyBody = null
var keyParent = null

func _ready() -> void:
	GlobalMessenger.connect('ALARM_SNOOZE', reset_key)

func _on_interacted(_body):
	keyBody = _body.get_parent_node_3d()
	keyParent = keyBody.get_parent_node_3d()
	keyBody.remove_child(self)
	
	if keyName == "winter":
		GlobalMessenger.KEY_WINTER.emit()
	elif keyName == "gallery":
		GlobalMessenger.KEY_GALLERY.emit()
	elif keyName == "ether":
		GlobalMessenger.KEY_ETHER.emit()
	elif keyName == "toilet":
		GlobalMessenger.KEY_TOILET.emit()

func reset_key():
	keyParent.add_child(self)
	self.transform.origin = Vector3(0,0.5,0)
