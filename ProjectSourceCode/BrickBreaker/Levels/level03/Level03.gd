extends Node2D

#signal level_complete03

#var total_bricks = 1
var total_bricks = 30

# Used to signal that all bricks on level have been broken
func _process(_delta):
	if (check_bricks_left()):
		pass
	else:
		$Main.level_complete(int(get_tree().current_scene.name))
		
		
func brick_broken():
	total_bricks -= 1
	
func check_bricks_left():
	if (total_bricks == 0):
		return false
	else:
		return true

