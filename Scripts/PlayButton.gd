extends TextureButton

var main_scene = preload("res://Screens/Main.tscn")

func _on_pressed():
	MusicPlayer.stream = load('res://Assets/Sounds/Ghoulish_Fun.ogg')
	MusicPlayer.play()
	get_tree().change_scene_to(main_scene)
