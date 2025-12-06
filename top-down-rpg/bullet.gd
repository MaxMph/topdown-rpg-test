extends CharacterBody2D


var speed = 600.0



func _physics_process(delta: float) -> void:
	
	var direction = Vector2.from_angle(rotation + deg_to_rad(90))
	velocity = direction * -speed

	move_and_slide()
