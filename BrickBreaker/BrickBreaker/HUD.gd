extends CanvasLayer

signal start_game 


# Called when the node enters the scene tree for the first time.
func _ready():
	$NextLevelButton.hide()


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

	
func show_game_over():
	show_message("Game Over")
	# Wait for MessageTimer has counted down
	yield($MessageTimer, "timeout")
	$Message.text = "Break them \n bricks!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	
func show_next_level(current_level):
	var current_level_message = "Level " + str(current_level) + " Complete !"
	show_message(current_level_message)
	# Wait for MessageTimer has counted down
	yield($MessageTimer, "timeout")
	$Message.text = "Continue to Next..."
	$Message.show()
	# Make a one-shot timer and wait for it to finish
	yield(get_tree().create_timer(1), "timeout")
	$NextLevelButton.show()

func _on_MessageTimer_timeout():
	$Message.hide()


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
