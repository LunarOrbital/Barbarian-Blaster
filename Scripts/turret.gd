extends Node3D
@export var proj: PackedScene 
@export var time := 1.0
@onready var timer: Timer = $Timer
func _on_timer_timeout() -> void:
	timer.wait_time = time
	var newProj = proj.instantiate()
	add_child(newProj)
	newProj.global_position = global_position + Vector3(0,2.8,-2)
