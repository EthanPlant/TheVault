extends Panel

const VAULT_CODE: Array = ["2", "23", "3", "37", "67", "7"]

@onready var login_contents: ScrollContainer = $LoginContents
@onready var end: Panel = $EndingContents
@onready var num1: LineEdit = $LoginContents/VBoxContainer/HBoxContainer/Num1
@onready var num2: LineEdit = $LoginContents/VBoxContainer/HBoxContainer/Num2
@onready var num3: LineEdit = $LoginContents/VBoxContainer/HBoxContainer/Num3
@onready var num4: LineEdit = $LoginContents/VBoxContainer/HBoxContainer/Num4
@onready var num5: LineEdit = $LoginContents/VBoxContainer/HBoxContainer/Num5
@onready var num6: LineEdit = $LoginContents/VBoxContainer/HBoxContainer/Num6

func _on_submit() -> void:
	var input_code: Array = [
		num1.text,
		num2.text,
		num3.text,
		num4.text,
		num5.text,
		num6.text
	]
	input_code.sort()

	if input_code.hash() == VAULT_CODE.hash():
		login_contents.hide()
		end.show()
		end.find_child("AnimationPlayer").play("FadeInText")
		EventBus.emit_signal("end")
	else:
		num1.clear()
		num2.clear()
		num3.clear()
		num4.clear()
		num5.clear()
		num6.clear()
		
		login_contents.find_child("VBoxContainer").find_child("Label").text = "Incorrect code."


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	end.find_child("Timer").start()


func _on_timer_timeout() -> void:
	EventBus.emit_signal("end2")
