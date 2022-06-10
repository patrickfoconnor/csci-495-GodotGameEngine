extends Area2D

# Signal when enemy is hit using Godot's signal functionality to make it work.
signal hit

# how fast the player will move
export var speed = 400
# Declare member variables here. Examples:
# Size of the game window
var screen_size



# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	# Hide the character on start
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# The player's movement vector
	var velocity = Vector2.ZERO # Init velocity to (0,0) or no movement
	# Check for the key presses
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play() # $ is shorthand for get_node(). So in the code above, 
		# $AnimatedSprite.play() is the same as get_node("AnimatedSprite").play()
	else:
		$AnimatedSprite.stop()
	# Use clamp to ensure that we are within screen bounds
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	# Make animations go the correct way based on direction of travel 
	# 	or velocity vector
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
	# See the note below about boolean assignment.
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0


func _on_Player_body_entered(_body):
	hide() # Player disappears after being hit.
	emit_signal("hit")
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
	
#  reset the player when starting a new game.
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


