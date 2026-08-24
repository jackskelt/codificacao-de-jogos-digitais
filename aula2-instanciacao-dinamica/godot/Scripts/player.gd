extends CharacterBody2D

@export var speed: float = 400.0
@onready var fire_rate_timer: Timer = $FireRateTimer
var is_shooting: bool = false

const BULLET_SCENE = preload("res://Bullet.tscn")
@onready var bullet_marker: Marker2D = $BulletMarker

func _physics_process(_delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = input_dir * speed
	
	velocity = lerp(get_real_velocity(), velocity, 0.1)
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action("shoot"):
		is_shooting = event.is_pressed()


func _process(_delta: float) -> void:
	if is_shooting and fire_rate_timer.is_stopped():
		fire_rate_timer.start()
		shoot()

func shoot() -> void:
	var bullet := BULLET_SCENE.instantiate()
	bullet.global_position = bullet_marker.global_position
	get_tree().current_scene.add_child(bullet)
