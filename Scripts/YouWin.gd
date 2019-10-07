extends Control

var main = preload('res://Screens/Title.tscn')

func _ready():
	$AnimationPlayer.play('Fade in')

func _on_animation_finished(anim_name):
	if anim_name == 'Fade in':
		$LaughSound.play()

func _on_LaughSound_finished():
	get_tree().change_scene_to(main)
