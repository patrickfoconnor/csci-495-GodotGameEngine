extends Node


# Declare member variables here. Examples:
var DEFAULT_SPEED_MULTIPLIER = 650
var fresh_run = false
var current_level = 1


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
				var velocity_x = - normalized_click_location.x
				var velocity_y = normalized_click_location.y
				$Ball.velocity = Vector2(velocity_x, velocity_y)
			else:
				$Ball.velocity = event.position.normalized() * DEFAULT_SPEED_MULTIPLIER
			print("The ball velocity is ", $Ball.velocity)
			

func game_over():
	$Ball.hide()
	$Paddle.hide()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
	fresh_run = false

func level_complete():
	$HUD.show_next_level(current_level)
	current_level += 1
	$Ball.hide()
	$Paddle.hide()
	$Music.stop()
	$LevelComplete.play()

func new_game():
	$Ball.velocity = Vector2(0,0)
	$Ball.reset_position()
	$Paddle.reset_position()
	$Ball.show()
	$Paddle.show()
	$StartAim.show()
	$HUD.show_message("Get Ready \n Aim with mouse \n and \nleft click")
	$Music.play()

	
func _on_StartTimer_timeout():
	$ScoreTimer.start()

