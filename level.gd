extends Node2D

var target: Vector2 = Vector2.ZERO
var speed = 300
var acceleration = 7

@onready var char: CharacterBody2D = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction: Vector2 = (target - char.global_position).normalized()
	
	char.velocity = char.velocity.lerp(direction * speed, acceleration * delta)
	
	char.move_and_slide()


func _on_nav_timer_timeout():
	target = get_global_mouse_position()
