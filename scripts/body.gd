extends Area2D


var direction
const TILE_SIZE = 40

@export var sprite_region = Rect2(0, 40, TILE_SIZE, TILE_SIZE)

func _ready():
	$Sprite2D.region_rect = sprite_region
	
# Should be able to ignore opposite directions as that implies collision
func update_orientation(new_direction: Vector2) -> void:
	if direction == Vector2.DOWN and new_direction == Vector2.DOWN:
		$Sprite2D.region_rect = Rect2(0, 40, TILE_SIZE, TILE_SIZE)
	elif direction == Vector2.DOWN and new_direction == Vector2.LEFT:
		$Sprite2D.region_rect = Rect2(80, 40, TILE_SIZE, TILE_SIZE)
	elif direction == Vector2.DOWN and new_direction == Vector2.RIGHT:
		$Sprite2D.region_rect = Rect2(40, 40, TILE_SIZE, TILE_SIZE)
		
	elif direction == Vector2.UP and new_direction == Vector2.UP:
		$Sprite2D.region_rect = Rect2(0, 40, TILE_SIZE, TILE_SIZE)
	elif direction == Vector2.UP and new_direction == Vector2.LEFT:
		$Sprite2D.region_rect = Rect2(80, 0, TILE_SIZE, TILE_SIZE)
	elif direction == Vector2.UP and new_direction == Vector2.RIGHT:
		$Sprite2D.region_rect = Rect2(40, 0, TILE_SIZE, TILE_SIZE)
			
	elif direction == Vector2.LEFT and new_direction == Vector2.LEFT:
		$Sprite2D.region_rect = Rect2(80, 80, TILE_SIZE, TILE_SIZE)
	elif direction == Vector2.LEFT and new_direction == Vector2.UP:
		$Sprite2D.region_rect = Rect2(40, 40, TILE_SIZE, TILE_SIZE)
	elif direction == Vector2.LEFT and new_direction == Vector2.DOWN:
		$Sprite2D.region_rect = Rect2(40, 0, TILE_SIZE, TILE_SIZE)
			
	elif direction == Vector2.RIGHT and new_direction == Vector2.RIGHT:
		$Sprite2D.region_rect = Rect2(80, 80, TILE_SIZE, TILE_SIZE)
	elif direction == Vector2.RIGHT and new_direction == Vector2.UP:
		$Sprite2D.region_rect = Rect2(80, 40, TILE_SIZE, TILE_SIZE)
	elif direction == Vector2.RIGHT and new_direction == Vector2.DOWN:
		$Sprite2D.region_rect = Rect2(80, 0, TILE_SIZE, TILE_SIZE)
		
	direction = new_direction

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Head":
		get_tree().change_scene_to_file.call_deferred("res://scenes/gameover.tscn")
	if area.name == "Food":
		$"../..".spawn_food()
