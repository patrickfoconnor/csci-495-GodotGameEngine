extends Node2D

#signal level_complete

#var total_bricks = 1
var total_bricks = 14

# Used to signal that all bricks on level have been broken
func _process(_delta):
	if (check_bricks_left()):
		pass
	else:
		#emit_signal('level_complete')
		$Main.level_complete(int(get_tree().current_scene.name))
		
		
func brick_broken():
	total_bricks -= 1
	
func check_bricks_left():
	if (total_bricks == 0):
		return false
	else:
		return true



func _on_brick_break01():
	$Main/TopBar/ScoreBoard._on_brick01_broken_score()
	#brick_broken()

func _on_brick_break02():
	$Main/TopBar/ScoreBoard._on_brick02_broken_score()
	#brick_broken()
