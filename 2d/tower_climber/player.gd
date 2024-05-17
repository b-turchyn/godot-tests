extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

@onready var coyote_time = %CoyoteTime
@onready var sprite = $Sprite

var cannot_jump: bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Initialize Coyote Time
	if is_on_floor():
		cannot_jump = false
		if not coyote_time.is_stopped(): coyote_time.stop()
	elif not is_on_floor() and not cannot_jump and coyote_time.is_stopped():
		coyote_time.start()
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and not cannot_jump:
		cannot_jump = true
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		sprite.animation = "Walking"
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sprite.animation = "Idle"

	move_and_slide()


func _on_coyote_time_timeout():
	if not is_on_floor():
		cannot_jump = true
