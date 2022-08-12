extends Control

var score := 0

func _ready():
    score = 0
    _update_display()
    Events.connect("increase_score", self, "_on_increase_score")

func _on_increase_score():
    score += 1
    _update_display()
    
func _update_display():
    $ScoreLabel.text = str(score)
