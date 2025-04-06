extends Panel

@onready var text = $MarginContainer/HBoxContainer/LineEdit

signal switch_page(address: String)

func set_text(new_text: String) -> void:
	text.text = new_text

func _on_go_button_pressed() -> void:
	emit_signal("switch_page", text.text)
