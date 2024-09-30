extends CharacterBody2D
class_name bird

@export var gravity = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
		#gravity
	if not is_on_floor():
		velocity.y = velocity.y + gravity + delta
	
	move_and_slide()
