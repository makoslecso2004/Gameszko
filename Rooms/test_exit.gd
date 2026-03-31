extends Node2D

@onready var timer := $Timer as Timer



func _on_area_2d_body_entered(body: Node2D) -> void:
	timer.start()
	 



func _on_timer_timeout() -> void:
	print_debug("Ok")
