extends Node2D

@onready var bullet_scene = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var new_bullet = bullet_scene.instantiate()
	new_bullet.global_transform = global_transform
	get_parent().get_parent().get_parent().add_child(new_bullet)
