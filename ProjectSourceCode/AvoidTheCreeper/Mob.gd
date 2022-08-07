extends RigidBody2D


# Declare member variables here. Examples:



# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = true
	# get an array of all available animations ["walk", "swim", "fly"]
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	# Randomize it so that it is more fun
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Delete mobs when they exit screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
