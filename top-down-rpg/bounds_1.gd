extends Area2D

var just_passed = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_exited(body: Node2D) -> void:
	if just_passed.has(body) == false:
		if abs(body.position.x) > abs(body.position.y):
			body.position.x *= -1
			if body.position.x > 0:
				body.position.x += 1
			else:
				body.position.x -= 1
			print("xpass")
		else:
			body.position.y *= -1
			print("ypass")
		just_passed.append(body)
		remove(body)


func remove(body):
	await get_tree().create_timer(0.6).timeout
	just_passed.erase(body)
