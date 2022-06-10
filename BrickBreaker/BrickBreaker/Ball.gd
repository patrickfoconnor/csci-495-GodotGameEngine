extends KinematicBody2D

signal hit

const DEFAULT_SPEED = 0

var _speed = DEFAULT_SPEED
var velocity = Vector2(0, 0)


onready var initial_pos = position



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _ready():
	position = initial_pos
	


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.name == "Bottom":
			hide()
			emit_signal("hit")
		elif collision.collider.name == "StartAim":
			velocity = Vector2(0, 0)
			
		else:
			velocity = velocity.bounce(collision.normal) 
			velocity.x *= 1.00000000000001
			velocity.y *= 1.00000000000001
		
		

func reset_position():
	position = initial_pos

