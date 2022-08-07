extends KinematicBody2D

# Brick Type 02

signal brick_break02


var health = 4

func _ready():
	pass
# warning-ignore:return_value_discarded
	#$Brick02Area.connect("body_entered", self, "_is_hit_02")

func _is_hit_02(_delta):
	if (health ==  1):
		emit_signal("brick_break02")
		queue_free()
	else:
		health -= 1
		if health < 3:
			$AnimatedSprite.animation = "brick02_broke"
			



func _is_hit_05():
	pass # Replace with function body.
