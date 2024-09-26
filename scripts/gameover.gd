extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var result = $"/root/GlobalState".food_eaten
	var format = "You ate %s cute little bunny..." if result == 1 else "You ate %s cute little bunnies..."
	$"VBoxContainer/ResultText".text = format % result
	$"/root/GlobalState".food_eaten = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# simulate button press
	if Input.is_action_pressed("enter") or Input.is_action_pressed("space"):
		_on_button_pressed()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/gameplay.tscn")
