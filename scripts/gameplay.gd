extends Node2D

const COLS = 27
const ROWS = 14

func _ready() -> void:
	spawn_food()

func spawn_food():
	var target_tile: Vector2i = Vector2i(
		randi() % (COLS - 1) + 1,
		randi() % (ROWS - 1) + 1
	)
	$Food.global_position = $TileMap.map_to_local(target_tile)
	$Food.show_help()

func _on_food_area_entered(area: Area2D) -> void:
	if area.name == "Head":
		$"/root/GlobalState".food_eaten += 1
		$EatSound.play()
		$Blood.spawn($Food.global_position)
		spawn_food()
		$Player.grow()


func _on_background_music_finished() -> void:
	$BackgroundMusic.play()
