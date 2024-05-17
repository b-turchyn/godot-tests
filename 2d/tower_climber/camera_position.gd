extends Node
class_name CameraPosition

@export var camera: Camera2D
@export var min_height: int

func _init(camera: Camera2D):
	self.camera = camera
	# self.min_height = camera.global_position + (camera.)

func _to_string() -> String:
	return "Min Height: %d\tCamera: %s" % [min_height, camera]
