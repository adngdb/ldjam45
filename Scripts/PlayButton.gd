extends TextureButton

var main_scene = preload("res://Scenes/Main.tscn")

func _on_pressed():
	get_tree().change_scene_to(main_scene)
