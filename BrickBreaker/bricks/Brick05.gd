extends KinematicBody2D

# Brick Type 05

signal brick_break05


var health = 7

func _ready():
	#$AnimatedSprite.animation = "brick05"
# warning-ignore:return_value_discarded
	$Brick02Area.connect("body_entered", self, "_is_hit_05")

func _is_hit_05(_delta):
	if (health ==  1):
		emit_signal("brick_break05")
		queue_free()
	else:
		health -= 1
		if health < 3:
			$AnimatedSprite.animation = "brick05_broke"
			

