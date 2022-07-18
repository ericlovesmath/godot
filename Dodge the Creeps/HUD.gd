extends CanvasLayer

signal start_game

func update_score(score: int):
    $ScoreLabel.text = str(score)
    
func show_message(text: String):
    $MessageLabel.text = text
    $MessageLabel.show()
    $MessageTimer.start()
    
func show_game_over():
    show_message("Game Over")
    yield($MessageTimer, "timeout")
    $MessageLabel.text = "Dodge the Creeps"
    $MessageLabel.show()
    yield(get_tree().create_timer(1.0), "timeout") # 1 shot timer, sleep(1s)
    $Button.show()

func _on_Button_pressed():
    $Button.hide()
    emit_signal("start_game")

func _on_MessageTimer_timeout():
    $MessageLabel.hide()
