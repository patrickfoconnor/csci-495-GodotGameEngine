extends KinematicBody2D

# Brick Type 06

signal brick_break06

var health = 8

func _ready():
	#$AnimatedSprite.animation = "brick06"
	$Brick03Area.connect("body_entered", self, "_is_hit_06")
	
func _is_hit_03(_delta):
	if (health ==  1):
		emit_signal("brick_break06")
		queue_free()
	else:
		health -= 1
		if health < 4:
			$AnimatedSprite.animation = "brick06_broke"
			

