extends CharacterBody2D
@export var inv : Inv
# 1. Definiáljuk a sebességet, hogy a kód tudja, mi az a 'speed'
var speed: float = 400.0

func _ready():
	# Ide nem kell semmi extra az induláshoz
	pass

func _physics_process(delta):
	# Irány lekérése
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	
	# 2. EZ A KULCS: Ez a függvény mozgatja meg a karaktert a 'velocity' alapján
	move_and_slide()
	
	
	
