extends Panel

func _on_login_button_pressed() -> void:
	EventBus.emit_signal("switch_page", "silentarchive.garlic/login")
