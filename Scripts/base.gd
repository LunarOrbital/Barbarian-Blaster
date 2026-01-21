extends Node3D
class_name base
@onready var label_3d: Label3D = $Label3D
@export var max_health := 5
var health : int :
	set(new_health):
		health = new_health
		label_3d.text = str(health) + " / " + str(max_health)
func _ready() -> void:
	health = max_health

func take_damage() -> void:
	health -=1
	print("damage take")
	if (health < 0):
		get_tree().reload_current_scene()
