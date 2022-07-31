extends KinematicBody2D

# Brick Type 04

signal brick_break04


var health = 6

func _ready():
	$AnimatedSprite.animation = "brick04"
# warning-ignore:return_value_discarded
	$Brick04Area.connect("body_entered", self, "_is_hit_04")

func _is_hit_01(_delta):
	if (health ==  1):
		emit_signal("brick_break04")
		queue_free()
	else:
		health -= 1
		if health < 4:
			$AnimatedSprite.animation = "brick04_broke"
