extends CharacterBody2D

const bullet = preload("res://scenes/p_2_bullet.tscn")
const SPEED = 300
const JUMP_VELOCITY = -600.0
var time_since_last_shot: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_since_last_shot += delta
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction := Input.get_axis("p2-left", "p2-right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("p2-jump"):
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("p2-shoot"):
		if time_since_last_shot > 1:
			var new_bullet = bullet.instantiate()
			new_bullet.global_position = global_position
			new_bullet.global_position.x -= 180
			new_bullet.global_position.y += 10
			get_parent().add_child(new_bullet)
			time_since_last_shot = 0.0

	
	
	move_and_slide()
