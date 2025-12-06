extends Node2D

@export var core_world: PackedScene
@export var core_width: int

var offsets = [
	Vector2(-1,-1), Vector2(0,-1), Vector2(1,-1),
	Vector2(-1, 0), Vector2(0, 0), Vector2(1, 0),
	Vector2(-1, 1), Vector2(0, 1), Vector2(1, 1)
]
#
#var offsets = [Vector2(0,0), Vector2(1, 0), Vector2(0,1)]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in offsets:
		var new_core = core_world.instantiate()
		new_core.position = i * core_width #(core_width * 0.5)
		add_child(new_core)
		print(new_core)
	#add_child(core_world.instantiate())
	
	$Camera2D.make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
