extends Control

func _process(_delta: float) -> void:
	# simulate button press
	if Input.is_action_pressed("enter") or Input.is_action_pressed("space"):
		_on_button_pressed()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/gameplay.tscn")


func _on_music_finished() -> void:
	$Music.play()
