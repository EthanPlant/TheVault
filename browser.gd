extends Panel

var page_map: Dictionary = {
	"ldjam.com/events/ludum-dare/57/the-vault": "res://main_menu.tscn",
	"coldmail.org": "res://inbox.tscn",
	"silentarchive.garlic": "res://forum.tscn",
	"silentarchive.garlic/login": "res://login.tscn",
	"dead-drop.cryptonetwork.cc": "res://dead_drop.tscn",
	"aGlkZGVuLW5ldHdvcmsudmF1bHQ=.garlic/": "res://hidden_network.tscn",
	"dmF1bHQtYXJjaGl2ZQ==.garlic/login": "res://vault_login.tscn",
	"the-end.garlic": "res://end_screen.tscn",
}


var current_page: String = "https://ldjam.com/events/ludum-dare/57/the-vault"
var current_scene: Control

func _ready() -> void:
	_load_page(preload("res://main_menu.tscn"))
	EventBus.connect("switch_page", _on_switch_page)
	$AddressBar.set_text(current_page)

func _on_switch_page(address: String) -> void:
	if address in page_map:
		current_page = address
		var page_scene: PackedScene = load(page_map[address])
		$AddressBar.set_text(current_page)
		_load_page(page_scene)
	else:
		$InvalidUrlPopup.show()

func _load_page(page_scene: PackedScene) -> void:
	if current_scene:
		current_scene.queue_free()

	current_scene = page_scene.instantiate()
	$Page.add_child(current_scene)


func _on_dismiss_button_pressed() -> void:
	$InvalidUrlPopup.hide()
