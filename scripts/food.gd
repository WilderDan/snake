extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func show_help():
	$HelpText.show()
	$Timer.start()
	
func _on_timer_timeout() -> void:
	$HelpText.hide()
