extends Node3D
@export var proj: PackedScene 
@export var time := 1.0
@onready var timer: Timer = $Timer
@onready var enemy_path : Path3D

#turn and look at enemy
func  _physics_process(delta: float) -> void:
	var enemy = enemy_path.get_children().back()
	look_at(enemy.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	timer.wait_time = time
	var newProj = proj.instantiate()
	add_child(newProj)
	newProj.global_position = global_position + Vector3(0,2.8,-2)
