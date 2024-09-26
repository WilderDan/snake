extends Sprite2D

func spawn(global_location): 
	global_position = global_location
	show()
	$Timer.start()
	
func _on_timer_timeout() -> void:
	hide()
	$Timer.stop()
