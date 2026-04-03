extends CollisionObject3D

class_name Interactable

@export var prompt_message = "Interact"
@export var prompt_input = "interact"

signal interacted(body)

func get_prompt():
	var key_name = ""
	for action in InputMap.action_get_events(prompt_input):
		if action is InputEventKey:
			key_name = action.as_text_physical_keycode()
			break
	return prompt_message + ""

func interact(body):
	#print("push")
	interacted.emit(body)
	GlobalMessenger.INTERACTED.emit()
