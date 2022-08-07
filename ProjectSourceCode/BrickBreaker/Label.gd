extends Label


# Score var in order to define and update score
var starting_score = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_brick01_broken_score(score):
	score += 1
	text = "Score: %s" % score
	
func _on_brick02_broken_score(score):
	score += 5
	text = "Score: %s" % score
	
func _on_brick03_broken_score(score):
	score += 10
	text = "Score: %s" % score
	
func _on_brick04_broken_score(score):
	score += 20
	text = "Score: %s" % score
	
func _on_brick05_broken_score(score):
	score += 50
	text = "Score: %s" % score

func _on_brick06_broken_score(score ):
	score += 100
	text = "Score: %s" % score
