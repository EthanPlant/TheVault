extends Panel


func _on_button_pressed() -> void:
	EventBus.emit_signal("switch_page", "coldmail.org")
