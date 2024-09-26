extends Node2D

var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func update_orientation(new_direction: Vector2) -> void:
	if new_direction == Vector2.DOWN:
		rotation = 0
	elif new_direction == Vector2.UP:
		rotation = PI
	elif new_direction == Vector2.RIGHT:
		rotation = 3 * PI / 2
	else:
		rotation = PI / 2
		
	direction = new_direction
