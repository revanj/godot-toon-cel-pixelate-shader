extends Control

func _ready():
	#get_viewport().size = viewport_extents
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var image = get_viewport().get_texture().get_data()
		image.flip_y()
		image.save_png("res://save.png")

func scale_texture(old_texture:Texture, width, height) -> Texture:
	var image := old_texture.get_data()
	image.resize(width, height)
	var new_texture = ImageTexture.new()
	new_texture.create_from_image(image)
	return new_texture
