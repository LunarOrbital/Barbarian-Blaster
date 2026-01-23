extends Area3D

var direction := Vector3.FORWARD
@export var speed := 10
func _physics_process(delta: float) -> void:
	position += direction * delta * speed

func _on_timer_timeout() -> void:
	self.queue_free()


func _on_area_entered(area: Area3D) -> void:
	if (area.is_in_group("Enemy_area")):
		area.get_parent().health -= 25
		queue_free()
