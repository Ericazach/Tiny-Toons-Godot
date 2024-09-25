class_name Player

extends CharacterBody2D

@export var gravity = 100
@export var jump_speed = 100
@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	
	#horizontal
	
	var direction = Input.get_axis("left", "right")
	velocity.x = speed * direction
	
	#gravity
	if not is_on_floor():
		velocity.y = velocity.y + gravity + delta
		
	
	#jump
	
	var jump_pressed = Input.is_action_just_pressed("jump")
	
	if jump_pressed:
		velocity.y = velocity.y - jump_speed
		
	move_and_slide()
