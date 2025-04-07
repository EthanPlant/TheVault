extends Panel

@onready var popup: Panel = $Popup

func _ready() -> void:
    popup.hide()

func _on_icon_pressed() -> void:
    popup.show()

func _on_close_button_pressed() -> void:
    popup.hide()

func _on_continue_button_pressed() -> void:
    EventBus.emit_signal("switch_page", "dmF1bHQtYXJjaGl2ZQ==.garlic/login")