extends Panel

@onready var text = $MarginContainer/HBoxContainer/LineEdit

func set_text(new_text: String) -> void:
	text.text = new_text

func _on_go_button_pressed() -> void:
	EventBus.emit_signal("switch_page", text.text)
