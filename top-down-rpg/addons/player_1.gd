extends CharacterBody2D


var SPEED = 300.0
var base_speed = 300.0
var max_speed = 600.0
var slowdown = 200

var boost_acc = 400
var boost_fuel = 100

var sprint_mod = 1
var fric = 20

var sprite_ang = 0
var turnspeed = 8

var cam_zoom

func _ready() -> void:
	cam_zoom = $Camera2D.zoom

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("boost"):
		SPEED = move_toward(SPEED, max_speed, boost_acc * delta)
	else:
		SPEED = move_toward(SPEED, base_speed, slowdown * delta)
	
	#speed_indicator
	var over_base = (clamp((SPEED - base_speed) / (max_speed - base_speed), 0, 1) * 0.4) + 1
	#print(over_base)
	$Camera2D.zoom = cam_zoom / over_base
	
	
	var direction := Input.get_vector("left","right","up","down").normalized()
	if direction != Vector2.ZERO:
		$plane.rotation = rotate_toward($plane.rotation ,direction.angle() + deg_to_rad(90), turnspeed * delta)
	
	velocity = -SPEED * Vector2.from_angle($plane.rotation + deg_to_rad(90))
	#var direction := Input.get_vector("left","right","up","down").normalized()
	#if direction != Vector2.ZERO:
		#velocity.x = direction.x * (SPEED * sprint_mod)
		#velocity.y = direction.y * (SPEED * sprint_mod)
	#else:
		#velocity.x = move_toward(velocity.x, 0, fric)
		#velocity.y = move_toward(velocity.y, 0, fric)
	#
	#if velocity != Vector2.ZERO:
		#sprite_ang = velocity.angle()
		#$ScreenshotFrom20251202162553RemovebgPreview.rotation = sprite_ang + deg_to_rad(90)
	move_and_slide()
