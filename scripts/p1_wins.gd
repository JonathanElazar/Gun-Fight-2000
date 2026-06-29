extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += 10


func _on_body_entered(body: Node2D) -> void:
	if body.name == "P2":
		get_tree().change_scene_to_file("res://scenes/player_one_wins.tscn")
