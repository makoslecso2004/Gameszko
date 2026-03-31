extends Control

func  _ready():
	hide()
	get_tree().paused = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if !get_tree().paused:
			get_tree().paused = true
			show()
		else:
			get_tree().paused = false
			hide()

func _on_start_pressed():
	get_tree().paused = false
	hide()


func _on_options_pressed():
	pass # Replace with options menu scene transition


func _on_exit_pressed():
	get_tree().quit()
