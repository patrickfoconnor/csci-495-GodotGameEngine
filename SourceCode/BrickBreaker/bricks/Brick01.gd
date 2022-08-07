extends KinematicBody2D

# Brick Type 01

signal brick_break01


var health = 3
var fresh_connect_brick01 = true

func _ready():
	
# warning-ignore:return_value_discarded
	if fresh_connect_brick01:
		#$Brick01Area.connect("body_entered", self, "_is_hit_01")
		fresh_connect_brick01 = false

func _is_hit_01(_delta):
	if (health ==  1):
		emit_signal("brick_break01")
		queue_free()
	else:
		health -= 1
		if health < 2:
			$AnimatedSprite.animation = "brick01_broke"


func _is_hit_04():
	pass # Replace with function body.
