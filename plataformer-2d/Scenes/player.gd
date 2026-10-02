extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var jump_count: int = 0
@export var max_jumps: int = 2


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		
		animation.flip_h = direction < 0.1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if is_on_floor():
		if abs(velocity.x) > 0.1:
			animation.play("running")
		else:
			animation.play("idle")
	else:
		if velocity.y > 0.1:
			animation.play("fall")
		else:
			animation.play("jump")

	move_and_slide()
