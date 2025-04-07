extends Panel

const PASSWORD: String = "57017"

@onready var password_input = $MarginContainer/HBoxContainer/Password

func _on_enter_button_pressed() -> void:
    if password_input.text == PASSWORD:
        EventBus.emit_signal("switch_page", "aGlkZGVuLW5ldHdvcmsudmF1bHQ=.garlic/")
    else:
        print("Incorrect password")