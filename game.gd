extends VBoxContainer

@export var address_bar: LineEdit
@export var page: MarginContainer

var current_page: Control

var page_map: Dictionary = {
	"site1.com": "site1",
}

func load_page(url: String) -> void:
	if current_page:
		page.remove_child(current_page)
		current_page.queue_free()
	
	var page_name = page_map.get(url)
	if !page_name:
		print("Page not found")
		return
	var path = "res://sites/%s/%s.tscn" % [page_name, page_name]
	var page_scene = load(path).instantiate()
	page.add_child(page_scene)
	current_page = page_scene
	address_bar.text = url

func _on_button_pressed() -> void:
	var url = address_bar.text
	if url in page_map:
		load_page(url)
	else:
		print("Invalid URL")
		address_bar.text = ""
		return
