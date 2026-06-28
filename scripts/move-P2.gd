extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -600.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction := Input.get_axis("p2-left", "p2-right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("p2-jump"):
		velocity.y = JUMP_VELOCITY

	
	
	move_and_slide()
