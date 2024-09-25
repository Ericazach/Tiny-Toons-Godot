class_name Player

extends CharacterBody2D

@export var gravity = 100
@export var jump_speed = 100
@export var speed = 100

@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D


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
	
	if direction != 0:
		sprite.flip_h = (direction == -1)
	
	#gravity
	if not is_on_floor():
		velocity.y = velocity.y + gravity + delta
		
	
	#jump
	
	var jump_pressed = Input.is_action_just_pressed("jump")
	
	if jump_pressed:
		velocity.y = velocity.y - jump_speed
		
	move_and_slide()
	
	update_animation(direction)
	
func update_animation(direction):
	if is_on_floor():
		if direction == 0:
			ap.play("idle")
		else:
			ap.play("run")
	else:
		if velocity.y < 0:
			ap.play("jump")
		elif velocity.y > 0:
			ap.play("fall")
