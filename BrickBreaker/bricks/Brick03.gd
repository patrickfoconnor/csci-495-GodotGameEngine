extends KinematicBody2D

# Brick Type 03

signal brick_break03

var health = 5

func _ready():
	$AnimatedSprite.animation = "brick03"
	$Brick03Area.connect("body_entered", self, "_is_hit_03")
	
func _is_hit_03(_delta):
	if (health ==  1):
		emit_signal("brick_break03")
		queue_free()
	else:
		health -= 1
		if health < 4:
			$AnimatedSprite.animation = "brick03_broke"
			

