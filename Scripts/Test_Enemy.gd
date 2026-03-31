extends CharacterBody2D

var speed: float = 200.0
var knockback = 0
var player: Node2D

@onready var navi := $NavigationAgent2D as NavigationAgent2D
@onready var room := $"../TestRoom/TileMap" as TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]

func getPath():
	navi.target_position = player.global_position
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if player:
		var direction := to_local(navi.get_next_path_position()).normalized()
		
		if direction != Vector2.ZERO:
			velocity = (direction * speed) + (-direction * knockback) 
		else:
			velocity = velocity.move_toward(Vector2.ZERO, speed)
		
		# 2. EZ A KULCS: Ez a függvény mozgatja meg a karaktert a 'velocity' alapján
		move_and_slide()


func _on_timer_timeout():
	getPath()
	pass # Replace with function body.
