extends Node


# Declare member variables here. Examples:
var DEFAULT_SPEED_MULTIPLIER = 650
var fresh_run = false
var starting_level = 1
var current_level = 1
var max_levels = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	#set ball velocity based on where mouse click is
	#$Ball.velocity = Vector2(0,0)

func _input(event):
	if event is InputEventMouseButton && !fresh_run:
		fresh_run = true
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("Left button was clicked at ", event.position)
			$StartAim.hide()
			if event.position.x < 400:
				var normalized_click_location = event.position.normalized() * DEFAULT_SPEED_MULTIPLIER
				var velocity_x = -3 * normalized_click_location.x
				var velocity_y = normalized_click_location.y
				$Ball.velocity = Vector2(velocity_x, velocity_y)
			else:
				$Ball.velocity = event.position.normalized() * DEFAULT_SPEED_MULTIPLIER
			print("The ball velocity is ", $Ball.velocity)
			

# Need to make it 
func game_over():
	$Ball.hide()
	$Paddle.hide()
	$HUD.show_game_over()
	$HUD/MessageTimer
	$Music.stop()
	$DeathSound.play()
	fresh_run = false
	new_game()
	
func next_level():
	var path_to_next_level = ("res://Levels/")
	var next_level = "Level"
	if current_level > max_levels:
		# Declare game won and let user know
		$GameComplete.play()
	else:
		# If below ten add 0 and current level
		if current_level < 10:
			next_level += "0"+str(current_level) 
		# If above ten just add the two digit number
		else:
			next_level += str(current_level)
		path_to_next_level += next_level + "/" + next_level + ".tscn"
	# warning-ignore:return_value_discarded
		get_tree().change_scene(path_to_next_level)

func level_complete(completed_level):
	$HUD.show_message("Level " + str(current_level) + "completed")
	current_level += completed_level
	$Ball.hide()
	$Paddle.hide()
	$Music.stop()
	$LevelComplete.play()
	
	next_level()
	

func new_game():
	$Ball.velocity = Vector2(0,0)
	$Ball.reset_position()
	$Paddle.reset_position()
	$Ball.show()
	$Paddle.show()
	$StartAim.show()
	$HUD.show_message("Get Ready \n Aim with mouse \n and \nleft click")
	get_tree().change_scene("res://Levels/level01/Level01.tscn")
	#$Music.play()

	
func _on_StartTimer_timeout():
	$ScoreTimer.start()
