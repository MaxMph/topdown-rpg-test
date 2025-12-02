extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var sprint_mod = 1
var fric = 20

var sprite_ang = 0

func _physics_process(delta: float) -> void:
	
	var direction := Input.get_vector("left","right","up","down").normalized()
	if direction != Vector2.ZERO:
		velocity.x = direction.x * (SPEED * sprint_mod)
		velocity.y = direction.y * (SPEED * sprint_mod)
	else:
		velocity.x = move_toward(velocity.x, 0, fric)
		velocity.y = move_toward(velocity.y, 0, fric)
	
	if velocity != Vector2.ZERO:
		sprite_ang = velocity.angle()
		$ScreenshotFrom20251202162553RemovebgPreview.rotation = sprite_ang + deg_to_rad(90)
	move_and_slide()
