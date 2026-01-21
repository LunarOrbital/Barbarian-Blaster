extends Camera3D
@onready var ray_cast_3d: RayCast3D = $RayCast3D
@export var gridMap : GridMap
func _process(_delta: float) -> void:
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position= project_local_ray_normal(mouse_position) * 100
	#update immediatley
	if (ray_cast_3d.is_colliding()):
		var collider = ray_cast_3d.get_collider()
		if (collider is GridMap):
			var collision_point = ray_cast_3d.get_collision_point()
			var cell = gridMap.local_to_map(collision_point)
			if gridMap.get_cell_item(cell) == 0:
				Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
				if (Input.is_action_just_pressed("click")):
					gridMap.set_cell_item(cell, 1)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
