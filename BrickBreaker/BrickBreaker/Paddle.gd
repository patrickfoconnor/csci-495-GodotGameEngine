extends KinematicBody2D


# how fast the player will move
export var speed = 500

# Declare member variables here. Examples:
# Size of the game window
var screen_size
onready var initial_pos = position


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	# Hide the character on start
	#hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	# The player's movement vector
	var velocity = Vector2.ZERO # Init velocity to (0,0) or no movement
	# Check for the key presses
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	# Use clamp to ensure that we are within screen bounds
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


#  reset the player when starting a new game.
func start(pos):
	position = pos
	show()

func reset_position():
	position = initial_pos
