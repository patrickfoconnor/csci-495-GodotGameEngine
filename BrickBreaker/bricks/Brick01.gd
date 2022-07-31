extends KinematicBody2D

# Brick Type 01

signal brick_break01


var health = 3

func _ready():
	$AnimatedSprite.animation = "brick01"
# warning-ignore:return_value_discarded
	$Brick01Area.connect("body_entered", self, "_is_hit_01")

func _is_hit_01(_delta):
	if (health ==  1):
		emit_signal("brick_break01")
		queue_free()
	else:
		health -= 1
		if health < 2:
			$AnimatedSprite.animation = "brick01_broke"
