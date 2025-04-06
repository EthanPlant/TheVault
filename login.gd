extends Panel



func _on_button_pressed() -> void:
    var password = $LoginContainer/LineEdit.text
    if password == "fire":
        $LoginContainer.visible = false
        $PuzzleText.visible = true
