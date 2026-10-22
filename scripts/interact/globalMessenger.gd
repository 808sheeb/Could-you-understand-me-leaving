extends Node

signal ALARM_TIMEOUT
signal ALARM_SNOOZE
signal KEY_VILLAGE
signal INTERACTED
signal RESET
signal SPAWN_KEYS
signal INIT_READY

signal UI_ITEM
signal UI_ITEM_2
signal UI_DOOR
signal UI_WORLD

signal BUTTON_PRESS

var manager: GdSerialManager

var isAlarmOff = false

func _ready():
	manager = GdSerialManager.new()
	manager.data_received.connect(_on_data)
	manager.port_disconnected.connect(_on_disconnect)

	# mode is optional; defaults to MODE_RAW. Use the constants for clarity:
	# MODE_RAW (emit all chunks), MODE_LINE_BUFFERED (wait for \n), MODE_CUSTOM_DELIMITER
	if manager.open("/dev/cu.usbserial-022AF9F7", 9600, 1000, GdSerialManager.MODE_LINE_BUFFERED):  # replace COM3 with ur com port
		print("Connected to fuck ass usb")
		
	

func _process(_delta):
	# This triggers the signals above
	manager.poll_events()

func _on_data(port: String, data: PackedByteArray):
	print("Data from ", port, ": ", data.get_string_from_utf8())
	# if data is the one you're looking for, emit a signal
	
	if(!isAlarmOff && int(data.get_string_from_utf8()) == 1):
		BUTTON_PRESS.emit()

func _on_disconnect(port: String):
	print("Lost connection to ", port)
