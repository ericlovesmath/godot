extends KinematicBody2D

signal player_death
signal score

const SPEED := 100

func _ready():
    $VisibilityNotifier2D.connect(
        "screen_exited",
        self,
        "_on_VisibilityNotifier2D_screen_exited"
    )
    $ScoreArea.connect("body_entered", self, "_on_ScoreArea_body_entered")

func _process(delta):
    position.x -= SPEED * delta

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()

func _on_ScoreArea_body_entered(body):
    if body.name == "Player":
        print("Hit")
        Events.emit_signal("increase_score")
