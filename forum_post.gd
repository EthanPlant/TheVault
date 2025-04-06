extends Panel

@export var Author: String
@export var Post: String

func _ready() -> void:
    # Set the author and post text
    $Author.text = Author
    $ScrollContainer/Post.text = Post