extends Area2D

@export var animation_time = 0.5

const TILE_SIZE = 40
var is_tongue_out
var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	is_tongue_out = false
	$AnimationTimer.wait_time = animation_time
	
func _on_animation_timer_timeout():
	var x_coord = 0 if is_tongue_out else TILE_SIZE
	$Sprite2D.region_rect = Rect2(x_coord, 0, TILE_SIZE, TILE_SIZE)
	is_tongue_out = not is_tongue_out
	$AnimationTimer.start()
	
func update_orientation(new_direction: Vector2) -> void:
	if new_direction == Vector2.DOWN:
		rotation = 0
	elif new_direction == Vector2.UP:
		rotation = PI
	elif new_direction == Vector2.RIGHT:
		rotation = 3 * PI / 2
	else:
		rotation = PI / 2
