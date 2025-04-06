extends Panel

var page_map: Dictionary = {
	"coldmail.org": "res://inbox.tscn",
	"silentarchive.garlic": "res://forum.tscn",
	"silentarchive.garlic/login": "res://login.tscn",
}


var current_page: String = "coldmail.org"
var current_scene: Control

func _ready() -> void:
	_load_page(preload("res://inbox.tscn"))
	EventBus.connect("switch_page", _on_switch_page)
	$AddressBar.set_text(current_page)

func _on_switch_page(address: String) -> void:
	if address in page_map:
		current_page = address
		var page_scene: PackedScene = load(page_map[address])
		$AddressBar.set_text(current_page)
		_load_page(page_scene)
	else:
		print("Page not found: ", address)

func _load_page(page_scene: PackedScene) -> void:
	if current_scene:
		current_scene.queue_free()

	current_scene = page_scene.instantiate()
	$Page.add_child(current_scene)
