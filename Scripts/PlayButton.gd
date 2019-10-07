extends TextureButton

var main_scene = preload("res://Screens/Main.tscn")

func _on_pressed():
	get_tree().change_scene_to(main_scene)
