extends Area2D

@export var speed := 1000.0
var _velocity := Vector2()

func _ready() -> void:
	set_projectile_direction(0)

func set_projectile_direction(angle: float) -> void:
	_velocity = Vector2.UP.rotated(angle) * speed
	rotate(angle)

func _physics_process(delta: float) -> void:
	translate(_velocity * delta)
