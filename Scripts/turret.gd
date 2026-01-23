extends Node3D
@export var proj: PackedScene 
@onready var timer: Timer = $Timer
@onready var enemy_path : Path3D
@export var turret_range := 10.0
var target 
#turn and look at enemy
func  _physics_process(_delta: float) -> void:
	target =find_best_target()
	if (target != null):
		look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if (target != null):
		var newProj = proj.instantiate()
		add_child(newProj)
		newProj.global_position = global_position + Vector3(0,2.8,-2)
		newProj.direction = basis.z

func find_best_target() -> PathFollow3D:
	var best_target = null
	var best_progress = 0
	for enemy2 in enemy_path.get_children():
		if (enemy2 is enemy):
			if (enemy2.progress > best_progress):
				var dist = global_position.distance_to(enemy2.global_position)
				if (dist<=turret_range):
					best_target = enemy2
					best_progress = enemy2.progress
	return best_target
