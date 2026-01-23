extends PathFollow3D
class_name enemy
##The speed in m/s the enemy will move
@export var speed := 10
@export var max_health := 50
var health : int :
	set(new_health):
		health = new_health
		if (health < 1):
			queue_free()

@onready var base2 : base = get_tree().get_first_node_in_group("base")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (progress_ratio >=1):
		base2.take_damage()
		queue_free()
	else:
		progress += speed *delta
