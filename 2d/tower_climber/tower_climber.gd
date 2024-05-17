extends Node2D
@onready var camera = $Camera
@onready var player = $Player

var viewport_height: int
	
func _physics_process(_delta):
	calculate_camera_position()
	
func calculate_camera_position():
	if viewport_height == 0:
		return
		
	var player_y = player.position.y
	# Round to the nearest multiple of viewport height
	var y = round(player_y / viewport_height) * viewport_height
	camera.position.y = y


func _on_tree_entered():
	viewport_height = get_viewport_rect().size.y
