extends Camera2D

@export var object_to_follow:Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = object_to_follow.position
