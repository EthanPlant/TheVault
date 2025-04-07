extends Panel



func _on_button_pressed() -> void:
    var password = $LoginContainer/LineEdit.text
    if password == "fire":
        $LoginContainer.visible = false
        $PuzzleText.visible = true
    else:
        $LoginContainer/LineEdit.clear()
        $LoginContainer/LineEdit.placeholder_text = "Invalid passkey"
        $LoginContainer/LineEdit.grab_focus()
