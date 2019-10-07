extends KinematicBody

export var motion: Vector3
export var hitpoints: int
var is_alive = true

func _ready():
	$AnimationPlayer.play("Run")
	
func _physics_process(delta):
	if is_alive:
		move_and_collide(delta * motion)

func kill():
	hitpoints -= 1
	if hitpoints <=0:
		is_alive = false
		$AnimationPlayer.play("Die")
		$CollisionShape.disabled = true

func _on_animation_finished(anim_name):
	if anim_name == "Die":
		State.kill_player()
