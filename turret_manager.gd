extends Node3D
class_name TurretManager
@export var turret : PackedScene 

func build_turret(newV3) -> void:
	var newTurret = turret.instantiate()
	add_child(newTurret)
	newTurret.global_position = newV3
