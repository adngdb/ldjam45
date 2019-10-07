extends KinematicBody

export var motion: Vector3
export var hitpoints: int
var initialHitPoints: int

var is_moving = true
var is_alive = true

func _ready():
	initialHitPoints = hitpoints
	$AnimationPlayer.play("Run")

func _physics_process(delta):
	if is_alive and is_moving:
		move_and_collide(delta * motion)

func reset_health():
	hitpoints = initialHitPoints

func hurt():
	hitpoints -= 1
	if hitpoints <= 0:
		is_alive = false
		$AnimationPlayer.play("Die")
		$CollisionShape.disabled = true

func stop_movement():
	is_moving = false

func _on_animation_finished(anim_name):
	if anim_name == "Die":
		State.kill_player()
