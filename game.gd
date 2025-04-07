extends Control

func _ready() -> void:
	# Connect the signal to the function
	EventBus.connect("end", _end)
	EventBus.connect("end2", _end2)

func _end() -> void:
	$ColorRect.hide()

func _end2() -> void:
	$ColorRect.show()
	EventBus.emit_signal("switch_page", "the-end.garlic")
