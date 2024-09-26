extends Node2D

const MIN_DRAG = 100

var direction: Vector2
var swipe_start = null

var body_scene = preload("res://scenes/body.tscn")
var body = []

func _ready():
	direction = Vector2.DOWN


func _process(_delta):
	var new_direction = direction
	
	if Input.is_action_pressed("down"):
		new_direction = Vector2.DOWN
	elif Input.is_action_pressed("up"):
		new_direction = Vector2.UP
	elif Input.is_action_pressed("left"):
		new_direction = Vector2.LEFT
	elif Input.is_action_pressed("right"):
		new_direction = Vector2.RIGHT
		
	if new_direction == (-1 * direction):
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")
	
	direction = new_direction

func _input(event):
   # Mouse in viewport coordinates. 
	if event is InputEventMouseButton:
		if swipe_start == null:
			swipe_start = event.position
		else:
			var new_direction = calculate_swipe_direction(event.position)
			swipe_start = null
			if new_direction == (-1 * direction):
				get_tree().change_scene_to_file("res://scenes/gameover.tscn")
			direction = new_direction
		
func calculate_swipe_direction(swipe_end):
	if swipe_start == null:
		return direction
		
	var swipe = swipe_end - swipe_start
	print(swipe)
	  
	if abs(swipe.x) > MIN_DRAG:
		if swipe.x > 0:
			return Vector2.RIGHT
		else:
			return Vector2.LEFT
	elif abs(swipe.y) > MIN_DRAG:
		if swipe.y > 0:
			return Vector2.DOWN
		else:
			return Vector2.UP
			
	return direction
	
func _on_move_tick_timeout() -> void:
	$Head.direction = direction
	
	var current_tile: Vector2i = $"../TileMap".local_to_map($Head.global_position)
	
	var target_tile: Vector2i = Vector2i(
		current_tile.x + direction.x,
		current_tile.y + direction.y
	)
	
	var tile_data: TileData = $"../TileMap".get_cell_tile_data(0, target_tile)
	
	if tile_data.get_custom_data("water") == true:
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")

	update_body()
	$Head.global_position = $"../TileMap".map_to_local(target_tile)
	$Head.update_orientation(direction)
	
	
func grow():
	var body_segment = body_scene.instantiate()
	body_segment.direction = $Tail.direction
	add_child.call_deferred(body_segment)
	body.append(body_segment)
	
func update_body():
	var body_end = len(body) - 1
	var tail_leader = $Head if body_end == -1 else body[body_end]
	update_segment($Tail, tail_leader)
	
	for i in range(body_end, 0, -1):
		update_segment(body[i], body[i-1])
			
	if len(body) > 0:
		update_segment(body[0], $Head)
		
func update_segment(target, leader):
	target.global_position = leader.global_position
	target.update_orientation(leader.direction)
	
