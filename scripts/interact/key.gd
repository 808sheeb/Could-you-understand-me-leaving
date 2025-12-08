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

func reset_key():
	keyParent.add_child(self)
	pass
